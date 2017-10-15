//
//  FunkyNilTolerantNSSet.h
//  Pods
//
//  Created by László Teveli on 2017. 04. 03..
//
//

#import "FunkyNSSetSubclass.h"
#import "FunkyNSMutableSetSubclass.h"

#pragma mark - NSSet Subclasses

/**
 *  This is a subclass of the NSSet class-cluster, providing nil-tolerant behaviour to NSSet. Whenever you would insert nil values into the set, it will disregard those cases instead of crashing.
 *
 *  @see Easy access via the category `NSSet(FunkyNilTolerant)`
 *  @see Mutable counterpart `FunkyNilTolerantNSMutableSet`
 */
@interface FunkyNilTolerantNSSet : FunkyNSSetSubclass

@end

/**
 *  This is a subclass of the NSSet class-cluster, providing nil-tolerant behaviour to NSMutableSet. Whenever you would insert nil values into the set, it will disregard those cases instead of crashing.
 *
 *  @see Easy access via the category `NSMutableSet(FunkyNilTolerant)`
 *  @see Immutable counterpart `FunkyNilTolerantNSSet`
 */
@interface FunkyNilTolerantNSMutableSet : FunkyNSMutableSetSubclass

@end

#pragma mark - NSSet Categories

/**
 *  This is a category on NSSet to convert the current set into a nil-tolerant collection.
 *
 *  @see Mutable counterpart `NSMutableSet(FunkyNilTolerant)`
 */
@interface NSSet<ObjectType> (FunkyNilTolerant)

/**
 *  This method converts the regular NSSet into a nil-tolerant collection, with the same content.
 *
 *  @return A nil-tolerant NSSet (a.k.a. `FunkyNilTolerantNSSet`) with the same content.
 *  @see Mutable counterpart `-[NSMutableSet(FunkyNilTolerant) nilTolerant]`
 */
- (FunkyNilTolerantNSSet*)nilTolerant;

/**
 *  This method creates a new nil-tolerant collection.
 *
 *  @return A nil-tolerant NSSet (a.k.a. `FunkyNilTolerantNSSet`).
 *  @see Mutable counterpart `+[NSMutableSet(FunkyNilTolerant) nilTolerantSet]`
 */
+ (FunkyNilTolerantNSSet*)nilTolerantSet;

/**
 *  This method creates a new nil-tolerant collection, containing the given object parameter.
 *
 *  @param object The object parameter intended to be stored in the collection
 *  @return A nil-tolerant NSSet (a.k.a. `FunkyNilTolerantNSSet`).
 *  @see Mutable counterpart `+[NSMutableSet(FunkyNilTolerant) nilTolerantSetWithObject:]`
 */
+ (FunkyNilTolerantNSSet*)nilTolerantSetWithObject:(ObjectType)object;

/**
 *  This method creates a new nil-tolerant collection, containing the original content of the passed set parameter.
 *
 *  @param set The items intended to be stored in the collection
 *  @return A nil-tolerant NSSet (a.k.a. `FunkyNilTolerantNSSet`).
 *  @see Mutable counterpart `+[NSMutableSet(FunkyNilTolerant) nilTolerantSetWithSet:]`
 */
+ (FunkyNilTolerantNSSet*)nilTolerantSetWithSet:(NSSet<ObjectType>*)set;

@end

/**
 *  This is a category on NSMutableSet to convert the current set into a nil-tolerant collection.
 *
 *  @see Immutable counterpart `NSSet(FunkyNilTolerant)`
 */
@interface NSMutableSet<ObjectType> (FunkyNilTolerant)

/**
 *  This method converts the regular NSMutableSet into a nil-tolerant collection, with the same content.
 *
 *  @return A nil-tolerant NSMutableSet (a.k.a. `FunkyNilTolerantNSMutableSet`) with the same content.
 *  @see Immutable counterpart `-[NSSet(FunkyNilTolerant) nilTolerant]`
 */
- (FunkyNilTolerantNSMutableSet*)nilTolerant;

/**
 *  This method creates a new nil-tolerant mutable collection.
 *
 *  @return A nil-tolerant NSMutableSet (a.k.a. `FunkyNilTolerantNSMutableSet`).
 *  @see Immutable counterpart `+[NSSet(FunkyNilTolerant) nilTolerantSet]`
 */
+ (FunkyNilTolerantNSMutableSet*)nilTolerantSet;

/**
 *  This method creates a new nil-tolerant mutable collection by providing its capacity.
 *
 *  @param capacity The desired capacity of the collection
 *  @return A nil-tolerant NSMutableSet (a.k.a. `FunkyNilTolerantNSMutableSet`) with the given `capacity`.
 */
+ (FunkyNilTolerantNSMutableSet*)nilTolerantSetWithCapacity:(NSUInteger)capacity;

/**
 *  This method creates a new nil-tolerant collection, containing the given object parameter.
 *
 *  @param object The object parameter intended to be stored in the collection
 *  @return A nil-tolerant NSSet (a.k.a. `FunkyNilTolerantNSMutableSet`).
 *  @see Immutable counterpart `+[NSSet(FunkyNilTolerant) nilTolerantSetWithObject:]`
 */
+ (FunkyNilTolerantNSMutableSet*)nilTolerantSetWithObject:(ObjectType)object;

/**
 *  This method creates a new nil-tolerant collection, containing the original content of the passed set parameter.
 *
 *  @param set The items intended to be stored in the collection
 *  @return A nil-tolerant NSSet (a.k.a. `FunkyNilTolerantNSMutableSet`).
 *  @see Immutable counterpart `+[NSSet(FunkyNilTolerant) nilTolerantSetWithSet:]`
 */
+ (FunkyNilTolerantNSMutableSet*)nilTolerantSetWithSet:(NSSet<ObjectType>*)set;

@end
