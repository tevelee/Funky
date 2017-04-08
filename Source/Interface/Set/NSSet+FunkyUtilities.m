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

- (BOOL)all:(BOOL (^)(id))block
{
    return [self.utilities all:block];
}

- (BOOL)none:(BOOL (^)(id))block
{
    return [self.utilities none:block];
}

- (BOOL)contains:(BOOL (^)(id))block
{
    return [self.utilities contains:block];
}

- (NSUInteger)count:(BOOL(^)(id item))block
{
    return [self.utilities count:block];
}

- (NSSet*)map:(id(^)(id))block
{
    return [self.utilities map:block];
}

- (NSSet *)flatMap:(id (^)(id))block
{
    return [self.utilities flatMap:block];
}

- (NSSet *)filter:(BOOL (^)(id))block
{
    return [self.utilities filter:block];
}

- (id)reduce:(id(^)(id value, id item))block withInitialValue:(id)start
{
    return [self.utilities reduce:block withInitialValue:start];
}

- (NSSet*)flattened
{
    return [self.utilities flattened];
}

- (NSSet*)takingUnion:(NSSet *)set
{
    return [self.utilities takingUnion:set];
}

- (NSSet*)takingMinus:(NSSet*)set
{
    return [self.utilities takingMinus:set];
}

- (NSSet*)takingIntersection:(NSSet*)set
{
    return [self.utilities takingIntersection:set];
}

- (void)forEach:(void(^)(id item))block
{
    return [self.utilities forEach:block];
}

- (NSDictionary*)groupBy:(id(^)(id item))block
{
    return [self.utilities groupBy:block];
}

- (NSDictionary<id, NSArray*>*)associateBy:(id(^)(id item))block
{
    return [self.utilities associateBy:block];
}

- (double)sum:(double(^)(id item))block
{
    return [self.utilities sum:block];
}

- (double)average:(double(^)(id item))block
{
    return [self.utilities average:block];
}

- (double)minValue:(double(^)(id item))block
{
    return [self.utilities minValue:block];
}

- (double)maxValue:(double(^)(id item))block
{
    return [self.utilities maxValue:block];
}

- (NSSet*)minItems:(double(^)(id item))block
{
    return [self.utilities minItems:block];
}

- (NSSet*)maxItems:(double(^)(id item))block
{
    return [self.utilities maxItems:block];
}

@end

@implementation NSMutableSet (FunkyUtilities)

#pragma mark - Utilities

- (NSMutableSet*)takeUnion:(NSSet *)set
{
    return [self.utilities takeUnion:set];
}

- (NSMutableSet*)takeMinus:(NSSet*)set
{
    return [self.utilities takeMinus:set];
}

- (NSMutableSet*)takeIntersection:(NSSet*)set
{
    return [self.utilities takeIntersection:set];
}

@end
