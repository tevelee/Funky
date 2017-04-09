//
//  NSArray+Utilities.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 21..
//
//

#import <Foundation/Foundation.h>

@interface NSArray <__covariant ObjectType> (FunkyUtilities)

- (BOOL)all:(BOOL(^)(ObjectType item))block;
- (BOOL)none:(BOOL(^)(ObjectType item))block;
- (BOOL)contains:(BOOL(^)(ObjectType item))block;
- (NSUInteger)count:(BOOL(^)(ObjectType item))block;

- (NSArray*)map:(id(^)(ObjectType item))block;
- (NSArray*)mapWithIndex:(id(^)(NSUInteger index, ObjectType item))block;
- (NSArray*)flatMap:(id(^)(ObjectType item))block;
- (NSArray*)flatMapWithIndex:(id(^)(NSUInteger index, ObjectType item))block;
- (NSArray<ObjectType>*)filter:(BOOL(^)(ObjectType item))block;
- (id)reduce:(id(^)(id value, ObjectType item))block withInitialValue:(id)start;
- (NSArray<ObjectType>*)flattened;
- (NSArray*)merged:(NSArray*)array;

- (void)forEach:(void(^)(ObjectType item))block;
- (void)forEachWithIndex:(void(^)(NSUInteger index, ObjectType item))block;

- (NSDictionary<id, ObjectType>*)groupByUsingFirst:(id(^)(ObjectType item))block;
- (NSDictionary<id, ObjectType>*)groupByUsingLast:(id(^)(ObjectType item))block;
- (NSDictionary<id, NSArray<ObjectType>*>*)associateBy:(id(^)(ObjectType item))block;

- (double)sum:(double(^)(ObjectType item))block;
- (double)average:(double(^)(ObjectType item))block;
- (double)minValue:(double(^)(ObjectType item))block;
- (double)maxValue:(double(^)(ObjectType item))block;

- (NSArray<ObjectType>*)minItems:(double(^)(ObjectType item))block;
- (NSArray<ObjectType>*)maxItems:(double(^)(ObjectType item))block;

- (NSUInteger)firstIndex;
- (NSUInteger)lastIndex;

- (id)first:(BOOL(^)(ObjectType item))block;
- (NSUInteger)firstIndex:(BOOL(^)(ObjectType item))block;
- (id)last:(BOOL(^)(ObjectType item))block;
- (NSUInteger)lastIndex:(BOOL(^)(ObjectType item))block;

- (NSArray<ObjectType>*)take:(BOOL(^)(ObjectType item))block;
- (NSArray<ObjectType>*)takeLast:(BOOL(^)(ObjectType item))block;

- (NSArray<ObjectType>*)fromValueExclusive:(id)value;
- (NSArray<ObjectType>*)fromValueInclusive:(id)value;
- (NSArray<ObjectType>*)fromIndexExclusive:(NSInteger)index;
- (NSArray<ObjectType>*)fromIndexInclusive:(NSInteger)index;

- (NSArray<ObjectType>*)untilValueExclusive:(id)value;
- (NSArray<ObjectType>*)untilValueInclusive:(id)value;
- (NSArray<ObjectType>*)untilIndexExclusive:(NSInteger)index;
- (NSArray<ObjectType>*)untilIndexInclusive:(NSInteger)index;

- (NSArray<ObjectType>*)fromValueExclusive:(id)from untilValueExclusive:(id)until;
- (NSArray<ObjectType>*)fromValueExclusive:(id)from untilValueInclusive:(id)until;
- (NSArray<ObjectType>*)fromValueInclusive:(id)from untilValueExclusive:(id)until;
- (NSArray<ObjectType>*)fromValueInclusive:(id)from untilValueInclusive:(id)until;

- (NSArray<ObjectType>*)fromIndexExclusive:(NSInteger)from untilIndexExclusive:(NSInteger)until;
- (NSArray<ObjectType>*)fromIndexExclusive:(NSInteger)from untilIndexInclusive:(NSInteger)until;
- (NSArray<ObjectType>*)fromIndexInclusive:(NSInteger)from untilIndexExclusive:(NSInteger)until;
- (NSArray<ObjectType>*)fromIndexInclusive:(NSInteger)from untilIndexInclusive:(NSInteger)until;

- (NSArray<ObjectType>*)unique;
- (NSArray<ObjectType>*)reversed;
- (NSArray<ObjectType>*)shuffled;

- (NSArray<ObjectType>*)sorted:(NSComparator)comparator;

+ (NSArray<ObjectType>*)arrayWithItem:(id)item repeated:(NSUInteger)repeat;
+ (NSArray<ObjectType>*)arrayWithArray:(NSArray<ObjectType>*)array nextItem:(id(^)(NSArray* array))block repeated:(NSUInteger)repeat;
+ (NSArray<ObjectType>*)arrayWithArray:(NSArray<ObjectType>*)array nextItem:(id(^)(NSArray* array))block until:(BOOL(^)(NSArray* array))until;

@end

@interface NSMutableArray <ObjectType> (FunkyUtilities)

- (NSMutableArray<ObjectType>*)reverse;
- (NSMutableArray<ObjectType>*)shuffle;
- (NSMutableArray<ObjectType>*)removeDuplicates;

- (NSMutableArray<ObjectType>*)merge:(NSArray<ObjectType>*)array;

+ (NSMutableArray<ObjectType>*)arrayWithItem:(id)item repeated:(NSUInteger)repeat;
+ (NSMutableArray<ObjectType>*)arrayWithArray:(NSArray<ObjectType>*)array nextItem:(id(^)(NSMutableArray* array))block repeated:(NSUInteger)repeat;
+ (NSMutableArray<ObjectType>*)arrayWithArray:(NSArray<ObjectType>*)array nextItem:(id(^)(NSMutableArray* array))block until:(BOOL(^)(NSArray* array))until;

@end
