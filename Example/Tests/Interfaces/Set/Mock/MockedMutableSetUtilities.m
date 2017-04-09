//
//  MockedMutableSetUtilities.m
//  Funky
//
//  Created by László Teveli on 2017. 04. 07..
//  Copyright © 2017. tevelee. All rights reserved.
//

#import "MockedMutableSetUtilities.h"
#import <Funky/NSSet+FunkyCore.h>

id mockedMutableSetUtilsWithClass = nil;
FunkyMutableSetUtilities* mockedMutableSetUtils = nil;

@implementation NSMutableSet (Mocked)

- (FunkyMutableSetUtilities *)utilities
{
    return mockedMutableSetUtilsWithClass ?: mockedMutableSetUtils ?: [FunkyMutableSetUtilities utilitiesWithObject:self];
}

@end
