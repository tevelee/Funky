//
//  LTFilter.m
//  Pods
//
//  Created by László Teveli on 2017. 03. 26..
//
//

#import "LTFilter.h"
#import "LTArrayUtilities.h"

@implementation LTFilter

+ (LTArrayUtilities*)utilities
{
    return [LTArrayUtilities utilitiesWithObject:self];
}

+ (LTFilterPredicate)equalTo:(id)object
{
    return [self.utilities predicateForEquality:object];
}

+ (LTFilterPredicate)isKindOfClass:(Class)objectClass
{
    return [self.utilities predicateForSubclass:objectClass];
}

+ (LTFilterPredicate)isMemberOfClass:(Class)objectClass
{
    return [self.utilities predicateForClass:objectClass];
}

+ (LTFilterPredicate)respondsToSelector:(SEL)selector
{
    return [self.utilities predicateForSelector:selector];
}

@end
