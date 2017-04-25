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
@interface NSDictionary (FunkyNilTolerant)

/**
 *  This method converts the regular NSDictionary into a nil-tolerant collection, with the same content.
 *
 *  @return A nil-tolerant NSDictionary (a.k.a. `FunkyNilTolerantNSDictionary`) with the same content.
 *  @see Mutable counterpart `NSMutableDictionary(FunkyNilTolerant)`
 */
- (FunkyNilTolerantNSDictionary*)nilTolerant;

@end

/**
 *  This is a category on NSMutableDictionary to convert the current set into a nil-tolerant collection.
 *
 *  @see Immutable counterpart `NSDictionary(FunkyNilTolerant)`
 */
@interface NSMutableDictionary (FunkyNilTolerant)

/**
 *  This method converts the regular NSMutableDictionary into a nil-tolerant collection, with the same content.
 *
 *  @return A nil-tolerant NSMutableDictionary (a.k.a. `FunkyNilTolerantNSMutableDictionary`) with the same content.
 *  @see Immutable counterpart `NSDictionary(FunkyNilTolerant)`
 */
- (FunkyNilTolerantNSMutableDictionary*)nilTolerant;

@end
