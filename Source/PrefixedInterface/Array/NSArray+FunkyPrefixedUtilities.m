//
//  NSArray+Utilities.m
//  Pods
//
//  Created by László Teveli on 2017. 03. 21..
//
//

#import "NSArray+FunkyPrefixedUtilities.h"
#import "NSArray+FunkyCore.h"
#import "FunkyArrayUtilities.h"

@implementation NSArray (FunkyPrefixedUtilities)

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

- (NSArray*)funky_map:(id(^)(id))block
{
    return [self.utilities map:block];
}

- (NSArray*)funky_nilTolerantMap:(id (^)(id))block
{
    return [self.utilities nilTolerantMap:block];
}

- (NSArray*)funky_mapWithIndex:(id (^)(NSUInteger, id))block
{
    return [self.utilities mapWithIndex:block];
}

- (NSArray*)funky_nilTolerantMapWithIndex:(id (^)(NSUInteger, id))block
{
    return [self.utilities nilTolerantMapWithIndex:block];
}

- (NSArray *)funky_flatMap:(id (^)(id))block
{
    return [self.utilities flatMap:block];
}

- (NSArray *)funky_flatMapWithIndex:(id (^)(NSUInteger, id))block
{
    return [self.utilities flatMapWithIndex:block];
}

- (NSArray *)funky_filtered:(BOOL (^)(id))block
{
    return [self.utilities filtered:block];
}

- (NSArray*)funky_reduce:(id(^)(id value, id item))block withInitialValue:(id)start
{
    return [self.utilities reduce:block withInitialValue:start];
}

- (NSArray*)funky_flattened
{
    return [self.utilities flattened];
}

- (NSArray*)funky_merged:(NSArray*)collection
{
    return [self.utilities merged:collection];
}

- (void)funky_forEach:(void(^)(id item))block
{
    return [self.utilities forEach:block];
}

- (void)funky_forEachWithIndex:(void(^)(NSUInteger index, id item))block
{
    return [self.utilities forEachWithIndex:block];
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

- (NSArray*)funky_minItems:(double(^)(id item))block
{
    return [self.utilities minItems:block];
}

- (NSArray*)funky_maxItems:(double(^)(id item))block
{
    return [self.utilities maxItems:block];
}

- (NSUInteger)funky_firstIndex
{
    return [self.utilities firstIndex];
}

- (NSUInteger)funky_lastIndex
{
    return [self.utilities lastIndex];
}

- (id)funky_first:(BOOL (^)(id))block
{
    return [self.utilities first:block];
}

- (NSUInteger)funky_firstIndex:(BOOL (^)(id))block
{
    return [self.utilities firstIndex:block];
}

- (id)funky_last:(BOOL(^)(id item))block
{
    return [self.utilities last:block];
}

- (NSUInteger)funky_lastIndex:(BOOL (^)(id))block
{
    return [self.utilities lastIndex:block];
}

- (NSArray*)funky_take:(BOOL(^)(id item))block
{
    return [self.utilities take:block];
}

- (NSArray*)funky_takeLast:(BOOL(^)(id item))block
{
    return [self.utilities takeLast:block];
}

- (NSArray*)funky_fromValueExclusive:(id)value
{
    return [self.utilities fromValueExclusive:value];
}

- (NSArray*)funky_fromValueInclusive:(id)value
{
    return [self.utilities fromValueInclusive:value];
}

- (NSArray*)funky_fromIndexExclusive:(NSInteger)index
{
    return [self.utilities fromIndexExclusive:index];
}

- (NSArray*)funky_fromIndexInclusive:(NSInteger)index
{
    return [self.utilities fromIndexInclusive:index];
}

- (NSArray*)funky_untilValueExclusive:(id)value
{
    return [self.utilities untilValueExclusive:value];
}

- (NSArray*)funky_untilValueInclusive:(id)value
{
    return [self.utilities untilValueInclusive:value];
}

- (NSArray*)funky_untilIndexExclusive:(NSInteger)index
{
    return [self.utilities untilIndexExclusive:index];
}

- (NSArray*)funky_untilIndexInclusive:(NSInteger)index
{
    return [self.utilities untilIndexInclusive:index];
}

- (NSArray*)funky_fromValueExclusive:(id)from untilValueExclusive:(id)until
{
    return [self.utilities fromValueExclusive:from untilValueExclusive:until];
}

- (NSArray*)funky_fromValueExclusive:(id)from untilValueInclusive:(id)until
{
    return [self.utilities fromValueExclusive:from untilValueInclusive:until];
}

- (NSArray*)funky_fromValueInclusive:(id)from untilValueExclusive:(id)until
{
    return [self.utilities fromValueInclusive:from untilValueExclusive:until];
}

- (NSArray*)funky_fromValueInclusive:(id)from untilValueInclusive:(id)until
{
    return [self.utilities fromValueInclusive:from untilValueInclusive:until];
}

- (NSArray*)funky_fromIndexExclusive:(NSInteger)from untilIndexExclusive:(NSInteger)until
{
    return [self.utilities fromIndexExclusive:from untilIndexExclusive:until];
}

- (NSArray*)funky_fromIndexExclusive:(NSInteger)from untilIndexInclusive:(NSInteger)until
{
    return [self.utilities fromIndexExclusive:from untilIndexInclusive:until];
}

- (NSArray*)funky_fromIndexInclusive:(NSInteger)from untilIndexExclusive:(NSInteger)until
{
    return [self.utilities fromIndexInclusive:from untilIndexExclusive:until];
}

- (NSArray*)funky_fromIndexInclusive:(NSInteger)from untilIndexInclusive:(NSInteger)until
{
    return [self.utilities fromIndexInclusive:from untilIndexInclusive:until];
}

- (NSArray*)funky_unique
{
    return [self.utilities unique];
}

- (NSArray*)funky_reversed
{
    return [self.utilities reversed];
}

- (NSArray*)funky_shuffled
{
    return [self.utilities shuffled];
}

- (NSDictionary*)funky_groupByUsingFirst:(id(^)(id item))block
{
    return [self.utilities groupByUsingFirst:block];
}

- (NSDictionary*)funky_groupByUsingLast:(id(^)(id item))block
{
    return [self.utilities groupByUsingLast:block];
}

- (NSArray*)funky_sorted:(NSComparator)comparator
{
    return [self.utilities sorted:comparator];
}

+ (NSArray*)funky_arrayWithItem:(id)item repeated:(NSUInteger)repeat
{
    return [FunkyArrayUtilities arrayWithItem:item repeated:repeat];
}

+ (NSArray*)funky_arrayWithArray:(NSArray*)array nextItem:(id(^)(NSArray* array))block repeated:(NSUInteger)repeat
{
    return [FunkyArrayUtilities arrayWithArray:array nextItem:block repeated:repeat];
}

+ (NSArray*)funky_arrayWithArray:(NSArray*)array nextItem:(id(^)(NSArray* array))block until:(BOOL(^)(NSArray* array))until
{
    return [FunkyArrayUtilities arrayWithArray:array nextItem:block until:until];
}

@end

@implementation NSMutableArray (FunkyPrefixedUtilities)

#pragma mark - Utilities

- (void)funky_flatten
{
    [self.utilities flatten];
}

- (void)funky_reverse
{
    [self.utilities reverse];
}

- (void)funky_shuffle
{
    [self.utilities shuffle];
}

- (void)funky_removeDuplicates
{
    [self.utilities removeDuplicates];
}

- (void)funky_merge:(NSArray*)array
{
    [self.utilities merge:array];
}

- (void)funky_sort:(NSComparator)comparator
{
    [self.utilities sort:comparator];
}

- (void)funky_filter:(BOOL(^)(id item))block
{
    [self.utilities filter:block];
}

+ (NSMutableArray*)funky_arrayWithItem:(id)item repeated:(NSUInteger)repeat
{
    return [FunkyMutableArrayUtilities arrayWithItem:item repeated:repeat];
}

+ (NSMutableArray*)funky_arrayWithArray:(NSArray*)array nextItem:(id(^)(NSMutableArray* array))block repeated:(NSUInteger)repeat
{
    return [FunkyMutableArrayUtilities arrayWithArray:array nextItem:block repeated:repeat];
}

+ (NSMutableArray*)funky_arrayWithArray:(NSArray*)array nextItem:(id(^)(NSMutableArray* array))block until:(BOOL(^)(NSArray* array))until
{
    return [FunkyMutableArrayUtilities arrayWithArray:array nextItem:block until:until];
}

@end
