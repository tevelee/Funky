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

@implementation NSMutableSet (FunkyCore)

#pragma mark - FunkyMutableCollectionWithCapacity

+ (id)newWithCapacity:(NSUInteger)capacity
{
    return [self setWithCapacity:capacity];
}

#pragma mark - Utilities

- (FunkyMutableSetUtilities*)utilities
{
    return [FunkyMutableSetUtilities utilitiesWithObject:self];
}

@end
