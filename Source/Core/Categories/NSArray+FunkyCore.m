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
