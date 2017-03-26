//
//  NSSet+Utilities.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 21..
//
//

#import <Foundation/Foundation.h>
#import "LTMutableCollectionWithCapacityProtocol.h"

@interface NSSet <__covariant ObjectType> (LTUtilities)

- (BOOL)all:(BOOL(^)(ObjectType item))block;
- (BOOL)none:(BOOL(^)(ObjectType item))block;
- (BOOL)contains:(BOOL(^)(ObjectType item))block;
- (NSUInteger)count:(BOOL(^)(ObjectType item))block;

- (NSSet*)map:(id(^)(ObjectType item))block;
- (NSSet*)flatMap:(id(^)(ObjectType item))block;
- (NSSet*)filter:(BOOL(^)(ObjectType item))block;
- (id)reduce:(id(^)(id value, ObjectType item))block withInitialValue:(id)start;
- (NSSet*)flattened;
- (NSSet*)merge:(NSSet*)collection;

- (void)forEach:(void(^)(ObjectType item))block;
- (void)forEachWithIndex:(void(^)(NSUInteger index, ObjectType item))block;

- (NSDictionary*)groupBy:(id(^)(ObjectType item))block;
- (NSDictionary<id, NSArray*>*)associateBy:(id(^)(ObjectType item))block;

- (double)sum:(double(^)(ObjectType item))block;
- (double)average:(double(^)(ObjectType item))block;
- (double)minValue:(double(^)(ObjectType item))block;
- (double)maxValue:(double(^)(ObjectType item))block;

- (NSSet*)minItems:(double(^)(ObjectType item))block;
- (NSSet*)maxItems:(double(^)(ObjectType item))block;

@end

@interface NSMutableSet (LTUtilities) <LTMutableCollectionWithCapacity>

@end
