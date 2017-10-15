//
//  FunkyNilTolerantNSArray.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 21..
//
//

#import "FunkyNSArraySubclass.h"
#import "FunkyNSMutableArraySubclass.h"

#pragma mark - NSArray Subclasses

/**
 *  This is a subclass of the NSArray class-cluster, providing nil-tolerant behaviour to NSArray. Whenever you would insert nil values into the set, it will disregard those cases instead of crashing.
 *
 *  @see Easy access via the category `NSArray(FunkyNilTolerant)`
 *  @see Mutable counterpart `FunkyNilTolerantNSMutableArray`
 */
@interface FunkyNilTolerantNSArray : FunkyNSArraySubclass

@end

/**
 *  This is a subclass of the NSArray class-cluster, providing nil-tolerant behaviour to NSMutableArray. Whenever you would insert nil values into the set, it will disregard those cases instead of crashing.
 *
 *  @see Easy access via the category `NSMutableArray(FunkyNilTolerant)`
 *  @see Immutable counterpart `FunkyNilTolerantNSArray`
 */
@interface FunkyNilTolerantNSMutableArray : FunkyNSMutableArraySubclass

@end

#pragma mark - NSArray Categories

/**
 *  This is a category on NSArray to convert the current set into a nil-tolerant collection.
 *
 *  @see Mutable counterpart `NSMutableArray(FunkyNilTolerant)`
 */
@interface NSArray<ObjectType> (FunkyNilTolerant)

/**
 *  This method converts the regular NSArray into a nil-tolerant collection, with the same content.
 *
 *  @return A nil-tolerant NSArray (a.k.a. `FunkyNilTolerantNSArray`) with the same content.
 *  @see Mutable counterpart `-[NSMutableArray(FunkyNilTolerant) nilTolerant]`
 */
- (FunkyNilTolerantNSArray*)nilTolerant;

/**
 *  This method creates a new nil-tolerant collection.
 *
 *  @return A nil-tolerant NSArray (a.k.a. `FunkyNilTolerantNSArray`).
 *  @see Mutable counterpart `-[NSMutableArray(FunkyNilTolerant) nilTolerantArray]`
 */
+ (FunkyNilTolerantNSArray*)nilTolerantArray;

/**
 *  This method creates a new nil-tolerant collection, containing the given object parameter.
 *
 *  @param object The object parameter intended to be stored in the collection
 *  @return A nil-tolerant NSArray (a.k.a. `FunkyNilTolerantNSArray`).
 *  @see Mutable counterpart `-[NSMutableArray(FunkyNilTolerant) nilTolerantArrayWithObject:]`
 */
+ (FunkyNilTolerantNSArray*)nilTolerantArrayWithObject:(ObjectType)object;

/**
 *  This method creates a new nil-tolerant collection, containing the original content of the passed array parameter.
 *
 *  @param array The items intended to be stored in the collection
 *  @return A nil-tolerant NSArray (a.k.a. `FunkyNilTolerantNSArray`).
 *  @see Mutable counterpart `-[NSMutableArray(FunkyNilTolerant) nilTolerantArrayWithArray:]`
 */
+ (FunkyNilTolerantNSArray*)nilTolerantArrayWithArray:(NSArray<ObjectType>*)array;

@end

/**
 *  This is a category on NSMutableArray to convert the current set into a nil-tolerant collection.
 *
 *  @see Immutable counterpart `NSArray(FunkyNilTolerant)`
 */
@interface NSMutableArray<ObjectType> (FunkyNilTolerant)

/**
 *  This method converts the regular NSMutableArray into a nil-tolerant collection, with the same content.
 *
 *  @return A nil-tolerant NSMutableArray (a.k.a. `FunkyNilTolerantNSMutableArray`) with the same content.
 *  @see Immutable counterpart `-[NSArray(FunkyNilTolerant) nilTolerant]`
 */
- (FunkyNilTolerantNSMutableArray*)nilTolerant;

/**
 *  This method creates a new nil-tolerant mutable collection.
 *
 *  @return A nil-tolerant NSMutableArray (a.k.a. `FunkyNilTolerantNSMutableArray`).
 *  @see Immutable counterpart `-[NSArray(FunkyNilTolerant) nilTolerantArray]`
 */
+ (FunkyNilTolerantNSMutableArray*)nilTolerantArray;

/**
 *  This method creates a new nil-tolerant mutable collection by providing its capacity.
 *
 *  @param capacity The desired capacity of the collection
 *  @return A nil-tolerant NSMutableArray (a.k.a. `FunkyNilTolerantNSMutableArray`) with the given `capacity`.
 */
+ (FunkyNilTolerantNSMutableArray *)nilTolerantArrayWithCapacity:(NSUInteger)capacity;

/**
 *  This method creates a new nil-tolerant collection, containing the given object parameter.
 *
 *  @param object The object parameter intended to be stored in the collection
 *  @return A nil-tolerant NSArray (a.k.a. `FunkyNilTolerantNSMutableArray`).
 *  @see Immutable counterpart `-[NSArray(FunkyNilTolerant) nilTolerantArrayWithObject:]`
 */
+ (FunkyNilTolerantNSMutableArray*)nilTolerantArrayWithObject:(ObjectType)object;

/**
 *  This method creates a new nil-tolerant collection, containing the original content of the passed array parameter.
 *
 *  @param array The items intended to be stored in the collection
 *  @return A nil-tolerant NSArray (a.k.a. `FunkyNilTolerantNSMutableArray`).
 *  @see Immutable counterpart `-[NSArray(FunkyNilTolerant) nilTolerantArrayWithArray:]`
 */
+ (FunkyNilTolerantNSMutableArray*)nilTolerantArrayWithArray:(NSArray<ObjectType>*)array;

@end
