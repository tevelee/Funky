//
//  FunkyNilStoringNSArray.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 21..
//
//

#import "FunkyNSArraySubclass.h"
#import "FunkyNSMutableArraySubclass.h"

#pragma mark - NSArray Subclasses

/**
 *  This is a subclass of the NSArray class-cluster, providing nil-storing behaviour to NSArray. Whenever you would insert nil values into the set, it will insert them instead of crashing. You can also get back these values via the getters.
 *
 *  @see Easy access via the category `NSArray(FunkyNilStoring)`
 *  @see Mutable counterpart `FunkyNilStoringNSMutableArray`
 */
@interface FunkyNilStoringNSArray : FunkyNSArraySubclass

@end

/**
 *  This is a subclass of the NSArray class-cluster, providing nil-storing behaviour to NSMutableArray. Whenever you would insert nil values into the set, it will insert them instead of crashing. You can also get back these values via the getters.
 *
 *  @see Easy access via the category `NSMutableArray(FunkyNilStoring)`
 *  @see Immutable counterpart `FunkyNilStoringNSArray`
 */
@interface FunkyNilStoringNSMutableArray : FunkyNSMutableArraySubclass

@end

#pragma mark - NSArray Categories

/**
 *  This is a category on NSArray to convert the current set into a nil-storing collection.
 *
 *  @see Mutable counterpart `NSMutableArray(FunkyNilStoring)`
 */
@interface NSArray<ObjectType> (FunkyNilStoring)

/**
 *  This method converts the regular NSArray into a nil-storing collection, with the same content.
 *
 *  @return A nil-storing NSArray (a.k.a. `FunkyNilStoringNSArray`) with the same content.
 *  @see Mutable counterpart `-[NSMutableArray(FunkyNilStoring) nilStoring]`
 */
- (FunkyNilStoringNSArray*)nilStoring;

/**
 *  This method creates a new nil-storing collection.
 *
 *  @return A nil-storing NSArray (a.k.a. `FunkyNilStoringNSArray`).
 *  @see Mutable counterpart `-[NSMutableArray(FunkyNilStoring) nilStoringArray]`
 */
+ (FunkyNilStoringNSArray*)nilStoringArray;

/**
 *  This method creates a new nil-storing collection, containing the given object parameter.
 *
 *  @param object The object parameter intended to be stored in the collection
 *  @return A nil-storing NSArray (a.k.a. `FunkyNilStoringNSArray`).
 *  @see Mutable counterpart `-[NSMutableArray(FunkyNilStoring) nilStoringArrayWithObject:]`
 */
+ (FunkyNilStoringNSArray*)nilStoringArrayWithObject:(ObjectType)object;

/**
 *  This method creates a new nil-storing collection, containing the original content of the passed array parameter.
 *
 *  @param array The items intended to be stored in the collection
 *  @return A nil-storing NSArray (a.k.a. `FunkyNilStoringNSArray`).
 *  @see Mutable counterpart `-[NSMutableArray(FunkyNilStoring) nilStoringArrayWithArray:]`
 */
+ (FunkyNilStoringNSArray*)nilStoringArrayWithArray:(NSArray<ObjectType>*)array;

@end

/**
 *  This is a category on NSMutableArray to convert the current set into a nil-storing collection.
 *
 *  @see Immutable counterpart `NSArray(FunkyNilStoring)`
 */
@interface NSMutableArray<ObjectType> (FunkyNilStoring)

/**
 *  This method converts the regular NSMutableArray into a nil-storing collection, with the same content.
 *
 *  @return A nil-storing NSMutableArray (a.k.a. `FunkyNilStoringNSMutableArray`) with the same content.
 *  @see Immutable counterpart `-[NSArray(FunkyNilStoring) nilStoring]`
 */
- (FunkyNilStoringNSMutableArray*)nilStoring;

/**
 *  This method creates a new nil-storing mutable collection.
 *
 *  @return A nil-storing NSMutableArray (a.k.a. `FunkyNilStoringNSMutableArray`).
 *  @see Immutable counterpart `-[NSArray(FunkyNilStoring) nilStoringArray]`
 */
+ (FunkyNilStoringNSMutableArray*)nilStoringArray;

/**
 *  This method creates a new nil-storing mutable collection by providing its capacity.
 *
 *  @param capacity The desired capacity of the collection
 *  @return A nil-storing NSMutableArray (a.k.a. `FunkyNilStoringNSMutableArray`) with the given `capacity`.
 */
+ (FunkyNilStoringNSMutableArray *)nilStoringArrayWithCapacity:(NSUInteger)capacity;

/**
 *  This method creates a new nil-storing collection, containing the given object parameter.
 *
 *  @param object The object parameter intended to be stored in the collection
 *  @return A nil-storing NSArray (a.k.a. `FunkyNilStoringNSMutableArray`).
 *  @see Immutable counterpart `-[NSArray(FunkyNilStoring) nilStoringArrayWithObject:]`
 */
+ (FunkyNilStoringNSMutableArray*)nilStoringArrayWithObject:(ObjectType)object;

/**
 *  This method creates a new nil-storing collection, containing the original content of the passed array parameter.
 *
 *  @param array The items intended to be stored in the collection
 *  @return A nil-storing NSArray (a.k.a. `FunkyNilStoringNSMutableArray`).
 *  @see Immutable counterpart `-[NSArray(FunkyNilStoring) nilStoringArrayWithArray:]`
 */
+ (FunkyNilStoringNSMutableArray*)nilStoringArrayWithArray:(NSArray<ObjectType>*)array;

@end
