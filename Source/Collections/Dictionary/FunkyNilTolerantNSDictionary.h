//
//  FunkyNilTolerantNSDictionary.h
//  Pods
//
//  Created by László Teveli on 2017. 04. 03..
//
//

#import "FunkyNSDictionarySubclass.h"
#import "FunkyNSMutableDictionarySubclass.h"

#pragma mark - NSDictionary Subclasses

/**
 *  This is a subclass of the NSDictionary class-cluster, providing nil-tolerant behaviour to NSDictionary. Whenever you would insert nil values into the set, it will disregard those cases instead of crashing.
 *
 *  @see Easy access via the category `NSDictionary(FunkyNilTolerant)`
 *  @see Mutable counterpart `FunkyNilTolerantNSMutableDictionary`
 */
@interface FunkyNilTolerantNSDictionary : FunkyNSDictionarySubclass

@end

/**
 *  This is a subclass of the NSDictionary class-cluster, providing nil-tolerant behaviour to NSMutableDictionary. Whenever you would insert nil values into the set, it will disregard those cases instead of crashing.
 *
 *  @see Easy access via the category `NSMutableDictionary(FunkyNilTolerant)`
 *  @see Immutable counterpart `FunkyNilTolerantNSDictionary`
 */
@interface FunkyNilTolerantNSMutableDictionary : FunkyNSMutableDictionarySubclass

@end

#pragma mark - NSDictionary Categories

/**
 *  This is a category on NSDictionary to convert the current set into a nil-tolerant collection.
 *
 *  @see Mutable counterpart `NSMutableDictionary(FunkyNilTolerant)`
 */
@interface NSDictionary<KeyType, ObjectType> (FunkyNilTolerant)

/**
 *  This method converts the regular NSDictionary into a nil-tolerant collection, with the same content.
 *
 *  @return A nil-tolerant NSDictionary (a.k.a. `FunkyNilTolerantNSDictionary`) with the same content.
 *  @see Mutable counterpart `-[NSMutableDictionary(FunkyNilTolerant) nilTolerant]`
 */
- (FunkyNilTolerantNSDictionary*)nilTolerant;

/**
 *  This method creates a new nil-tolerant collection.
 *
 *  @return A nil-tolerant NSDictionary (a.k.a. `FunkyNilTolerantNSDictionary`).
 *  @see Mutable counterpart `+[NSMutableDictionary(FunkyNilTolerant) nilTolerantDictionary]`
 */
+ (FunkyNilTolerantNSDictionary*)nilTolerantDictionary;

/**
 *  This method creates a new nil-tolerant collection, containing the given object parameter under the specified key.
 *
 *  @param object The object to be stored in the collection
 *  @param key The key under `object` should be put in
 *  @return A nil-tolerant NSDictionary (a.k.a. `FunkyNilTolerantNSDictionary`).
 *  @see Mutable counterpart `+[NSMutableDictionary(FunkyNilTolerant) nilTolerantDictionaryWithObject:forKey:]`
 */
+ (FunkyNilTolerantNSDictionary*)nilTolerantDictionaryWithObject:(ObjectType)object forKey:(KeyType<NSCopying>)key;

/**
 *  This method creates a new nil-tolerant collection, containing the original content of the passed dictionary parameter.
 *
 *  @return A nil-tolerant NSDictionary (a.k.a. `FunkyNilTolerantNSDictionary`).
 *  @see Mutable counterpart `+[NSMutableDictionary(FunkyNilTolerant) nilTolerantDictionaryWithDictionary:]`
 */
+ (FunkyNilTolerantNSDictionary*)nilTolerantDictionaryWithDictionary:(NSDictionary<KeyType, ObjectType>*)dictionary;

@end

/**
 *  This is a category on NSMutableDictionary to convert the current set into a nil-tolerant collection.
 *
 *  @see Immutable counterpart `NSDictionary(FunkyNilTolerant)`
 */
@interface NSMutableDictionary<KeyType, ObjectType> (FunkyNilTolerant)

/**
 *  This method converts the regular NSMutableDictionary into a nil-tolerant collection, with the same content.
 *
 *  @return A nil-tolerant NSMutableDictionary (a.k.a. `FunkyNilTolerantNSMutableDictionary`) with the same content.
 *  @see Immutable counterpart `-[NSDictionary(FunkyNilTolerant) nilTolerant]`
 */
- (FunkyNilTolerantNSMutableDictionary*)nilTolerant;

/**
 *  This method creates a new nil-tolerant mutable collection.
 *
 *  @return A nil-tolerant NSMutableDictionary (a.k.a. `FunkyNilTolerantNSMutableDictionary`).
 *  @see Immutable counterpart `+[NSDictionary(FunkyNilTolerant) nilTolerantDictionary]`
 */
+ (FunkyNilTolerantNSMutableDictionary*)nilTolerantDictionary;

/**
 *  This method creates a new nil-tolerant mutable collection by providing its capacity.
 *
 *  @param capacity The desired capacity of the collection
 *  @return A nil-tolerant NSMutableDictionary (a.k.a. `FunkyNilTolerantNSMutableDictionary`) with the given `capacity`.
 */
+ (FunkyNilTolerantNSMutableDictionary*)nilTolerantDictionaryWithCapacity:(NSUInteger)capacity;

/**
 *  This method creates a new nil-tolerant mutable collection, containing the given object parameter under the specified key.
 *
 *  @param object The object to be stored in the collection
 *  @param key The key under `object` should be put in
 *  @return A nil-tolerant NSMutableDictionary (a.k.a. `FunkyNilTolerantNSMutableDictionary`).
 *  @see Immutable counterpart `+[NSDictionary(FunkyNilTolerant) nilTolerantDictionaryWithObject:forKey:]`
 */
+ (FunkyNilTolerantNSMutableDictionary*)nilTolerantDictionaryWithObject:(ObjectType)object forKey:(KeyType<NSCopying>)key;

/**
 *  This method creates a new nil-tolerant mutable collection, containing the original content of the passed dictionary parameter.
 *
 *  @return A nil-tolerant NSMutableDictionary (a.k.a. `FunkyNilTolerantNSMutableDictionary`).
 *  @see Immutable counterpart `+[NSDictionary(FunkyNilTolerant) nilTolerantDictionaryWithDictionary:]`
 */
+ (FunkyNilTolerantNSMutableDictionary*)nilTolerantDictionaryWithDictionary:(NSDictionary<KeyType, ObjectType>*)dictionary;

@end
