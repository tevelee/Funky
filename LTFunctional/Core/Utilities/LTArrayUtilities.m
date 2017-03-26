//
//  LTArrayUtilities.m
//  Pods
//
//  Created by László Teveli on 2017. 03. 26..
//
//

#import "LTArrayUtilities.h"

@interface LTArrayUtilities ()

@property (nonatomic, strong) NSArray* object;

@end

@implementation LTArrayUtilities

- (NSInteger)minIndex
{
    return 0;
}

- (NSInteger)maxIndex
{
    return [self.object count] - 1;
}

- (id)first:(BOOL (^)(id))block
{
    for (id item in self.object) {
        if (block(item)) {
            return item;
        }
    }
    return nil;
}

- (id)last:(BOOL (^)(id))block
{
    return [self.reversed first:block];
}

- (id)take:(BOOL(^)(id item))block;
{
    NSMutableArray* mutableArray = [NSMutableArray arrayWithCapacity:self.object.count];
    for (id item in self.object) {
        if (block(item)) {
            [mutableArray addObject:item];
        } else {
            break;
        }
    }
    return mutableArray.copy;
}

- (id)takeLast:(BOOL(^)(id item))block;
{
    NSMutableArray* mutableArray = [NSMutableArray arrayWithCapacity:self.object.count];
    for (id item in self.object) {
        if (block(item)) {
            [mutableArray addObject:item];
        } else {
            [mutableArray removeAllObjects];
        }
    }
    return mutableArray.copy;
}

- (id)untilValue:(id)value
{
    NSMutableArray* mutableArray = [NSMutableArray arrayWithCapacity:self.object.count];
    for (id item in self.object) {
        if ([item isEqual:value]) {
            break;
        } else {
            [mutableArray addObject:item];
        }
    }
    return mutableArray.copy;
}

- (id)untilIndex:(NSInteger)index
{
    NSMutableArray* mutableArray = [NSMutableArray arrayWithCapacity:self.object.count];
    
    NSUInteger lastIndex = MIN(index, self.object.count - 1);
    for (NSUInteger i = 0; i < lastIndex; ++i) {
        id item = self.object[i];
        [mutableArray addObject:item];
    }
    
    return mutableArray.copy;
}

- (id)fromValue:(id)value
{
    NSMutableArray* mutableArray = nil;
    for (id item in self.object) {
        if ([item isEqual:value]) {
            mutableArray = [NSMutableArray arrayWithCapacity:self.object.count];
        } else {
            [mutableArray addObject:item];
        }
    }
    return mutableArray.copy;
}

- (id)fromIndex:(NSInteger)index
{
    NSMutableArray* mutableArray = [NSMutableArray arrayWithCapacity:self.object.count];
    
    NSUInteger firstIndex = MAX(index, 0);
    for (NSUInteger i = firstIndex; i < self.object.count - 1; ++i) {
        id item = self.object[i];
        [mutableArray addObject:item];
    }
    
    return mutableArray.copy;
}

- (id)fromValue:(id)from untilValue:(id)until
{
    NSMutableArray* mutableArray = nil;
    for (id item in self.object) {
        if ([item isEqual:from]) {
            mutableArray = [NSMutableArray arrayWithCapacity:self.object.count];
        } else if ([item isEqual:until]) {
            break;
        } else {
            [mutableArray addObject:item];
        }
    }
    return mutableArray.copy;
}

- (id)fromIndex:(NSInteger)from untilIndex:(NSInteger)until
{
    NSMutableArray* mutableArray = [NSMutableArray arrayWithCapacity:self.object.count];
    
    NSUInteger firstIndex = MAX(from, 0);
    NSUInteger lastIndex = MIN(until, self.object.count - 1);
    
    for (NSUInteger i = firstIndex; i < lastIndex; ++i) {
        id item = self.object[i];
        [mutableArray addObject:item];
    }
    
    return mutableArray.copy;
}

- (id)unique
{
    return [self mapToAnother:^(id item, id<LTMutableCollection> collection) {
        if (![self contains:^BOOL(id current) {
            return [item isEqual:current];
        }]) {
            [collection addObject:item];
        }
    }];
}

- (id)reversed
{
    return [self.object.reverseObjectEnumerator allObjects];
}

- (id)shuffled
{
    NSMutableArray* mutableArray = [self.object mutableCopy];
    
    [self forEachWithIndex:^(NSUInteger index, id item) {
        NSInteger remainingCount = self.object.count - index;
        NSInteger exchangeIndex = index + arc4random_uniform((u_int32_t )remainingCount);
        [mutableArray exchangeObjectAtIndex:index withObjectAtIndex:exchangeIndex];
    }];
    
    return mutableArray.copy;
}

- (void)forEachWithIndex:(void(^)(NSUInteger index, id item))block
{
    for (NSUInteger i = 0; i < self.object.count - 1; ++i) {
        block(i, self.object[i]);
    }
}

#pragma mark - Sort

- (NSComparator)lexicographicalComparator
{
    return [self propertyComparator:nil];
}

- (NSComparator)propertyComparator:(LTSortComparablePropertyProviderBlock)propertyBlock
{
    return ^NSComparisonResult(id obj1, id obj2) {
        id<LTSortComparable> prop1 = propertyBlock ? propertyBlock(obj1) : obj1;
        id<LTSortComparable> prop2 = propertyBlock ? propertyBlock(obj2) : obj2;
        
        if ([prop1 isEqual:prop2]) {
            return NSOrderedSame;
        } else if ([prop1 respondsToSelector:@selector(compare:)]) {
            return [prop1 compare:prop2];
        } else {
            return prop1 < prop2 ? NSOrderedAscending : NSOrderedDescending;
        }
    };
}

- (NSComparator)prioritizedComparator:(NSArray<NSComparator>*)comparators
{
    return ^NSComparisonResult(id obj1, id obj2) {
        for (NSComparator comparator in comparators) {
            NSComparisonResult result = comparator(obj1, obj2);
            if (result != NSOrderedSame) {
                return result;
            }
        }
        return NSOrderedSame;
    };
}

- (NSComparator)comparatorWithBuckets:(NSArray<LTSortingBucket*>*)buckets
{
    return [self comparatorWithBuckets:buckets defaultInnerBucketComparator:[self lexicographicalComparator]];
}

- (NSComparator)comparatorWithBuckets:(NSArray<LTSortingBucket*>*)buckets defaultInnerBucketComparator:(NSComparator)defaultInnerBucketComparator
{
    NSIndexSet* collectorBuckets = [buckets indexesOfObjectsPassingTest:^BOOL(LTSortingBucket* bucket, NSUInteger index, BOOL* stop) {
        return bucket.isCollectorBucket;
    }];
    
    NSInteger indexOfCollectorBucket = collectorBuckets.firstIndex;
    if (indexOfCollectorBucket == NSNotFound) {
        indexOfCollectorBucket = buckets.count;
        buckets = [buckets arrayByAddingObject:[LTSortingBucket bucketWithAllTheRest]];
    }
    
    return ^NSComparisonResult(id obj1, id obj2) {
        NSInteger bucketIndexFor1 = [self indexOfObject:obj1 inBuckets:buckets indexOfCollectorBucket:indexOfCollectorBucket];
        NSInteger bucketIndexFor2 = [self indexOfObject:obj2 inBuckets:buckets indexOfCollectorBucket:indexOfCollectorBucket];
        if (bucketIndexFor1 == bucketIndexFor2) {
            LTSortingBucket* bucket = [buckets objectAtIndex:bucketIndexFor1];
            NSComparator innerBucketComparator = bucket.innerBucketComparator ?: defaultInnerBucketComparator;
            return innerBucketComparator(obj1, obj2);
        } else {
            return [@(bucketIndexFor1) compare:@(bucketIndexFor2)];
        }
    };
}

- (NSInteger)indexOfObject:(id)object inBuckets:(NSArray<LTSortingBucket*>*)buckets indexOfCollectorBucket:(NSInteger)indexOfCollectorBucket
{
    NSInteger index = [buckets indexOfObjectPassingTest:^BOOL(LTSortingBucket* bucket, NSUInteger idx, BOOL* stop) {
        if (bucket.filterBlock && bucket.filterBlock(object)) {
            *stop = YES;
            return YES;
        } else {
            return NO;
        }
    }];
    return index == NSNotFound ? indexOfCollectorBucket : index;
}

- (NSComparator)boolComparator:(BOOL(^)(id obj1, id obj2))comparator
{
    return ^NSComparisonResult(id obj1, id obj2) {
        BOOL resultOneWay = comparator(obj1, obj2);
        BOOL resultOtherWay = comparator(obj2, obj1);
        if (resultOneWay && !resultOtherWay) {
            return NSOrderedAscending;
        } else if (resultOtherWay && !resultOneWay) {
            return NSOrderedDescending;
        } else {
            return NSOrderedSame;
        }
    };
}

#pragma mark - Filter

- (LTFilterPredicate)predicateForEquality:(id)object
{
    return ^BOOL(id other) {
        return [other isEqual:object];
    };
}

- (LTFilterPredicate)predicateForSubclass:(Class)objectClass
{
    return ^BOOL(id other) {
        return [other isKindOfClass:objectClass];
    };
}

- (LTFilterPredicate)predicateForClass:(Class)objectClass
{
    return ^BOOL(id other) {
        return [other isMemberOfClass:objectClass];
    };
}

- (LTFilterPredicate)predicateForSelector:(SEL)selector
{
    return ^BOOL(id other) {
        return [other respondsToSelector:selector];
    };
}

@end
