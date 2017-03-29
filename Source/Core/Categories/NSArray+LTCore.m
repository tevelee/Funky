//
//  NSArray+LTCore.m
//  Pods
//
//  Created by László Teveli on 2017. 03. 26..
//
//

#import "NSArray+LTCore.h"

@implementation NSArray (LTCore)

- (LTArrayUtilities*)utilities
{
    return [LTArrayUtilities utilitiesWithObject:self];
}

#pragma mark - LTCollectionCounterpart

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
