//
//  NSSet+Utilities.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 21..
//
//

#import <Foundation/Foundation.h>

@interface NSSet <__covariant ObjectType> (FunkyUtilities)

- (BOOL)all:(BOOL(^)(ObjectType item))block;
- (BOOL)none:(BOOL(^)(ObjectType item))block;
- (BOOL)contains:(BOOL(^)(ObjectType item))block;
- (NSUInteger)count:(BOOL(^)(ObjectType item))block;

- (NSSet*)map:(id(^)(ObjectType item))block;
- (NSSet*)flatMap:(id(^)(ObjectType item))block;
- (NSSet<ObjectType>*)filtered:(BOOL(^)(ObjectType item))block;
- (id)reduce:(id(^)(id value, ObjectType item))block withInitialValue:(id)start;
- (NSSet<ObjectType>*)flattened;

- (NSSet*)takingUnion:(NSSet*)set;
- (NSSet<ObjectType>*)takingMinus:(NSSet<ObjectType>*)set;
- (NSSet<ObjectType>*)takingIntersection:(NSSet<ObjectType>*)set;

- (void)forEach:(void(^)(ObjectType item))block;

- (NSDictionary<id, ObjectType>*)groupBy:(id(^)(ObjectType item))block;
- (NSDictionary<id, NSArray<ObjectType>*>*)associateBy:(id(^)(ObjectType item))block;

- (double)sum:(double(^)(ObjectType item))block;
- (double)average:(double(^)(ObjectType item))block;
- (double)minValue:(double(^)(ObjectType item))block;
- (double)maxValue:(double(^)(ObjectType item))block;

- (NSSet<ObjectType>*)minItems:(double(^)(ObjectType item))block;
- (NSSet<ObjectType>*)maxItems:(double(^)(ObjectType item))block;

@end

@interface NSMutableSet <ObjectType> (FunkyUtilities)

- (void)takeUnion:(NSSet*)set;
- (void)takeMinus:(NSSet<ObjectType>*)set;
- (void)takeIntersection:(NSSet<ObjectType>*)set;

@end
