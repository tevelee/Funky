//
//  NSObject+FunkyUtilities.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 26..
//
//

#import <Foundation/Foundation.h>

/**
 *  This extension provides simple and easy to use functional and general utilities for NSObject.
 *  If you need to prefix the extension methods in this category, you should import `NSObject+FunkyPrefixedUtilities.h`, where every utility method is prefixed with the `funky_` keyword for compatiblitiy reasons.
 *
 *  @see Unprefixed counterpart `NSObject(FunkyUtilities)`
 */
@interface NSObject (FunkyPrefixedUtilities)

/**
 *  Applies some logic on the current object and returns it afterwards.
 *
 *  @param block The logiv to be applied on the given object
 *  @return The same object after applying the custom logic
 *  @see Unprefixed counterpart `-[NSObject(FunkyUtilities) apply:]`
 */
- (instancetype)funky_apply:(void (^)(id object))block;

@end
