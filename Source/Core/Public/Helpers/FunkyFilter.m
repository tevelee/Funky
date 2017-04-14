//
//  FunkyFilter.m
//  Pods
//
//  Created by László Teveli on 2017. 03. 26..
//
//

#import "FunkyFilter.h"

@implementation FunkyFilter

+ (FunkyFilterPredicate)equalTo:(id)object
{
    return ^BOOL(id other) {
        return [other isEqual:object];
    };
}

+ (FunkyFilterPredicate)isKindOfClass:(Class)objectClass
{
    return ^BOOL(id other) {
        return [other isKindOfClass:objectClass];
    };
}

+ (FunkyFilterPredicate)isMemberOfClass:(Class)objectClass
{
    return ^BOOL(id other) {
        return [other isMemberOfClass:objectClass];
    };
}

+ (FunkyFilterPredicate)respondsToSelector:(SEL)selector
{
    return ^BOOL(id other) {
        return [other respondsToSelector:selector];
    };
}

@end
