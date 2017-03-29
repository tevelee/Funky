//
//  NSDictionary+LTUtilities.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 29..
//
//

#import <Foundation/Foundation.h>
#import "LTPair.h"

@interface NSDictionary<__covariant KeyType, __covariant ObjectType> (LTUtilities)

- (NSDictionary*)map:(LTPair*(^)(KeyType key, ObjectType value))block;
- (NSDictionary*)merge:(NSDictionary*)other;
- (void)forEach:(void(^)(KeyType key, ObjectType value))block;

- (NSDictionary*)filter:(BOOL(^)(KeyType key, ObjectType value))block;
- (BOOL)all:(BOOL(^)(KeyType key, ObjectType value))block;
- (BOOL)none:(BOOL(^)(KeyType key, ObjectType value))block;
- (BOOL)contains:(BOOL(^)(KeyType key, ObjectType value))block;
- (id)reduce:(id(^)(id previousValue, KeyType key, ObjectType value))block withInitialValue:(id)start;

@end
