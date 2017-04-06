//
//  NSSet+Utilities.m
//  Pods
//
//  Created by László Teveli on 2017. 03. 21..
//
//

#import "NSSet+FunkyUtilities.h"
#import "FunkyArrayUtilities.h"
#import "NSSet+FunkyCore.h"

@implementation NSSet (FunkyUtilities)

#pragma mark - Utilities

- (BOOL)funky_all:(BOOL (^)(id))block
{
    return [self.utilities all:block];
}

- (BOOL)funky_none:(BOOL (^)(id))block
{
    return [self.utilities none:block];
}

- (BOOL)funky_contains:(BOOL (^)(id))block
{
    return [self.utilities contains:block];
}

- (NSUInteger)funky_count:(BOOL(^)(id item))block
{
    return [self.utilities count:block];
}

- (NSSet*)funky_map:(id(^)(id))block
{
    return [self.utilities map:block];
}

- (NSSet *)funky_flatMap:(id (^)(id))block
{
    return [self.utilities flatMap:block];
}

- (NSSet *)funky_filter:(BOOL (^)(id))block
{
    return [self.utilities filter:block];
}

- (id)funky_reduce:(id(^)(id value, id item))block withInitialValue:(id)start
{
    return [self.utilities reduce:block withInitialValue:start];
}

- (NSSet*)funky_flattened
{
    return [self.utilities flattened];
}

- (NSSet*)funky_takingUnion:(NSSet *)set
{
    return [self.utilities takingUnion:set];
}

- (NSSet*)funky_takingMinus:(NSSet*)set
{
    return [self.utilities takingMinus:set];
}

- (NSSet*)funky_takingIntersection:(NSSet*)set
{
    return [self.utilities takingIntersection:set];
}

- (void)funky_forEach:(void(^)(id item))block
{
    return [self.utilities forEach:block];
}

- (NSDictionary*)funky_groupBy:(id(^)(id item))block
{
    return [self.utilities groupBy:block];
}

- (NSDictionary<id, NSArray*>*)funky_associateBy:(id(^)(id item))block
{
    return [self.utilities associateBy:block];
}

- (double)funky_sum:(double(^)(id item))block
{
    return [self.utilities sum:block];
}

- (double)funky_average:(double(^)(id item))block
{
    return [self.utilities average:block];
}

- (double)funky_minValue:(double(^)(id item))block
{
    return [self.utilities minValue:block];
}

- (double)funky_maxValue:(double(^)(id item))block
{
    return [self.utilities maxValue:block];
}

- (NSSet*)funky_minItems:(double(^)(id item))block
{
    return [self.utilities minItems:block];
}

- (NSSet*)funky_maxItems:(double(^)(id item))block
{
    return [self.utilities maxItems:block];
}

@end

@implementation NSMutableSet (FunkyUtilities)

#pragma mark - FunkyMutableCollectionWithCapacity

+ (id)funky_newWithCapacity:(NSUInteger)capacity
{
    return [self setWithCapacity:capacity];
}

#pragma mark - Utilities

- (NSMutableSet*)funky_takeUnion:(NSSet *)set
{
    return [self.utilities takeUnion:set];
}

- (NSMutableSet*)funky_takeMinus:(NSSet*)set
{
    return [self.utilities takeMinus:set];
}

- (NSMutableSet*)funky_takeIntersection:(NSSet*)set
{
    return [self.utilities takeIntersection:set];
}

@end
