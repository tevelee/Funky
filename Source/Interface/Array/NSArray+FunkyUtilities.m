//
//  NSArray+Utilities.m
//  Pods
//
//  Created by László Teveli on 2017. 03. 21..
//
//

#import "NSArray+FunkyUtilities.h"
#import "NSArray+FunkyCore.h"
#import "FunkyArrayUtilities.h"

@implementation NSArray (FunkyUtilities)

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

- (NSArray*)mapWithIndex:(id (^)(NSUInteger, id))block
{
    return [self.utilities mapWithIndex:block];
}

- (NSArray *)flatMap:(id (^)(id))block
{
    return [self.utilities flatMap:block];
}

- (NSArray *)flatMapWithIndex:(id (^)(NSUInteger, id))block
{
    return [self.utilities flatMapWithIndex:block];
}

- (NSArray *)filtered:(BOOL (^)(id))block
{
    return [self.utilities filtered:block];
}

- (NSArray*)reduce:(id(^)(id value, id item))block withInitialValue:(id)start
{
    return [self.utilities reduce:block withInitialValue:start];
}

- (NSArray*)flattened
{
    return [self.utilities flattened];
}

- (NSArray*)merged:(NSArray*)collection
{
    return [self.utilities merged:collection];
}

- (void)forEach:(void(^)(id item))block
{
    return [self.utilities forEach:block];
}

- (void)forEachWithIndex:(void(^)(NSUInteger index, id item))block
{
    return [self.utilities forEachWithIndex:block];
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

- (NSUInteger)firstIndex
{
    return [self.utilities firstIndex];
}

- (NSUInteger)lastIndex
{
    return [self.utilities lastIndex];
}

- (id)first:(BOOL (^)(id))block
{
    return [self.utilities first:block];
}

- (NSUInteger)firstIndex:(BOOL (^)(id))block
{
    return [self.utilities firstIndex:block];
}

- (id)last:(BOOL(^)(id item))block
{
    return [self.utilities last:block];
}

- (NSUInteger)lastIndex:(BOOL (^)(id))block
{
    return [self.utilities lastIndex:block];
}

- (NSArray*)take:(BOOL(^)(id item))block
{
    return [self.utilities take:block];
}

- (NSArray*)takeLast:(BOOL(^)(id item))block
{
    return [self.utilities takeLast:block];
}

- (NSArray*)fromValueExclusive:(id)value
{
    return [self.utilities fromValueExclusive:value];
}

- (NSArray*)fromValueInclusive:(id)value
{
    return [self.utilities fromValueInclusive:value];
}

- (NSArray*)fromIndexExclusive:(NSInteger)index
{
    return [self.utilities fromIndexExclusive:index];
}

- (NSArray*)fromIndexInclusive:(NSInteger)index
{
    return [self.utilities fromIndexInclusive:index];
}

- (NSArray*)untilValueExclusive:(id)value
{
    return [self.utilities untilValueExclusive:value];
}

- (NSArray*)untilValueInclusive:(id)value
{
    return [self.utilities untilValueInclusive:value];
}

- (NSArray*)untilIndexExclusive:(NSInteger)index
{
    return [self.utilities untilIndexExclusive:index];
}

- (NSArray*)untilIndexInclusive:(NSInteger)index
{
    return [self.utilities untilIndexInclusive:index];
}

- (NSArray*)fromValueExclusive:(id)from untilValueExclusive:(id)until
{
    return [self.utilities fromValueExclusive:from untilValueExclusive:until];
}

- (NSArray*)fromValueExclusive:(id)from untilValueInclusive:(id)until
{
    return [self.utilities fromValueExclusive:from untilValueInclusive:until];
}

- (NSArray*)fromValueInclusive:(id)from untilValueExclusive:(id)until
{
    return [self.utilities fromValueInclusive:from untilValueExclusive:until];
}

- (NSArray*)fromValueInclusive:(id)from untilValueInclusive:(id)until
{
    return [self.utilities fromValueInclusive:from untilValueInclusive:until];
}

- (NSArray*)fromIndexExclusive:(NSInteger)from untilIndexExclusive:(NSInteger)until
{
    return [self.utilities fromIndexExclusive:from untilIndexExclusive:until];
}

- (NSArray*)fromIndexExclusive:(NSInteger)from untilIndexInclusive:(NSInteger)until
{
    return [self.utilities fromIndexExclusive:from untilIndexInclusive:until];
}

- (NSArray*)fromIndexInclusive:(NSInteger)from untilIndexExclusive:(NSInteger)until
{
    return [self.utilities fromIndexInclusive:from untilIndexExclusive:until];
}

- (NSArray*)fromIndexInclusive:(NSInteger)from untilIndexInclusive:(NSInteger)until
{
    return [self.utilities fromIndexInclusive:from untilIndexInclusive:until];
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

- (NSDictionary*)groupByUsingFirst:(id(^)(id item))block
{
    return [self.utilities groupByUsingFirst:block];
}

- (NSDictionary*)groupByUsingLast:(id(^)(id item))block
{
    return [self.utilities groupByUsingLast:block];
}

- (NSArray*)sorted:(NSComparator)comparator
{
    return [self.utilities sorted:comparator];
}

+ (NSArray*)arrayWithItem:(id)item repeated:(NSUInteger)repeat
{
    return [FunkyArrayUtilities arrayWithItem:item repeated:repeat];
}

+ (NSArray*)arrayWithArray:(NSArray*)array nextItem:(id(^)(NSArray* array))block repeated:(NSUInteger)repeat
{
    return [FunkyArrayUtilities arrayWithArray:array nextItem:block repeated:repeat];
}

+ (NSArray*)arrayWithArray:(NSArray*)array nextItem:(id(^)(NSArray* array))block until:(BOOL(^)(NSArray* array))until
{
    return [FunkyArrayUtilities arrayWithArray:array nextItem:block until:until];
}

@end

@implementation NSMutableArray (FunkyUtilities)

#pragma mark - Utilities

- (void)flatten
{
    [self.utilities flatten];
}

- (void)reverse
{
    [self.utilities reverse];
}

- (void)shuffle
{
    [self.utilities shuffle];
}

- (void)removeDuplicates
{
    [self.utilities removeDuplicates];
}

- (void)merge:(NSArray*)array
{
    [self.utilities merge:array];
}

- (void)sort:(NSComparator)comparator
{
    [self.utilities sort:comparator];
}

- (void)filter:(BOOL (^)(id))block
{
    [self.utilities filter:block];
}

+ (NSMutableArray*)arrayWithItem:(id)item repeated:(NSUInteger)repeat
{
    return [FunkyMutableArrayUtilities arrayWithItem:item repeated:repeat];
}

+ (NSMutableArray*)arrayWithArray:(NSArray*)array nextItem:(id(^)(NSMutableArray* array))block repeated:(NSUInteger)repeat
{
    return [FunkyMutableArrayUtilities arrayWithArray:array nextItem:block repeated:repeat];
}

+ (NSMutableArray*)arrayWithArray:(NSArray*)array nextItem:(id(^)(NSMutableArray* array))block until:(BOOL(^)(NSArray* array))until
{
    return [FunkyMutableArrayUtilities arrayWithArray:array nextItem:block until:until];
}

@end
