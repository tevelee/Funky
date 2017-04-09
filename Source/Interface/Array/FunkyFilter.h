//
//  FunkyFilter.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 26..
//
//

#import <Foundation/Foundation.h>
#import "FunkyFilterPredicate.h"

@interface FunkyFilter : NSObject

+ (FunkyFilterPredicate)equalTo:(id)object;
+ (FunkyFilterPredicate)isKindOfClass:(Class)objectClass;
+ (FunkyFilterPredicate)isMemberOfClass:(Class)objectClass;
+ (FunkyFilterPredicate)respondsToSelector:(SEL)selector;

@end
