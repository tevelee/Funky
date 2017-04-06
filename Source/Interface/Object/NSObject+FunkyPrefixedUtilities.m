//
//  NSObject+FunkyUtilities.m
//  Pods
//
//  Created by László Teveli on 2017. 03. 26..
//
//

#import "NSObject+FunkyUtilities.h"
#import "FunkyGeneralUtilities.h"

@implementation NSObject (FunkyUtilities)

- (instancetype)funky_apply:(void (^)(id object))block
{
    FunkyGeneralUtilities* utilities = [FunkyGeneralUtilities utilitiesWithObject:self];
    return [utilities apply:block];
}

@end
