//
//  NSArray+Utilities.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 21..
//
//

#import <Foundation/Foundation.h>
#import "LTMutableCollectionWithCapacityProtocol.h"

@interface NSArray <__covariant ObjectType> (LTUtilities)

- (BOOL)all:(BOOL(^)(ObjectType item))block;
- (BOOL)none:(BOOL(^)(ObjectType item))block;
- (BOOL)contains:(BOOL(^)(ObjectType item))block;
- (NSUInteger)count:(BOOL(^)(ObjectType item))block;

- (NSArray*)map:(id(^)(ObjectType item))block;
- (NSArray*)mapWithIndex:(id(^)(NSUInteger index, ObjectType item))block;
- (NSArray*)flatMap:(id(^)(ObjectType item))block;
- (NSArray*)flatMapWithIndex:(id(^)(NSUInteger index, ObjectType item))block;
- (NSArray*)filter:(BOOL(^)(ObjectType item))block;
- (NSArray*)reduce:(id(^)(id value, ObjectType item))block withInitialValue:(id)start;
- (NSArray*)flattened;
- (NSArray*)merge:(NSArray*)collection;

- (void)forEach:(void(^)(ObjectType item))block;
- (void)forEachWithIndex:(void(^)(NSUInteger index, ObjectType item))block;

- (NSDictionary*)groupByUsingFirst:(id(^)(ObjectType item))block;
- (NSDictionary*)groupByUsingLast:(id(^)(ObjectType item))block;
- (NSDictionary<id, NSArray*>*)associateBy:(id(^)(ObjectType item))block;

- (double)sum:(double(^)(ObjectType item))block;
- (double)average:(double(^)(ObjectType item))block;
- (double)minValue:(double(^)(ObjectType item))block;
- (double)maxValue:(double(^)(ObjectType item))block;

- (NSArray*)minItems:(double(^)(ObjectType item))block;
- (NSArray*)maxItems:(double(^)(ObjectType item))block;

- (NSUInteger)firstIndex;
- (NSUInteger)lastIndex;

- (id)first:(BOOL(^)(ObjectType item))block;
- (NSUInteger)firstIndex:(BOOL(^)(ObjectType item))block;
- (id)last:(BOOL(^)(ObjectType item))block;
- (NSUInteger)lastIndex:(BOOL(^)(ObjectType item))block;

- (NSArray*)take:(BOOL(^)(ObjectType item))block;
- (NSArray*)takeLast:(BOOL(^)(ObjectType item))block;

- (NSArray*)fromValueExclusive:(id)value;
- (NSArray*)fromValueInclusive:(id)value;
- (NSArray*)fromIndexExclusive:(NSInteger)index;
- (NSArray*)fromIndexInclusive:(NSInteger)index;

- (NSArray*)untilValueExclusive:(id)value;
- (NSArray*)untilValueInclusive:(id)value;
- (NSArray*)untilIndexExclusive:(NSInteger)index;
- (NSArray*)untilIndexInclusive:(NSInteger)index;

- (NSArray*)fromValueExclusive:(id)from untilValueExclusive:(id)until;
- (NSArray*)fromValueExclusive:(id)from untilValueInclusive:(id)until;
- (NSArray*)fromValueInclusive:(id)from untilValueExclusive:(id)until;
- (NSArray*)fromValueInclusive:(id)from untilValueInclusive:(id)until;

- (NSArray*)fromIndexExclusive:(NSInteger)from untilIndexExclusive:(NSInteger)until;
- (NSArray*)fromIndexExclusive:(NSInteger)from untilIndexInclusive:(NSInteger)until;
- (NSArray*)fromIndexInclusive:(NSInteger)from untilIndexExclusive:(NSInteger)until;
- (NSArray*)fromIndexInclusive:(NSInteger)from untilIndexInclusive:(NSInteger)until;

- (NSArray*)unique;
- (NSArray*)reversed;
- (NSArray*)shuffled;

- (NSArray*)sorted:(NSComparator)comparator;

+ (NSArray*)arrayWithItem:(id)item repeated:(NSUInteger)repeat;
+ (NSArray*)arrayWithArray:(NSArray*)array nextItem:(id(^)(NSArray* array))block repeated:(NSUInteger)repeat;
+ (NSArray*)arrayWithArray:(NSArray*)array nextItem:(id(^)(NSArray* array))block until:(BOOL(^)(NSArray* array))until;

@end

@interface NSMutableArray (LTUtilities) <LTMutableCollectionWithCapacity>

@end
