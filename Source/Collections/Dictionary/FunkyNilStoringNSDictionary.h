//
//  FunkyNilStoringNSDictionary.h
//  Pods
//
//  Created by László Teveli on 2017. 04. 03..
//
//

#import "FunkyNSDictionarySubclass.h"
#import "FunkyNSMutableDictionarySubclass.h"

#pragma mark - NSDictionary Subclasses

/**
 *  This is a subclass of the NSDictionary class-cluster, providing nil-storing behaviour to NSDictionary. Whenever you would insert nil values into the set, it will insert them instead of crashing. You can also get back these values via the getters.
 *
 *  @see Easy access via the category `NSDictionary(FunkyNilStoring)`
 *  @see Mutable counterpart `FunkyNilStoringNSMutableDictionary`
 */
@interface FunkyNilStoringNSDictionary : FunkyNSDictionarySubclass

@end

/**
 *  This is a subclass of the NSDictionary class-cluster, providing nil-storing behaviour to NSMutableDictionary. Whenever you would insert nil values into the set, it will insert them instead of crashing. You can also get back these values via the getters.
 *
 *  @see Easy access via the category `NSMutableDictionary(FunkyNilStoring)`
 *  @see Immutable counterpart `FunkyNilStoringNSDictionary`
 */
@interface FunkyNilStoringNSMutableDictionary : FunkyNSMutableDictionarySubclass

@end

#pragma mark - NSDictionary Categories

/**
 *  This is a category on NSDictionary to convert the current set into a nil-storing collection.
 *
 *  @see Mutable counterpart `NSMutableDictionary(FunkyNilStoring)`
 */
@interface NSDictionary<KeyType, ObjectType> (FunkyNilStoring)

/**
 *  This method converts the regular NSDictionary into a nil-storing collection, with the same content.
 *
 *  @return A nil-storing NSDictionary (a.k.a. `FunkyNilStoringNSDictionary`) with the same content.
 *  @see Mutable counterpart `-[NSMutableDictionary(FunkyNilStoring) nilStoring]`
 */
- (FunkyNilStoringNSDictionary*)nilStoring;

/**
 *  This method creates a new nil-storing collection.
 *
 *  @return A nil-storing NSDictionary (a.k.a. `FunkyNilStoringNSDictionary`).
 *  @see Mutable counterpart `-[NSMutableDictionary(FunkyNilStoring) nilStoringDictionary]`
 */
+ (FunkyNilStoringNSDictionary*)nilStoringDictionary;

/**
 *  This method creates a new nil-storing collection, containing the given object parameter under the specified key.
 *
 *  @param object The object to be stored in the collection
 *  @param key The key under `object` should be put in
 *  @return A nil-storing NSDictionary (a.k.a. `FunkyNilStoringNSDictionary`).
 *  @see Mutable counterpart `-[NSMutableDictionary(FunkyNilStoring) nilStoringDictionaryWithObject:forKey:]`
 */
+ (FunkyNilStoringNSDictionary*)nilStoringDictionaryWithObject:(ObjectType)object forKey:(KeyType<NSCopying>)key;

/**
 *  This method creates a new nil-storing collection, containing the original content of the passed dictionary parameter.
 *
 *  @return A nil-storing NSDictionary (a.k.a. `FunkyNilStoringNSDictionary`).
 *  @see Mutable counterpart `-[NSMutableDictionary(FunkyNilStoring) nilStoringDictionaryWithDictionary:]`
 */
+ (FunkyNilStoringNSDictionary*)nilStoringDictionaryWithDictionary:(NSDictionary<KeyType, ObjectType>*)dictionary;

@end

/**
 *  This is a category on NSMutableDictionary to convert the current set into a nil-storing collection.
 *
 *  @see Immutable counterpart `NSDictionary(FunkyNilStoring)`
 */
@interface NSMutableDictionary<KeyType, ObjectType> (FunkyNilStoring)

/**
 *  This method converts the regular NSMutableDictionary into a nil-storing collection, with the same content.
 *
 *  @return A nil-storing NSMutableDictionary (a.k.a. `FunkyNilStoringNSMutableDictionary`) with the same content.
 *  @see Immutable counterpart `-[NSDictionary(FunkyNilStoring) nilStoring]`
 */
- (FunkyNilStoringNSMutableDictionary*)nilStoring;

/**
 *  This method creates a new nil-storing mutable collection.
 *
 *  @return A nil-storing NSMutableDictionary (a.k.a. `FunkyNilStoringNSMutableDictionary`).
 *  @see Immutable counterpart `-[NSDictionary(FunkyNilStoring) nilStoringDictionary]`
 */
+ (FunkyNilStoringNSMutableDictionary*)nilStoringDictionary;

/**
 *  This method creates a new nil-storing mutable collection by providing its capacity.
 *
 *  @param capacity The desired capacity of the collection
 *  @return A nil-storing NSMutableDictionary (a.k.a. `FunkyNilStoringNSMutableDictionary`) with the given `capacity`.
 */
+ (FunkyNilStoringNSMutableDictionary*)nilStoringDictionaryWithCapacity:(NSUInteger)capacity;

/**
 *  This method creates a new nil-storing mutable collection, containing the given object parameter under the specified key.
 *
 *  @param object The object to be stored in the collection
 *  @param key The key under `object` should be put in
 *  @return A nil-storing NSMutableDictionary (a.k.a. `FunkyNilStoringNSMutableDictionary`).
 *  @see Immutable counterpart `-[NSDictionary(FunkyNilStoring) nilStoringDictionaryWithObject:forKey:]`
 */
+ (FunkyNilStoringNSMutableDictionary*)nilStoringDictionaryWithObject:(ObjectType)object forKey:(KeyType<NSCopying>)key;

/**
 *  This method creates a new nil-storing mutable collection, containing the original content of the passed dictionary parameter.
 *
 *  @return A nil-storing NSMutableDictionary (a.k.a. `FunkyNilStoringNSMutableDictionary`).
 *  @see Immutable counterpart `-[NSDictionary(FunkyNilStoring) nilStoringDictionaryWithDictionary:]`
 */
+ (FunkyNilStoringNSMutableDictionary*)nilStoringDictionaryWithDictionary:(NSDictionary<KeyType, ObjectType>*)dictionary;

@end
