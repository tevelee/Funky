//
//  NSSet+Utilities.m
//  Pods
//
//  Created by László Teveli on 2017. 03. 21..
//
//

#import "NSSet+Utilities.h"
#import "CollectionUtilities.h"

@implementation NSSet (Utilities)

#pragma mark - Counterpart

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

#pragma mark - Utilities

- (NSSet*)map:(id(^)(id))block
{
    CollectionUtilities* utils = [CollectionUtilities utilitiesWithObject:self];
    return [utils map:block];
}

@end

@implementation NSMutableSet (Utilities)

#pragma mark - Capacity

+ (id)newWithCapacity:(NSUInteger)capacity
{
    return [self setWithCapacity:capacity];
}

@end
