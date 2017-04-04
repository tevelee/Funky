//
//  NSSet+FunkyCore.m
//  Pods
//
//  Created by László Teveli on 2017. 03. 26..
//
//

#import "NSSet+FunkyCore.h"

@implementation NSSet (FunkyCore)

- (FunkySetUtilities*)utilities
{
    return [FunkySetUtilities utilitiesWithObject:self];
}

#pragma mark - FunkyCollectionCounterpart

+ (Class)classForImmutableCounterPart
{
    return [NSSet class];
}

+ (Class)classForMutableCounterPart
{
    return [NSMutableSet class];
}

+ (Class)classToFlatten
{
    return [NSSet class];
}

@end
