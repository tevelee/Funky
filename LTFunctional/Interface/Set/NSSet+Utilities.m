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

#pragma mark - Utilities

- (NSSet*)map:(id(^)(id))block
{
    CollectionUtilities* utils = [CollectionUtilities utilitiesWithCollection:self];
    return [utils map:block];
}

@end
