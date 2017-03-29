//
//  NSDictionary+LTCore.m
//  Pods
//
//  Created by László Teveli on 2017. 03. 29..
//
//

#import "NSDictionary+LTCore.h"

@implementation NSDictionary (LTCore)

- (LTDictionaryUtilities*)utilities
{
    return [LTDictionaryUtilities utilitiesWithObject:self];
}

#pragma mark - LTCollectionCounterpart

+ (Class)classForImmutableCounterPart
{
    return [NSDictionary class];
}

+ (Class)classForMutableCounterPart
{
    return [NSMutableDictionary class];
}

+ (Class)classToFlatten
{
    return [NSDictionary class];
}

@end
