//
//  NSArray+Utilities.m
//  Pods
//
//  Created by László Teveli on 2017. 03. 21..
//
//

#import "NSArray+LTUtilities.h"
#import "LTArrayUtilities.h"

@implementation NSArray (LTUtilities)

#pragma mark - LTCollectionCounterpart

+ (Class)classForImmutableCounterPart
{
    return [NSArray class];
}

+ (Class)classForMutableCounterPart
{
    return [NSMutableArray class];
}

+ (Class)classToFlatten
{
    return [NSArray class];
}

#pragma mark - Utilities

- (BOOL)all:(BOOL (^)(id))block
{
    LTCollectionUtilities* utils = [LTCollectionUtilities utilitiesWithObject:self];
    return [utils all:block];
}

- (BOOL)none:(BOOL (^)(id))block
{
    LTCollectionUtilities* utils = [LTCollectionUtilities utilitiesWithObject:self];
    return [utils none:block];
}

- (BOOL)contains:(BOOL (^)(id))block
{
    LTCollectionUtilities* utils = [LTCollectionUtilities utilitiesWithObject:self];
    return [utils contains:block];
}

- (NSArray*)map:(id(^)(id))block
{
    LTCollectionUtilities* utils = [LTCollectionUtilities utilitiesWithObject:self];
    return [utils map:block];
}

- (NSArray *)flatMap:(id (^)(id))block
{
    LTCollectionUtilities* utils = [LTCollectionUtilities utilitiesWithObject:self];
    return [utils flatMap:block];
}

- (NSArray *)filter:(BOOL (^)(id))block
{
    LTCollectionUtilities* utils = [LTCollectionUtilities utilitiesWithObject:self];
    return [utils filter:block];
}

- (NSArray*)reduce:(id(^)(id value, id item))block withInitialValue:(id)start
{
    LTCollectionUtilities* utils = [LTCollectionUtilities utilitiesWithObject:self];
    return [utils reduce:block withInitialValue:start];
}

- (NSArray*)flattened
{
    LTCollectionUtilities* utils = [LTCollectionUtilities utilitiesWithObject:self];
    return [utils flattened];
}

- (NSArray*)merge:(NSArray*)collection
{
    LTCollectionUtilities* utils = [LTCollectionUtilities utilitiesWithObject:self];
    return [utils merge:collection];
}

- (void)forEach:(void(^)(id item))block
{
    LTCollectionUtilities* utils = [LTCollectionUtilities utilitiesWithObject:self];
    return [utils forEach:block];
}

- (void)forEachWithIndex:(void(^)(NSUInteger index, id item))block
{
    LTArrayUtilities* utils = [LTArrayUtilities utilitiesWithObject:self];
    return [utils forEachWithIndex:block];
}

- (NSDictionary*)groupByUsingFirst:(id(^)(id item))block
{
    LTCollectionUtilities* utils = [LTCollectionUtilities utilitiesWithObject:self];
    return [utils groupByUsingFirst:block];
}

- (NSDictionary*)groupByUsingLast:(id(^)(id item))block
{
    LTCollectionUtilities* utils = [LTCollectionUtilities utilitiesWithObject:self];
    return [utils groupByUsingLast:block];
}

- (NSDictionary<id, NSArray*>*)associateBy:(id(^)(id item))block
{
    LTCollectionUtilities* utils = [LTCollectionUtilities utilitiesWithObject:self];
    return [utils associateBy:block];
}

- (double)sum:(double(^)(id item))block
{
    LTCollectionUtilities* utils = [LTCollectionUtilities utilitiesWithObject:self];
    return [utils sum:block];
}

- (double)minValue:(double(^)(id item))block
{
    LTCollectionUtilities* utils = [LTCollectionUtilities utilitiesWithObject:self];
    return [utils minValue:block];
}

- (double)maxValue:(double(^)(id item))block
{
    LTCollectionUtilities* utils = [LTCollectionUtilities utilitiesWithObject:self];
    return [utils maxValue:block];
}

- (NSArray*)minItems:(double(^)(id item))block
{
    LTCollectionUtilities* utils = [LTCollectionUtilities utilitiesWithObject:self];
    return [utils minItems:block];
}

- (NSArray*)maxItems:(double(^)(id item))block
{
    LTCollectionUtilities* utils = [LTCollectionUtilities utilitiesWithObject:self];
    return [utils maxItems:block];
}

- (NSInteger)minIndex
{
    LTArrayUtilities* utils = [LTArrayUtilities utilitiesWithObject:self];
    return [utils minIndex];
}

- (NSInteger)maxIndex
{
    LTArrayUtilities* utils = [LTArrayUtilities utilitiesWithObject:self];
    return [utils maxIndex];
}

- (NSArray*)first:(BOOL(^)(id item))block
{
    LTArrayUtilities* utils = [LTArrayUtilities utilitiesWithObject:self];
    return [utils first:block];
}

- (NSArray*)last:(BOOL(^)(id item))block
{
    LTArrayUtilities* utils = [LTArrayUtilities utilitiesWithObject:self];
    return [utils last:block];
}

- (NSArray*)take:(BOOL(^)(id item))block
{
    LTArrayUtilities* utils = [LTArrayUtilities utilitiesWithObject:self];
    return [utils take:block];
}

- (NSArray*)takeLast:(BOOL(^)(id item))block
{
    LTArrayUtilities* utils = [LTArrayUtilities utilitiesWithObject:self];
    return [utils takeLast:block];
}

- (NSArray*)untilValue:(id)value
{
    LTArrayUtilities* utils = [LTArrayUtilities utilitiesWithObject:self];
    return [utils untilValue:value];
}

- (NSArray*)untilIndex:(NSInteger)index
{
    LTArrayUtilities* utils = [LTArrayUtilities utilitiesWithObject:self];
    return [utils untilIndex:index];
}

- (NSArray*)fromValue:(id)value
{
    LTArrayUtilities* utils = [LTArrayUtilities utilitiesWithObject:self];
    return [utils fromValue:value];
}

- (NSArray*)fromIndex:(NSInteger)index
{
    LTArrayUtilities* utils = [LTArrayUtilities utilitiesWithObject:self];
    return [utils fromIndex:index];
}

- (NSArray*)fromValue:(id)from untilValue:(id)until
{
    LTArrayUtilities* utils = [LTArrayUtilities utilitiesWithObject:self];
    return [utils fromValue:from untilValue:until];
}

- (NSArray*)fromIndex:(NSInteger)from untilIndex:(NSInteger)until
{
    LTArrayUtilities* utils = [LTArrayUtilities utilitiesWithObject:self];
    return [utils fromIndex:from untilIndex:until];
}

- (NSArray*)unique
{
    LTArrayUtilities* utils = [LTArrayUtilities utilitiesWithObject:self];
    return [utils unique];
}

- (NSArray*)reversed
{
    LTArrayUtilities* utils = [LTArrayUtilities utilitiesWithObject:self];
    return [utils reversed];
}

- (NSArray*)shuffled
{
    LTArrayUtilities* utils = [LTArrayUtilities utilitiesWithObject:self];
    return [utils shuffled];
}

- (NSArray*)sort:(NSComparator)comparator
{
    return [self sortedArrayUsingComparator:comparator];
}

@end

@implementation NSMutableArray (LTUtilities)

#pragma mark - LTMutableCollectionWithCapacity

+ (id)newWithCapacity:(NSUInteger)capacity
{
    return [self arrayWithCapacity:capacity];
}

@end
