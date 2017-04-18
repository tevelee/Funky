//
//  FunkyFilter.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 26..
//
//

#import <Foundation/Foundation.h>
#import "FunkyFilterPredicate.h"

/**
 *  This is a collection of methods to provide filter predicate helpers
 */
@interface FunkyFilter : NSObject

/**
 *  An equality predicate telling that the object is equal to another one
 *
 *  @param object The other object to compare to
 *  @return A predicate to provide for boolean utility methods, like filter and contains
 */
+ (FunkyFilterPredicate)equalTo:(id)object;

/**
 *  A predicate telling that the object is a subclass (or its class is equal to) the provided class
 *
 *  @param objectClass The class to check
 *  @return A predicate to provide for boolean utility methods, like filter and contains
 */
+ (FunkyFilterPredicate)isKindOfClass:(Class)objectClass;

/**
 *  A predicate telling that the object's class is equal to the provided class
 *
 *  @param objectClass The class to check
 *  @return A predicate to provide for boolean utility methods, like filter and contains
 */
+ (FunkyFilterPredicate)isMemberOfClass:(Class)objectClass;

/**
 *  A predicate telling that the object responds to the given selector
 *
 *  @param selector The selector to respond to
 *  @return A predicate to provide for boolean utility methods, like filter and contains
 */
+ (FunkyFilterPredicate)respondsToSelector:(SEL)selector;

@end
