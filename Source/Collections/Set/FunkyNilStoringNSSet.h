//
//  FunkyNilStoringNSSet.h
//  Pods
//
//  Created by László Teveli on 2017. 04. 03..
//
//

#import "FunkyNSSetSubclass.h"
#import "FunkyNSMutableSetSubclass.h"

#pragma mark - NSSet Subclasses

/**
 *  This is a subclass of the NSSet class-cluster, providing nil-storing behaviour to NSSet. Whenever you would insert nil values into the set, it will insert them instead of crashing. You can also get back these values via the getters.
 *
 *  @see Easy access via the category `NSSet(FunkyNilStoring)`
 *  @see Mutable counterpart `FunkyNilStoringNSMutableSet`
 */
@interface FunkyNilStoringNSSet : FunkyNSSetSubclass

@end

/**
 *  This is a subclass of the NSSet class-cluster, providing nil-storing behaviour to NSMutableSet. Whenever you would insert nil values into the set, it will insert them instead of crashing. You can also get back these values via the getters.
 *
 *  @see Easy access via the category `NSMutableSet(FunkyNilStoring)`
 *  @see Immutable counterpart `FunkyNilStoringNSSet`
 */
@interface FunkyNilStoringNSMutableSet : FunkyNSMutableSetSubclass

@end

#pragma mark - NSSet Categories

/**
 *  This is a category on NSSet to convert the current set into a nil-storing collection.
 *
 *  @see Mutable counterpart `NSMutableSet(FunkyNilStoring)`
 */
@interface NSSet (FunkyNilStoring)

/**
 *  This method converts the regular NSSet into a nil-storing collection, with the same content.
 *
 *  @return A nil-storing NSSet (a.k.a. `FunkyNilStoringNSSet`) with the same content.
 *  @see Mutable counterpart `-[NSMutableSet(FunkyNilStoring) nilStoring]`
 */
- (FunkyNilStoringNSSet*)nilStoring;

@end

/**
 *  This is a category on NSMutableSet to convert the current set into a nil-storing collection.
 *
 *  @see Immutable counterpart `NSSet(FunkyNilStoring)`
 */
@interface NSMutableSet (FunkyNilStoring)

/**
 *  This method converts the regular NSMutableSet into a nil-storing collection, with the same content.
 *
 *  @return A nil-storing NSMutableSet (a.k.a. `FunkyNilStoringNSMutableSet`) with the same content.
 *  @see Immutable counterpart `-[NSSet(FunkyNilStoring) nilStoring]`
 */
- (FunkyNilStoringNSMutableSet*)nilStoring;

@end
