//
//  NSMutableArraySubclass.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 22..
//
//

#import <Foundation/Foundation.h>

/**
 *  This is a subclass of the NSMutableArray class-cluster, overriding the minimum set of getters and setters in order to further subclassing it, customizing the behaviour. This particular class is equivalent of an NSMutableArray, as the implementation uses NSMutableArray for the backing store.
 *
 *  @see Mutable counterpart `FunkyNSMutableArraySubclass`
 */
@interface FunkyNSMutableArraySubclass : NSMutableArray

/**
 *  Converts the current subclass into a basic NSMutableArray
 *
 *  @return An NSMutableArray copy of the current collection, keeping the same content
 */
- (NSMutableArray*)NSMutableArray;

@end
