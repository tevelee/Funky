//
//  FunkyNSMutableSetSubclass.h
//  Pods
//
//  Created by László Teveli on 2017. 04. 03..
//
//

#import <Foundation/Foundation.h>

/**
 *  This is a subclass of the NSMutableSet class-cluster, overriding the minimum set of getters and setters in order to further subclassing it, customizing the behaviour. This particular class is equivalent of an NSMutableSet, as the implementation uses NSMutableSet for the backing store.
 *
 *  @see Mutable counterpart `FunkyNSMutableSetSubclass`
 */
@interface FunkyNSMutableSetSubclass : NSMutableSet

/**
 *  Converts the current subclass into a basic NSMutableSet
 *
 *  @return An NSMutableSet copy of the current collection, keeping the same content
 */
- (NSMutableSet*)NSMutableSet;

@end
