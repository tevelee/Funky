//
//  FunkyPair.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 26..
//
//

#import <Foundation/Foundation.h>

/**
 *  This is a data structure representing a key-value pair
 */
@interface FunkyPair<__covariant KeyType: id<NSCopying>, __covariant ObjectType> : NSObject

/**
 *  The identifier of the stored value
 */
@property (nonatomic, strong) KeyType key;

/**
 *  The value belonging to the given key
 */
@property (nonatomic, strong) ObjectType value;

/**
 *  Creates a new pair structure given the key and the value parameters
 *
 *  @param key The identifier
 *  @param value The stored value
 *  @return A new pair structure with the given `key` and `value`
 */
+ (instancetype)pairWithKey:(KeyType)key value:(ObjectType)value;

/**
 *  Creates a new pair structure with the same value but with a new key
 *
 *  @param key The new identifier to use for the value
 *  @return A new pair structure with the given the new `key`
 */
- (FunkyPair*)pairByModifyingKey:(KeyType)key;

/**
 *  Creates a new pair structure with the same key but with a new value
 *
 *  @param value The new value to use for the key
 *  @return A new pair structure with the given the new `value`
 */
- (FunkyPair*)pairByModifyingValue:(ObjectType)value;

@end
