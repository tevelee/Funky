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

#pragma mark - Utilities

- (NSArray*)map:(id(^)(id))block
{
    CollectionUtilities* utils = [CollectionUtilities utilitiesWithCollection:self];
    return [utils map:block];
}

@end
