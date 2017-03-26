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
- (NSArray*)flatMap:(id(^)(ObjectType item))block;
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

- (NSInteger)minIndex;
- (NSInteger)maxIndex;

- (NSArray*)first:(BOOL(^)(ObjectType item))block;
- (NSArray*)last:(BOOL(^)(ObjectType item))block;

- (NSArray*)take:(BOOL(^)(ObjectType item))block;
- (NSArray*)takeLast:(BOOL(^)(ObjectType item))block;

- (NSArray*)untilValue:(id)value;
- (NSArray*)untilIndex:(NSInteger)index;

- (NSArray*)fromValue:(id)value;
- (NSArray*)fromIndex:(NSInteger)index;

- (NSArray*)fromValue:(id)from untilValue:(id)until;
- (NSArray*)fromIndex:(NSInteger)from untilIndex:(NSInteger)until;

- (NSArray*)unique;
- (NSArray*)reversed;
- (NSArray*)shuffled;

- (NSArray*)sort:(NSComparator)comparator;

@end

@interface NSMutableArray (LTUtilities) <LTMutableCollectionWithCapacity>

@end
