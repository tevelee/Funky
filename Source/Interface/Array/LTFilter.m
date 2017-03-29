//
//  LTFilter.m
//  Pods
//
//  Created by László Teveli on 2017. 03. 26..
//
//

#import "LTFilter.h"

@implementation LTFilter

+ (LTFilterPredicate)equalTo:(id)object
{
    return ^BOOL(id other) {
        return [other isEqual:object];
    };
}

+ (LTFilterPredicate)isKindOfClass:(Class)objectClass
{
    return ^BOOL(id other) {
        return [other isKindOfClass:objectClass];
    };
}

+ (LTFilterPredicate)isMemberOfClass:(Class)objectClass
{
    return ^BOOL(id other) {
        return [other isMemberOfClass:objectClass];
    };
}

+ (LTFilterPredicate)respondsToSelector:(SEL)selector
{
    return ^BOOL(id other) {
        return [other respondsToSelector:selector];
    };
}

@end
