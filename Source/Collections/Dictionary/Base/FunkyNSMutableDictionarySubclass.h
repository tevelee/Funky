//
//  FunkyNSMutableDictionarySubclass.h
//  Pods
//
//  Created by László Teveli on 2017. 04. 03..
//
//

#import <Foundation/Foundation.h>

/**
 *  This is a subclass of the NSMutableDictionary class-cluster, overriding the minimum set of getters and setters in order to further subclassing it, customizing the behaviour. This particular class is equivalent of an NSMutableDictionary, as the implementation uses NSMutableDictionary for the backing store.
 *
 *  @see Mutable counterpart `FunkyNSMutableDictionarySubclass`
 */
@interface FunkyNSMutableDictionarySubclass : NSMutableDictionary

/**
 *  Converts the current subclass into a basic NSMutableDictionary
 *
 *  @return An NSMutableDictionary copy of the current collection, keeping the same content
 */
- (NSMutableDictionary*)NSMutableDictionary;

@end
