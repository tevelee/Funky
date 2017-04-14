//
//  NSArray+FunkyCore.m
//  Pods
//
//  Created by László Teveli on 2017. 03. 26..
//
//

#import "NSArray+FunkyCore.h"

@implementation NSArray (FunkyCore)

- (FunkyArrayUtilities*)utilities
{
    return [FunkyArrayUtilities utilitiesWithObject:self];
}

#pragma mark - FunkyCollectionCounterpart

+ (Class)classForImmutableCounterPart
{
    return [NSArray class];
}

+ (Class)classForMutableCounterPart
{
    return [NSMutableArray class];
}

+ (Class)classToFlatten
{
    return [NSArray class];
}

@end

@implementation NSMutableArray (FunkyCore)

#pragma mark - FunkyMutableCollectionWithCapacity

+ (id)newWithCapacity:(NSUInteger)capacity
{
    return [self arrayWithCapacity:capacity];
}

#pragma mark - Utilities

- (FunkyMutableArrayUtilities*)utilities
{
    return [FunkyMutableArrayUtilities utilitiesWithObject:self];
}

@end
