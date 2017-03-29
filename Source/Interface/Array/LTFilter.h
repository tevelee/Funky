//
//  LTFilter.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 26..
//
//

#import <Foundation/Foundation.h>

typedef BOOL(^LTFilterPredicate)(id object);

@interface LTFilter : NSObject

+ (LTFilterPredicate)equalTo:(id)object;
+ (LTFilterPredicate)isKindOfClass:(Class)objectClass;
+ (LTFilterPredicate)isMemberOfClass:(Class)objectClass;
+ (LTFilterPredicate)respondsToSelector:(SEL)selector;

@end
