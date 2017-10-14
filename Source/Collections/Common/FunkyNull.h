//
//  FunkyNull.h
//  Pods
//
//  Created by László Teveli on 2017. 10. 15..
//

#import <Foundation/Foundation.h>

/**
 *  This is a private class with one single purpose: represent a null object, storable in any collection.
 *  Similar to NSNull in semantics, but a custom one in order to not interfere with use-cases where using NSNull already.
 */
@interface FunkyNull : NSObject <NSCopying>

/**
 *  This initialiser is the only single way intended to use the class. The returned instance behaves exactly as [NSNull null].
 *  Under the hood this method is a singleton instance, the only way to instantiate the class.
 *
 *  @return A null object, which can be used as a null onbject in collections. The returned instance is only equal to itself, when using `-[NSObject isEqual:]`
 */
+ (instancetype)null;

/**
 *  In order to restrict instantiating this class in any way but `+[FunkyNull null]`, this method makes the initialisation invalid.
 */
- (instancetype)__unavailable init;

/**
 *  In order to restrict instantiating this class in any way but `+[FunkyNull null]`, this method makes the instantiation invalid.
 */
+ (instancetype)__unavailable new;

@end
