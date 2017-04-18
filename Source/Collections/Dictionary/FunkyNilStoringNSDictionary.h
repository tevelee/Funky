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
 *  This is a subclass of the NSDictionary class-cluster, providing nil-storing behaviour to NSDictionary. Whenever you would insert nil values into the set, it will insert them instead of crashing. You can also get back these values via the getters.
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
@interface NSDictionary (FunkyNilStoring)

/**
 *  This method converts the regular NSDictionary into a nil-storing collection, with the same content.
 *
 *  @return A nil-storing NSDictionary (a.k.a. `FunkyNilStoringNSDictionary`) with the same content.
 *  @see Mutable counterpart `NSMutableDictionary(FunkyNilStoring)`
 */
- (FunkyNilStoringNSDictionary*)nilStoring;

@end

/**
 *  This is a category on NSMutableDictionary to convert the current set into a nil-storing collection.
 *
 *  @see Immutable counterpart `NSDictionary(FunkyNilStoring)`
 */
@interface NSMutableDictionary (FunkyNilStoring)

/**
 *  This method converts the regular NSMutableDictionary into a nil-storing collection, with the same content.
 *
 *  @return A nil-storing NSMutableDictionary (a.k.a. `FunkyNilStoringNSMutableDictionary`) with the same content.
 *  @see Immutable counterpart `NSDictionary(FunkyNilStoring)`
 */
- (FunkyNilStoringNSMutableDictionary*)nilStoring;

@end
