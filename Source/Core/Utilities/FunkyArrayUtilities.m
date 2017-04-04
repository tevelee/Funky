//
//  FunkyArrayUtilities.m
//  Pods
//
//  Created by László Teveli on 2017. 03. 26..
//
//

#import "FunkyArrayUtilities.h"

@interface FunkyArrayUtilities ()

@property (nonatomic, strong) NSArray* object;

@end

@implementation FunkyArrayUtilities

- (id)mapToAnotherWithIndex:(void(^)(NSUInteger index, id item, id<FunkyMutableCollection> collection))block
{
    id<FunkyMutableCollection> mutableCollection = [[self.object.class classForMutableCounterPart] newWithCapacity:self.object.count];
    
    [self forEachWithIndex:^(NSUInteger index, id item) {
        block(index, item, mutableCollection);
    }];
    
    return mutableCollection.copy;
}

- (NSUInteger)firstIndex
{
    return 0;
}

- (NSUInteger)lastIndex
{
    return [self.object count] - 1;
}

- (NSArray*)mapWithIndex:(id (^)(NSUInteger, id))block
{
    return [self mapToAnotherWithIndex:^(NSUInteger index, id item, id<FunkyMutableCollection> collection) {
        id mapped = block(index, item);
        [collection addObject:mapped];
    }];
}

- (NSArray*)flatMapWithIndex:(id (^)(NSUInteger, id))block
{
    return [self mapToAnotherWithIndex:^(NSUInteger index, id item, id<FunkyMutableCollection> collection) {
        id mapped = block(index, item);
        if ([mapped isKindOfClass:[collection.class classToFlatten]]) {
            for (id current in mapped) {
                [collection addObject:current];
            }
        } else {
            [collection addObject:mapped];
        }
    }];
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

- (NSUInteger)firstIndex:(BOOL (^)(id))block
{
    for (NSUInteger i = 0; i < self.object.count - 1; ++i) {
        id item = self.object[i];
        if (block(item)) {
            return i;
        }
    }
    return NSNotFound;
}

- (id)last:(BOOL (^)(id))block
{
    FunkyArrayUtilities* utilities = [FunkyArrayUtilities utilitiesWithObject:self.reversed];
    return [utilities first:block];
}

- (NSUInteger)lastIndex:(BOOL (^)(id))block
{
    __block NSUInteger lastMatching = NSNotFound;
    [self forEachWithIndex:^(NSUInteger index, id item) {
        if (block(item)) {
            lastMatching = index;
        }
    }];
    return lastMatching;
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

- (NSArray*)takeLast:(BOOL(^)(id item))block;
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

- (NSArray*)fromValueExclusive:(id)value
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

- (NSArray*)fromValueInclusive:(id)value
{
    NSMutableArray* mutableArray = nil;
    for (id item in self.object) {
        if ([item isEqual:value]) {
            mutableArray = [NSMutableArray arrayWithCapacity:self.object.count];
        }
        [mutableArray addObject:item];
    }
    return mutableArray.copy;
}

- (NSArray*)fromIndexExclusive:(NSInteger)index
{
    NSMutableArray* mutableArray = [NSMutableArray arrayWithCapacity:self.object.count];
    
    NSUInteger firstIndex = MAX(index + 1 + (index < 0 ? self.object.count : 0), 0);
    for (NSUInteger i = firstIndex; i < self.object.count; ++i) {
        id item = self.object[i];
        [mutableArray addObject:item];
    }
    
    return mutableArray.copy;
}

- (NSArray*)fromIndexInclusive:(NSInteger)index
{
    NSMutableArray* mutableArray = [NSMutableArray arrayWithCapacity:self.object.count];
    
    NSUInteger firstIndex = MAX(index + (index < 0 ? self.object.count : 0), 0);
    for (NSUInteger i = firstIndex; i < self.object.count; ++i) {
        id item = self.object[i];
        [mutableArray addObject:item];
    }
    
    return mutableArray.copy;
}

- (NSArray*)untilValueExclusive:(id)value
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

- (NSArray*)untilValueInclusive:(id)value
{
    NSMutableArray* mutableArray = [NSMutableArray arrayWithCapacity:self.object.count];
    for (id item in self.object) {
        [mutableArray addObject:item];
        if ([item isEqual:value]) {
            break;
        }
    }
    return mutableArray.copy;
}

- (NSArray*)untilIndexExclusive:(NSInteger)index
{
    NSMutableArray* mutableArray = [NSMutableArray arrayWithCapacity:self.object.count];
    
    NSUInteger lastIndex = MIN(index - 1 + (index < 0 ? self.object.count : 0), self.object.count);
    for (NSUInteger i = 0; i <= lastIndex; ++i) {
        id item = self.object[i];
        [mutableArray addObject:item];
    }
    
    return mutableArray.copy;
}

- (NSArray*)untilIndexInclusive:(NSInteger)index
{
    NSMutableArray* mutableArray = [NSMutableArray arrayWithCapacity:self.object.count];
    
    NSUInteger lastIndex = MIN(index + (index < 0 ? self.object.count : 0), self.object.count);
    for (NSUInteger i = 0; i <= lastIndex; ++i) {
        id item = self.object[i];
        [mutableArray addObject:item];
    }
    
    return mutableArray.copy;
}

- (NSArray*)fromValueExclusive:(id)from untilValueExclusive:(id)until
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

- (NSArray*)fromValueExclusive:(id)from untilValueInclusive:(id)until
{
    NSMutableArray* mutableArray = nil;
    for (id item in self.object) {
        if ([item isEqual:from]) {
            mutableArray = [NSMutableArray arrayWithCapacity:self.object.count];
        } else {
            [mutableArray addObject:item];
            if ([item isEqual:until]) {
                break;
            }
        }
    }
    return mutableArray.copy;
}

- (NSArray*)fromValueInclusive:(id)from untilValueExclusive:(id)until
{
    NSMutableArray* mutableArray = nil;
    for (id item in self.object) {
        if ([item isEqual:from]) {
            mutableArray = [NSMutableArray arrayWithCapacity:self.object.count];
            [mutableArray addObject:item];
        } else if ([item isEqual:until]) {
            break;
        } else {
            [mutableArray addObject:item];
        }
    }
    return mutableArray.copy;
}

- (NSArray*)fromValueInclusive:(id)from untilValueInclusive:(id)until
{
    NSMutableArray* mutableArray = nil;
    for (id item in self.object) {
        if ([item isEqual:from]) {
            mutableArray = [NSMutableArray arrayWithCapacity:self.object.count];
        }
        
        [mutableArray addObject:item];
        
        if ([item isEqual:until]) {
            break;
        }
    }
    return mutableArray.copy;
}

- (NSArray*)fromIndexExclusive:(NSInteger)from untilIndexExclusive:(NSInteger)until
{
    NSMutableArray* mutableArray = [NSMutableArray arrayWithCapacity:self.object.count];
    
    NSUInteger firstIndex = MAX(from + 1 + (from < 0 ? self.object.count : 0), 0);
    NSUInteger lastIndex = MIN(until - 1 + (until < 0 ? self.object.count : 0), self.object.count);

    for (NSUInteger i = firstIndex; i <= lastIndex; ++i) {
        id item = self.object[i];
        [mutableArray addObject:item];
    }
    
    return mutableArray.copy;
}

- (NSArray*)fromIndexExclusive:(NSInteger)from untilIndexInclusive:(NSInteger)until
{
    NSMutableArray* mutableArray = [NSMutableArray arrayWithCapacity:self.object.count];
    
    NSUInteger firstIndex = MAX(from + 1 + (from < 0 ? self.object.count : 0), 0);
    NSUInteger lastIndex = MIN(until + (until < 0 ? self.object.count : 0), self.object.count);

    for (NSUInteger i = firstIndex; i <= lastIndex; ++i) {
        id item = self.object[i];
        [mutableArray addObject:item];
    }
    
    return mutableArray.copy;
}

- (NSArray*)fromIndexInclusive:(NSInteger)from untilIndexExclusive:(NSInteger)until
{
    NSMutableArray* mutableArray = [NSMutableArray arrayWithCapacity:self.object.count];
    
    NSUInteger firstIndex = MAX(from + (from < 0 ? self.object.count : 0), 0);
    NSUInteger lastIndex = MIN(until - 1 + (until < 0 ? self.object.count : 0), self.object.count);
    
    for (NSUInteger i = firstIndex; i <= lastIndex; ++i) {
        id item = self.object[i];
        [mutableArray addObject:item];
    }
    
    return mutableArray.copy;
}

- (NSArray*)fromIndexInclusive:(NSInteger)from untilIndexInclusive:(NSInteger)until;
{
    NSMutableArray* mutableArray = [NSMutableArray arrayWithCapacity:self.object.count];
    
    NSUInteger firstIndex = MAX(from + (from < 0 ? self.object.count : 0), 0);
    NSUInteger lastIndex = MIN(until + (until < 0 ? self.object.count : 0), self.object.count);
    
    for (NSUInteger i = firstIndex; i <= lastIndex; ++i) {
        id item = self.object[i];
        [mutableArray addObject:item];
    }
    
    return mutableArray.copy;
}

- (NSArray*)unique
{
    return [self mapToAnother:^(id item, id<FunkyMutableCollection> collection) {
        FunkyArrayUtilities* utils = [FunkyArrayUtilities utilitiesWithObject:collection];
        if (![utils contains:^BOOL(id current) {
            return [item isEqual:current];
        }]) {
            [collection addObject:item];
        }
    }];
}

- (NSArray*)reversed
{
    return [self.object.reverseObjectEnumerator allObjects];
}

- (NSArray*)shuffled
{
    NSMutableArray* mutableArray = [self.object mutableCopy];
    
    [self forEachWithIndex:^(NSUInteger index, id item) {
        NSInteger remainingCount = self.object.count - index;
        NSInteger exchangeIndex = index + arc4random_uniform((u_int32_t )remainingCount);
        [mutableArray exchangeObjectAtIndex:index withObjectAtIndex:exchangeIndex];
    }];
    
    return mutableArray.copy;
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

- (void)forEachWithIndex:(void(^)(NSUInteger index, id item))block
{
    NSArray* object = self.object.copy;
    for (NSUInteger i = 0; i < object.count; ++i) {
        block(i, object[i]);
    }
}

+ (NSArray*)mutableArrayWithItem:(id)item repeated:(NSUInteger)repeat
{
    NSMutableArray* mutableArray = [NSMutableArray arrayWithCapacity:repeat];
    
    for (NSInteger i = 0; i < repeat; i++) {
        [mutableArray addObject:item];
    }
    
    return mutableArray;
}

+ (NSArray*)mutableArrayWithArray:(NSArray*)array nextItem:(id(^)(NSMutableArray* array))block repeated:(NSUInteger)repeat
{
    NSMutableArray* mutableArray = [NSMutableArray arrayWithArray:array];
    
    for (NSInteger i = 0; i < repeat; i++) {
        id item = block(mutableArray);
        [mutableArray addObject:item];
    }
    
    return mutableArray.copy;
}

+ (NSArray*)mutableArrayWithArray:(NSArray*)array nextItem:(id(^)(NSMutableArray* array))block until:(BOOL(^)(NSArray* array))until
{
    NSMutableArray* mutableArray = [NSMutableArray arrayWithArray:array];
    
    while (until(mutableArray)) {
        id item = block(mutableArray);
        [mutableArray addObject:item];
    }
    
    return mutableArray;
}

+ (NSArray*)arrayWithItem:(id)item repeated:(NSUInteger)repeat
{
    return [self mutableArrayWithItem:item repeated:repeat].copy;
}

+ (NSArray*)arrayWithArray:(NSArray*)array nextItem:(id(^)(NSArray* array))block repeated:(NSUInteger)repeat
{
    return [self mutableArrayWithArray:array nextItem:block repeated:repeat];
}

+ (NSArray*)arrayWithArray:(NSArray*)array nextItem:(id(^)(NSArray* array))block until:(BOOL(^)(NSArray* array))until
{
    return [self mutableArrayWithArray:array nextItem:block until:until];
}

@end

@interface FunkyMutableArrayUtilities ()

@property (nonatomic, strong) NSMutableArray* object;

@end

@implementation FunkyMutableArrayUtilities

- (NSMutableArray*)removeDuplicates
{
    NSMutableDictionary* objects = [self associateBy:^id(id item) {
        return item;
    }];
    
    for (id key in objects)
    {
        NSArray* duplicates = objects[key];
        for (NSInteger i = 1; i < duplicates.count; ++i)
        {
            id object = duplicates[i];
            [self.object removeObject:object];
        }
    }
}

- (NSMutableArray*)reverse
{
    [self forEachWithIndex:^(NSUInteger index, id item) {
        NSInteger otherSide = self.object.count - 1 - index;
        [self.object exchangeObjectAtIndex:index withObjectAtIndex:otherSide];
    }];
}

- (NSMutableArray*)shuffle
{
    [self forEachWithIndex:^(NSUInteger index, id item) {
        NSInteger remainingCount = self.object.count - index;
        NSInteger exchangeIndex = index + arc4random_uniform((u_int32_t )remainingCount);
        [self.object exchangeObjectAtIndex:index withObjectAtIndex:exchangeIndex];
    }];
}

+ (NSMutableArray*)arrayWithItem:(id)item repeated:(NSUInteger)repeat
{
    return [self mutableArrayWithItem:item repeated:repeat].copy;
}

+ (NSMutableArray*)arrayWithArray:(NSArray*)array nextItem:(id(^)(NSMutableArray* array))block repeated:(NSUInteger)repeat
{
    return [self mutableArrayWithArray:array nextItem:block repeated:repeat];
}

+ (NSMutableArray*)arrayWithArray:(NSArray*)array nextItem:(id(^)(NSMutableArray* array))block until:(BOOL(^)(NSArray* array))until
{
    return [self mutableArrayWithArray:array nextItem:block until:until];
}

@end
