//
//  MockedMutableDictionaryUtilites.m
//  Funky
//
//  Created by László Teveli on 2017. 04. 07..
//  Copyright © 2017. tevelee. All rights reserved.
//

#import "MockedMutableDictionaryUtilities.h"

id mockedMutableDictionaryUtilsWithClass = nil;
FunkyMutableDictionaryUtilities* mockedMutableDictionaryUtils = nil;

@implementation NSMutableDictionary (Mocked)

- (FunkyMutableDictionaryUtilities *)utilities
{
    return mockedMutableDictionaryUtilsWithClass ?: mockedMutableDictionaryUtils ?: [FunkyMutableDictionaryUtilities utilitiesWithObject:self];
}

@end
