//
//  NSArray+Utilities.m
//  Pods
//
//  Created by László Teveli on 2017. 03. 21..
//
//

#import "NSArray+Utilities.h"
#import "CollectionUtilities.h"

@implementation NSArray (Utilities)

#pragma mark - Counterpart

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

#pragma mark - Utilities

- (NSArray*)map:(id(^)(id))block
{
    CollectionUtilities* utils = [CollectionUtilities utilitiesWithObject:self];
    return [utils map:block];
}

@end

@implementation NSMutableArray (Utilities)

#pragma mark - Capacity

+ (id)newWithCapacity:(NSUInteger)capacity
{
    return [self arrayWithCapacity:capacity];
}

@end
