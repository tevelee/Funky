//
//  MockedArrayUtilities.m
//  Funky
//
//  Created by László Teveli on 2017. 04. 07..
//  Copyright © 2017. tevelee. All rights reserved.
//

#import "MockedArrayUtilities.h"

id mockedMutableArrayUtilsWithClass = nil;
FunkyMutableArrayUtilities* mockedMutableArrayUtils = nil;

@implementation NSMutableArray (Mocked)

- (FunkyMutableArrayUtilities *)utilities
{
    return mockedMutableArrayUtilsWithClass ?: mockedMutableArrayUtils ?: [FunkyMutableArrayUtilities utilitiesWithObject:(id<FunkyCollection>)self];
}

@end
