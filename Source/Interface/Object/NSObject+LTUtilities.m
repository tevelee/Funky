//
//  NSObject+LTUtilities.m
//  Pods
//
//  Created by László Teveli on 2017. 03. 26..
//
//

#import "NSObject+LTUtilities.h"
#import "LTGeneralUtilities.h"

@implementation NSObject (LTUtilities)

- (instancetype)apply:(void (^)(id object))block
{
    LTGeneralUtilities* utilities = [LTGeneralUtilities utilitiesWithObject:self];
    return [utilities apply:block];
}

@end
