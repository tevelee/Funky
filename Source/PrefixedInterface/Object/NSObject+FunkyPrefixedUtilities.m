//
//  NSObject+FunkyUtilities.m
//  Pods
//
//  Created by László Teveli on 2017. 03. 26..
//
//

#import "NSObject+FunkyPrefixedUtilities.h"
#import "NSObject+FunkyCore.h"

@implementation NSObject (FunkyPrefixedUtilities)

- (instancetype)funky_apply:(void (^)(id object))block
{
    return [self.utilities apply:block];
}

@end
