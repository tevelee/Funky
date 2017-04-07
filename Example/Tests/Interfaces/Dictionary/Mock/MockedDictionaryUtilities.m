//
//  MockedDictionaryUtilities.m
//  Funky
//
//  Created by László Teveli on 2017. 04. 07..
//  Copyright © 2017. tevelee. All rights reserved.
//

#import "MockedDictionaryUtilities.h"

FunkyDictionaryUtilities* mockedDictionaryUtils = nil;

@implementation NSDictionary (Mocked)

- (FunkyDictionaryUtilities *)utilities
{
    return mockedDictionaryUtils ?: [FunkyDictionaryUtilities utilitiesWithObject:self];
}

@end
