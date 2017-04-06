//
//  NSSet+Utilities.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 21..
//
//

#import <Foundation/Foundation.h>
#import "FunkyMutableCollectionWithCapacityProtocol.h"

@interface NSSet <__covariant ObjectType> (FunkyPrefixedUtilities)

- (BOOL)funky_all:(BOOL(^)(ObjectType item))block;
- (BOOL)funky_none:(BOOL(^)(ObjectType item))block;
- (BOOL)funky_contains:(BOOL(^)(ObjectType item))block;
- (NSUInteger)funky_count:(BOOL(^)(ObjectType item))block;

- (NSSet*)funky_map:(id(^)(ObjectType item))block;
- (NSSet*)funky_flatMap:(id(^)(ObjectType item))block;
- (NSSet<ObjectType>*)funky_filter:(BOOL(^)(ObjectType item))block;
- (id)funky_reduce:(id(^)(id value, ObjectType item))block withInitialValue:(id)start;
- (NSSet<ObjectType>*)funky_flattened;

- (NSSet*)funky_takingUnion:(NSSet*)set;
- (NSSet<ObjectType>*)funky_takingMinus:(NSSet<ObjectType>*)set;
- (NSSet<ObjectType>*)funky_takingIntersection:(NSSet<ObjectType>*)set;

- (void)funky_forEach:(void(^)(ObjectType item))block;

- (NSDictionary<id, ObjectType>*)funky_groupBy:(id(^)(ObjectType item))block;
- (NSDictionary<id, NSArray<ObjectType>*>*)funky_associateBy:(id(^)(ObjectType item))block;

- (double)funky_sum:(double(^)(ObjectType item))block;
- (double)funky_average:(double(^)(ObjectType item))block;
- (double)funky_minValue:(double(^)(ObjectType item))block;
- (double)funky_maxValue:(double(^)(ObjectType item))block;

- (NSSet<ObjectType>*)funky_minItems:(double(^)(ObjectType item))block;
- (NSSet<ObjectType>*)funky_maxItems:(double(^)(ObjectType item))block;

@end

@interface NSMutableSet <ObjectType> (FunkyPrefixedUtilities) <FunkyMutableCollectionWithCapacity>

- (NSMutableSet*)funky_takeUnion:(NSSet*)set;
- (NSMutableSet<ObjectType>*)funky_takeMinus:(NSSet<ObjectType>*)set;
- (NSMutableSet<ObjectType>*)funky_takeIntersection:(NSSet<ObjectType>*)set;

@end
