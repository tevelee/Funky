//
//  NSArray+Utilities.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 21..
//
//

#import <Foundation/Foundation.h>
#import "FunkyMutableCollectionWithCapacityProtocol.h"

@interface NSArray <__covariant ObjectType> (FunkyPrefixedUtilities)

- (BOOL)funky_all:(BOOL(^)(ObjectType item))block;
- (BOOL)funky_none:(BOOL(^)(ObjectType item))block;
- (BOOL)funky_contains:(BOOL(^)(ObjectType item))block;
- (NSUInteger)funky_count:(BOOL(^)(ObjectType item))block;

- (NSArray*)funky_map:(id(^)(ObjectType item))block;
- (NSArray*)funky_mapWithIndex:(id(^)(NSUInteger index, ObjectType item))block;
- (NSArray*)funky_flatMap:(id(^)(ObjectType item))block;
- (NSArray*)funky_flatMapWithIndex:(id(^)(NSUInteger index, ObjectType item))block;
- (NSArray<ObjectType>*)funky_filter:(BOOL(^)(ObjectType item))block;
- (id)funky_reduce:(id(^)(id value, ObjectType item))block withInitialValue:(id)start;
- (NSArray<ObjectType>*)funky_flattened;
- (NSArray*)funky_merged:(NSArray*)array;

- (void)funky_forEach:(void(^)(ObjectType item))block;
- (void)funky_forEachWithIndex:(void(^)(NSUInteger index, ObjectType item))block;

- (NSDictionary<id, ObjectType>*)funky_groupByUsingFirst:(id(^)(ObjectType item))block;
- (NSDictionary<id, ObjectType>*)funky_groupByUsingLast:(id(^)(ObjectType item))block;
- (NSDictionary<id, NSArray<ObjectType>*>*)funky_associateBy:(id(^)(ObjectType item))block;

- (double)funky_sum:(double(^)(ObjectType item))block;
- (double)funky_average:(double(^)(ObjectType item))block;
- (double)funky_minValue:(double(^)(ObjectType item))block;
- (double)funky_maxValue:(double(^)(ObjectType item))block;

- (NSArray<ObjectType>*)funky_minItems:(double(^)(ObjectType item))block;
- (NSArray<ObjectType>*)funky_maxItems:(double(^)(ObjectType item))block;

- (NSUInteger)funky_firstIndex;
- (NSUInteger)funky_lastIndex;

- (id)funky_first:(BOOL(^)(ObjectType item))block;
- (NSUInteger)funky_firstIndex:(BOOL(^)(ObjectType item))block;
- (id)funky_last:(BOOL(^)(ObjectType item))block;
- (NSUInteger)funky_lastIndex:(BOOL(^)(ObjectType item))block;

- (NSArray<ObjectType>*)funky_take:(BOOL(^)(ObjectType item))block;
- (NSArray<ObjectType>*)funky_takeLast:(BOOL(^)(ObjectType item))block;

- (NSArray<ObjectType>*)funky_fromValueExclusive:(id)value;
- (NSArray<ObjectType>*)funky_fromValueInclusive:(id)value;
- (NSArray<ObjectType>*)funky_fromIndexExclusive:(NSInteger)index;
- (NSArray<ObjectType>*)funky_fromIndexInclusive:(NSInteger)index;

- (NSArray<ObjectType>*)funky_untilValueExclusive:(id)value;
- (NSArray<ObjectType>*)funky_untilValueInclusive:(id)value;
- (NSArray<ObjectType>*)funky_untilIndexExclusive:(NSInteger)index;
- (NSArray<ObjectType>*)funky_untilIndexInclusive:(NSInteger)index;

- (NSArray<ObjectType>*)funky_fromValueExclusive:(id)from untilValueExclusive:(id)until;
- (NSArray<ObjectType>*)funky_fromValueExclusive:(id)from untilValueInclusive:(id)until;
- (NSArray<ObjectType>*)funky_fromValueInclusive:(id)from untilValueExclusive:(id)until;
- (NSArray<ObjectType>*)funky_fromValueInclusive:(id)from untilValueInclusive:(id)until;

- (NSArray<ObjectType>*)funky_fromIndexExclusive:(NSInteger)from untilIndexExclusive:(NSInteger)until;
- (NSArray<ObjectType>*)funky_fromIndexExclusive:(NSInteger)from untilIndexInclusive:(NSInteger)until;
- (NSArray<ObjectType>*)funky_fromIndexInclusive:(NSInteger)from untilIndexExclusive:(NSInteger)until;
- (NSArray<ObjectType>*)funky_fromIndexInclusive:(NSInteger)from untilIndexInclusive:(NSInteger)until;

- (NSArray<ObjectType>*)funky_unique;
- (NSArray<ObjectType>*)funky_reversed;
- (NSArray<ObjectType>*)funky_shuffled;

- (NSArray<ObjectType>*)funky_sorted:(NSComparator)comparator;

+ (NSArray<ObjectType>*)funky_arrayWithItem:(id)item repeated:(NSUInteger)repeat;
+ (NSArray<ObjectType>*)funky_arrayWithArray:(NSArray<ObjectType>*)array nextItem:(id(^)(NSArray<ObjectType>* array))block repeated:(NSUInteger)repeat;
+ (NSArray<ObjectType>*)funky_arrayWithArray:(NSArray<ObjectType>*)array nextItem:(id(^)(NSArray<ObjectType>* array))block until:(BOOL(^)(NSArray<ObjectType>* array))until;

@end

@interface NSMutableArray <ObjectType> (FunkyPrefixedUtilities) <FunkyMutableCollectionWithCapacity>

- (NSMutableArray<ObjectType>*)funky_reverse;
- (NSMutableArray<ObjectType>*)funky_shuffle;
- (NSMutableArray<ObjectType>*)funky_removeDuplicates;

- (NSMutableArray<ObjectType>*)funky_merge:(NSArray<ObjectType>*)array;

+ (NSMutableArray<ObjectType>*)funky_arrayWithItem:(id)item repeated:(NSUInteger)repeat;
+ (NSMutableArray<ObjectType>*)funky_arrayWithArray:(NSArray<ObjectType>*)array nextItem:(id(^)(NSMutableArray<ObjectType>* array))block repeated:(NSUInteger)repeat;
+ (NSMutableArray<ObjectType>*)funky_arrayWithArray:(NSArray<ObjectType>*)array nextItem:(id(^)(NSMutableArray<ObjectType>* array))block until:(BOOL(^)(NSArray<ObjectType>* array))until;

@end
