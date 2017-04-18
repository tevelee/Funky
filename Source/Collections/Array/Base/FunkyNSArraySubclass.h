//
//  NSArraySubclass.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 22..
//
//

#import <Foundation/Foundation.h>

/**
 *  This is a subclass of the NSArray class-cluster, overriding the minimum set of getters and setters in order to further subclassing it, customizing the behaviour. This particular class is equivalent of an NSArray, as the implementation uses NSArray for the backing store.
 *
 *  @see Mutable counterpart `FunkyNSMutableArraySubclass`
 */
@interface FunkyNSArraySubclass : NSArray

/**
 *  Converts the current subclass into a basic NSArray
 *
 *  @return An immutable NSArray copy of the current collection, keeping the same content
 */
- (NSArray*)NSArray;

@end
