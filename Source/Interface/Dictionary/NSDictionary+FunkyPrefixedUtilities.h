//
//  NSDictionary+FunkyUtilities.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 29..
//
//

#import <Foundation/Foundation.h>
#import "FunkyMutableCollectionWithCapacityProtocol.h"
#import "FunkyPair.h"

@interface NSDictionary<__covariant KeyType, __covariant ObjectType> (FunkyPrefixedUtilities)

- (NSDictionary*)funky_map:(FunkyPair*(^)(KeyType key, ObjectType value))block;
- (NSDictionary*)funky_merged:(NSDictionary*)other;
- (void)funky_forEach:(void(^)(KeyType key, ObjectType value))block;

- (NSDictionary<ObjectType, KeyType>*)funky_invertedObjectsAndKeys;

- (NSDictionary<KeyType, ObjectType>*)funky_filter:(BOOL(^)(KeyType key, ObjectType value))block;
- (BOOL)funky_all:(BOOL(^)(KeyType key, ObjectType value))block;
- (BOOL)funky_none:(BOOL(^)(KeyType key, ObjectType value))block;
- (BOOL)funky_contains:(BOOL(^)(KeyType key, ObjectType value))block;
- (id)funky_reduce:(id(^)(id previousValue, KeyType key, ObjectType value))block withInitialValue:(id)start;

@end

@interface NSMutableDictionary<KeyType, ObjectType> (FunkyPrefixedUtilities) <FunkyMutableCollectionWithCapacity>

- (NSMutableDictionary<KeyType, ObjectType>*)funky_merge:(NSDictionary<KeyType, ObjectType>*)dictionary;

@end
