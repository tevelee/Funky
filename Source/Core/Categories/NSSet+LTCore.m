//
//  NSSet+LTCore.m
//  Pods
//
//  Created by László Teveli on 2017. 03. 26..
//
//

#import "NSSet+LTCore.h"

@implementation NSSet (LTCore)

- (LTCollectionUtilities*)utilities
{
    return [LTCollectionUtilities utilitiesWithObject:self];
}

#pragma mark - LTCollectionCounterpart

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
