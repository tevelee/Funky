//
//  MockedArrayUtilities.m
//  Funky
//
//  Created by László Teveli on 2017. 04. 07..
//  Copyright © 2017. tevelee. All rights reserved.
//

#import "MockedArrayUtilities.h"

id mockedArrayUtilsWithClass = nil;
FunkyArrayUtilities* mockedArrayUtils = nil;

@implementation NSArray (Mocked)

- (FunkyArrayUtilities *)utilities
{
    return mockedArrayUtilsWithClass ?: mockedArrayUtils ?: [FunkyArrayUtilities utilitiesWithObject:(id<FunkyCollection>)self];
}

@end
