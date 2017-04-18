//
//  FunkyNSSetSubclass.h
//  Pods
//
//  Created by László Teveli on 2017. 04. 03..
//
//

#import <Foundation/Foundation.h>

/**
 *  This is a subclass of the NSSet class-cluster, overriding the minimum set of getters and setters in order to further subclassing it, customizing the behaviour. This particular class is equivalent of an NSSet, as the implementation uses NSSet for the backing store.
 *
 *  @see Mutable counterpart `FunkyNSMutableSetSubclass`
 */
@interface FunkyNSSetSubclass : NSSet

/**
 *  Converts the current subclass into a basic NSSet
 *
 *  @return An immutable NSSet copy of the current collection, keeping the same content
 */
- (NSSet*)NSSet;

@end
