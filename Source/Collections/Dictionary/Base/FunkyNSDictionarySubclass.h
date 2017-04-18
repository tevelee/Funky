//
//  FunkyNSDictionarySubclass.h
//  Pods
//
//  Created by László Teveli on 2017. 04. 03..
//
//

#import <Foundation/Foundation.h>

/**
 *  This is a subclass of the NSDictionary class-cluster, overriding the minimum set of getters and setters in order to further subclassing it, customizing the behaviour. This particular class is equivalent of an NSDictionary, as the implementation uses NSDictionary for the backing store.
 *
 *  @see Mutable counterpart `FunkyNSMutableDictionarySubclass`
 */
@interface FunkyNSDictionarySubclass : NSDictionary

/**
 *  Converts the current subclass into a basic NSDictionary
 *
 *  @return An immutable NSDictionary copy of the current collection, keeping the same content
 */
- (NSDictionary*)NSDictionary;

@end
