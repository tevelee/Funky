//
//  LTSort.m
//  Pods
//
//  Created by László Teveli on 2017. 03. 24..
//
//

#import "LTSort.h"

@implementation LTSortingBucket

+ (instancetype)bucketWithBlock:(SortingBucketFilterBlock)filterBlock
{
    LTSortingBucket* bucket = [self new];
    bucket.filterBlock = [filterBlock copy];
    return bucket;
}

+ (instancetype)bucketWithAllTheRest
{
    LTSortingBucket* bucket = [self new];
    return bucket;
}

- (BOOL)isCollectorBucket
{
    return self.filterBlock == nil;
}

@end

@implementation NSArray (Buckets)

+ (NSComparator)lexicographicalComparator
{
    return [self propertyComparator:nil];
}

+ (NSComparator)propertyComparator:(ComparablePropertyProviderBlock)propertyBlock
{
    return ^NSComparisonResult(id obj1, id obj2) {
        id<Comparable> prop1 = propertyBlock ? propertyBlock(obj1) : obj1;
        id<Comparable> prop2 = propertyBlock ? propertyBlock(obj2) : obj2;
        
        if ([prop1 isEqual:prop2]) {
            return NSOrderedSame;
        } else if ([prop1 respondsToSelector:@selector(compare:)]) {
            return [prop1 compare:prop2];
        } else {
            return prop1 < prop2 ? NSOrderedAscending : NSOrderedDescending;
        }
    };
}

+ (NSComparator)prioritizedComparator:(NSArray<NSComparator>*)comparators
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

+ (NSComparator)comparatorWithBuckets:(NSArray<LTSortingBucket*>*)buckets
{
    return [self comparatorWithBuckets:buckets defaultInnerBucketComparator:[NSArray lexicographicalComparator]];
}

+ (NSComparator)comparatorWithBuckets:(NSArray<LTSortingBucket*>*)buckets defaultInnerBucketComparator:(NSComparator)defaultInnerBucketComparator
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

+ (NSInteger)indexOfObject:(id)object inBuckets:(NSArray<LTSortingBucket*>*)buckets indexOfCollectorBucket:(NSInteger)indexOfCollectorBucket
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

+ (NSComparator)boolComparator:(BOOL(^)(id obj1, id obj2))comparator
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

@end
