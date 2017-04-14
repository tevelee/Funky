//
//  NSObject+FunkyCore.m
//  Pods
//
//  Created by László Teveli on 2017. 04. 07..
//
//

#import "NSObject+FunkyCore.h"

@implementation NSObject (FunkyCore)

- (FunkyGeneralUtilities*)utilities
{
    return [FunkyGeneralUtilities utilitiesWithObject:self];
}

@end
