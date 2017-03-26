//
//  NSArray+Utilities.m
//  Pods
//
//  Created by László Teveli on 2017. 03. 21..
//
//

#import "NSArray+LTUtilities.h"
#import "NSArray+LTCore.h"
#import "LTArrayUtilities.h"

@implementation NSArray (LTUtilities)

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

- (NSArray*)map:(id(^)(id))block
{
    return [self.utilities map:block];
}

- (NSArray *)flatMap:(id (^)(id))block
{
    return [self.utilities flatMap:block];
}

- (NSArray *)filter:(BOOL (^)(id))block
{
    return [self.utilities filter:block];
}

- (NSArray*)reduce:(id(^)(id value, id item))block withInitialValue:(id)start
{
    return [self.utilities reduce:block withInitialValue:start];
}

- (NSArray*)flattened
{
    return [self.utilities flattened];
}

- (NSArray*)merge:(NSArray*)collection
{
    return [self.utilities merge:collection];
}

- (void)forEach:(void(^)(id item))block
{
    return [self.utilities forEach:block];
}

- (void)forEachWithIndex:(void(^)(NSUInteger index, id item))block
{
    return [self.utilities forEachWithIndex:block];
}

- (NSDictionary*)groupByUsingFirst:(id(^)(id item))block
{
    return [self.utilities groupByUsingFirst:block];
}

- (NSDictionary*)groupByUsingLast:(id(^)(id item))block
{
    return [self.utilities groupByUsingLast:block];
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

- (NSArray*)minItems:(double(^)(id item))block
{
    return [self.utilities minItems:block];
}

- (NSArray*)maxItems:(double(^)(id item))block
{
    return [self.utilities maxItems:block];
}

- (NSInteger)minIndex
{
    return [self.utilities minIndex];
}

- (NSInteger)maxIndex
{
    return [self.utilities maxIndex];
}

- (NSArray*)first:(BOOL(^)(id item))block
{
    return [self.utilities first:block];
}

- (NSArray*)last:(BOOL(^)(id item))block
{
    return [self.utilities last:block];
}

- (NSArray*)take:(BOOL(^)(id item))block
{
    return [self.utilities take:block];
}

- (NSArray*)takeLast:(BOOL(^)(id item))block
{
    return [self.utilities takeLast:block];
}

- (NSArray*)untilValue:(id)value
{
    return [self.utilities untilValue:value];
}

- (NSArray*)untilIndex:(NSInteger)index
{
    return [self.utilities untilIndex:index];
}

- (NSArray*)fromValue:(id)value
{
    return [self.utilities fromValue:value];
}

- (NSArray*)fromIndex:(NSInteger)index
{
    return [self.utilities fromIndex:index];
}

- (NSArray*)fromValue:(id)from untilValue:(id)until
{
    return [self.utilities fromValue:from untilValue:until];
}

- (NSArray*)fromIndex:(NSInteger)from untilIndex:(NSInteger)until
{
    return [self.utilities fromIndex:from untilIndex:until];
}

- (NSArray*)unique
{
    return [self.utilities unique];
}

- (NSArray*)reversed
{
    return [self.utilities reversed];
}

- (NSArray*)shuffled
{
    return [self.utilities shuffled];
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
