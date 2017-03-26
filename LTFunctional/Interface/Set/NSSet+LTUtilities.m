//
//  NSSet+Utilities.m
//  Pods
//
//  Created by László Teveli on 2017. 03. 21..
//
//

#import "NSSet+LTUtilities.h"
#import "LTArrayUtilities.h"

@implementation NSSet (LTUtilities)

#pragma mark - LTCollectionCounterpart

+ (Class)classForImmutableCounterPart
{
    return [NSSet class];
}

+ (Class)classForMutableCounterPart
{
    return [NSMutableSet class];
}

+ (Class)classToFlatten
{
    return [NSSet class];
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

@end

@implementation NSMutableSet (LTUtilities)

#pragma mark - LTMutableCollectionWithCapacity

+ (id)newWithCapacity:(NSUInteger)capacity
{
    return [self setWithCapacity:capacity];
}

@end
