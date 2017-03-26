//
//  CollectionUtilities.m
//  Pods
//
//  Created by László Teveli on 2017. 03. 21..
//
//

#import "CollectionUtilities.h"

@interface GeneralUtilities ()

@property (nonatomic, strong) id<NSObject> object;

@end

@implementation GeneralUtilities

+ (instancetype)utilitiesWithObject:(id<NSObject>)object
{
    return [[self alloc] initWithObject:object];
}

- (instancetype)initWithObject:(id<NSObject>)object
{
    self = [super init];
    if (self) {
        self.object = object;
    }
    return self;
}

- (id)apply:(void (^)(id))block
{
    id object = self.object;
    block(object);
    return object;
}

@end

@interface CollectionUtilities ()

@property (nonatomic, strong) id<Collection> object;

@end

@implementation CollectionUtilities

- (id)mapToAnother:(void(^)(id item, id<MutableCollection> collection))block
{
    id<MutableCollection> mutableCollection = [[self.object.class classForMutableCounterPart] newWithCapacity:self.object.count];
    
    [self forEach:^(id item) {
        block(item, mutableCollection);
    }];
    
    return mutableCollection.copy;
}

- (id)map:(id(^)(id item))block
{
    return [self mapToAnother:^(id item, id<MutableCollection> collection) {
        id mapped = block(item);
        [collection addObject:mapped];
    }];
}

- (id)filter:(BOOL (^)(id))block
{
    return [self mapToAnother:^(id item, id<MutableCollection> collection) {
        BOOL isMatching = block(item);
        if (isMatching) {
            [collection addObject:item];
        }
    }];
}

- (BOOL)contains:(BOOL (^)(id))block
{
    for (id item in self.object) {
        if (block(item)) {
            return YES;
        }
    }
    return NO;
}

- (BOOL)all:(BOOL (^)(id))block
{
    for (id item in self.object) {
        if (!block(item)) {
            return NO;
        }
    }
    return YES;
}

- (BOOL)none:(BOOL (^)(id))block
{
    for (id item in self.object) {
        if (block(item)) {
            return NO;
        }
    }
    return YES;
}

- (id)reduce:(id(^)(id, id))block withInitialValue:(id)start
{
    __block id mutatingValue = start;
    [self forEach:^(id item) {
        mutatingValue = block(mutatingValue, item);
    }];
    return mutatingValue;
}

- (id)flattened
{
    return [self mapToAnother:^(id item, id<MutableCollection> collection) {
        if ([item isKindOfClass:[collection.class classToFlatten]]) {
            for (id current in item) {
                CollectionUtilities* utilsForItem = [CollectionUtilities utilitiesWithObject:current];
                [collection addObject:[utilsForItem flattened]];
            }
        } else {
            [collection addObject:item];
        }
    }];
}

- (id)merge:(id)collection
{
    id<MutableCollection> mutableCollection = [self.object mutableCopy];
    
    for (id item in collection) {
        [mutableCollection addObject:item];
    }
    
    return mutableCollection.copy;
}

- (NSDictionary *)groupByUsingFirst:(id (^)(id))block
{
    NSMutableDictionary* dictionary = [NSMutableDictionary dictionaryWithCapacity:self.object.count];
    
    [self forEach:^(id item) {
        id key = block(item);
        if (dictionary[key] == nil) {
            dictionary[key] = item;
        }
    }];
    
    return dictionary.copy;
}

- (NSDictionary*)groupByUsingLast:(id (^)(id))block
{
    NSMutableDictionary* dictionary = [NSMutableDictionary dictionaryWithCapacity:self.object.count];
    
    [self forEach:^(id item) {
        id key = block(item);
        dictionary[key] = item;
    }];
    
    return dictionary.copy;
}

- (NSDictionary<id,NSArray *> *)associateBy:(id (^)(id))block
{
    NSMutableDictionary* dictionary = [NSMutableDictionary dictionaryWithCapacity:self.object.count];
    
    [self forEach:^(id item) {
        id key = block(item);
        NSArray* items = dictionary[key] ?: @[];
        items = [items arrayByAddingObject:item];
        dictionary[key] = items;
    }];
    
    return dictionary.copy;
}

- (void)forEach:(void (^)(id))block
{
    for (id item in self.object) {
        block(item);
    }
}

- (double)minValue:(double (^)(id))block
{
    return [[self reduce:^id(NSNumber* min, id item) {
        double value = block(item);
        return min == nil || value < min.doubleValue ? @(value) : min;
    } withInitialValue:nil] doubleValue];
}

- (double)maxValue:(double (^)(id))block
{
    return [[self reduce:^id(NSNumber* max, id item) {
        double value = block(item);
        return max == nil || value > max.doubleValue ? @(value) : max;
    } withInitialValue:nil] doubleValue];
}

- (double)sum:(double (^)(id))block
{
    return [[self reduce:^id(NSNumber* sum, id item) {
        double value = block(item);
        return @(sum.doubleValue + value);
    } withInitialValue:@0] doubleValue];
}

- (id)minItems:(double (^)(id))block
{
    __block NSNumber* minValue = nil;
    return [self mapToAnother:^(id item, id<MutableCollection> collection) {
        double value = block(item);
        if (minValue == nil) {
            minValue = @(value);
        }
        if (value == minValue.doubleValue) {
            [collection addObject:item];
        } else if (value < minValue.doubleValue) {
            [collection removeAllObjects];
            [collection addObject:item];
        }
    }];
}

- (id)maxItems:(double (^)(id))block
{
    __block NSNumber* maxValue = nil;
    return [self mapToAnother:^(id item, id<MutableCollection> collection) {
        double value = block(item);
        if (maxValue == nil) {
            maxValue = @(value);
        }
        if (value == maxValue.doubleValue) {
            [collection addObject:item];
        } else if (value > maxValue.doubleValue) {
            [collection removeAllObjects];
            [collection addObject:item];
        }
    }];
}

- (id)flatMap:(id (^)(id))block
{
    return [self mapToAnother:^(id item, id<MutableCollection> collection) {
        id mapped = block(item);
        if ([mapped isKindOfClass:[collection.class classToFlatten]]) {
            for (id current in mapped) {
                [collection addObject:current];
            }
        } else {
            [collection addObject:mapped];
        }
    }];
}

@end

@interface ArrayUtilities ()

@property (nonatomic, strong) NSArray* object;

@end

@implementation ArrayUtilities

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
    return [self mapToAnother:^(id item, id<MutableCollection> collection) {
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

@end

@implementation Pair

@end

@interface DictionaryUtilities ()

@property (nonatomic, strong) NSDictionary* object;

@end

@implementation DictionaryUtilities

- (id)mapToAnother:(void(^)(id key, id value, NSMutableDictionary* mutableDictionary))block
{
    NSMutableDictionary* mutableDictionary = [NSMutableDictionary dictionaryWithCapacity:self.object.count];
    
    [self forEach:^(id key, id value) {
        block(key, value, mutableDictionary);
    }];
    
    return mutableDictionary.copy;
}

- (NSDictionary*)map:(Pair*(^)(id key, id value))block
{
    return [self mapToAnother:^(id key, id value, NSMutableDictionary *mutableDictionary) {
        Pair* pair = block(key, value);
        mutableDictionary[pair.key] = pair.value;
    }];
}

- (NSDictionary*)flatMap:(Pair*(^)(id key, id value))block
{
    return [self mapToAnother:^(id key, id value, NSMutableDictionary *mutableDictionary) {
        Pair* pair = block(key, value);
        if ([pair.value isKindOfClass:[mutableDictionary.class classToFlatten]]) {
            for (id currentKey in pair.value) {
                id currentValue = pair.value[currentKey];
                mutableDictionary[currentKey] = currentValue;
            }
        } else {
            mutableDictionary[pair.key] = pair.value;
        }
    }];
}

- (NSDictionary*)flattened
{
    return [self mapToAnother:^(id key, id value, NSMutableDictionary<Counterpart>* mutableDictionary) {
        if ([value isKindOfClass:[mutableDictionary.class classToFlatten]]) {
            for (id currentKey in value) {
                id currentValue = value[currentKey];
                CollectionUtilities* utilsForItem = [CollectionUtilities utilitiesWithObject:currentValue];
                mutableDictionary[currentKey] = [utilsForItem flattened];
            }
        } else {
            mutableDictionary[key] = value;
        }
    }];
}

- (NSDictionary*)merge:(NSDictionary*)other
{
    NSMutableDictionary* mutableDictionary = [self.object mutableCopy];
    [mutableDictionary addEntriesFromDictionary:other];
    return mutableDictionary.copy;
}

- (void)forEach:(void(^)(id key, id value))block
{
    for (id key in self.object) {
        block(key, self.object[key]);
    }
}

- (id)filter:(BOOL(^)(id key, id value))block
{
    return [self mapToAnother:^(id key, id value, NSMutableDictionary *mutableDictionary) {
        if (block(key, value)) {
            mutableDictionary[key] = value;
        }
    }];
}

- (BOOL)contains:(BOOL (^)(id))block
{
    for (id key in self.object) {
        id item = self.object[key];
        if (block(item)) {
            return YES;
        }
    }
    return NO;
}

- (BOOL)all:(BOOL (^)(id))block
{
    for (id key in self.object) {
        id item = self.object[key];
        if (!block(item)) {
            return NO;
        }
    }
    return YES;
}

- (BOOL)none:(BOOL (^)(id))block
{
    for (id key in self.object) {
        id item = self.object[key];
        if (block(item)) {
            return NO;
        }
    }
    return YES;
}

- (id)reduce:(id(^)(id previousValue, id key, id value))block withInitialValue:(id)start
{
    __block id mutatingValue = start;
    [self forEach:^(id key, id value) {
        mutatingValue = block(mutatingValue, key, value);
    }];
    return mutatingValue;
}

@end
