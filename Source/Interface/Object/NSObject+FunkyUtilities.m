//
//  NSObject+FunkyUtilities.m
//  Pods
//
//  Created by László Teveli on 2017. 03. 26..
//
//

#import "NSObject+FunkyUtilities.h"
#import "NSObject+FunkyCore.h"

@implementation NSObject (FunkyUtilities)

- (instancetype)apply:(void (^)(id object))block
{
    return [self.utilities apply:block];
}

@end
