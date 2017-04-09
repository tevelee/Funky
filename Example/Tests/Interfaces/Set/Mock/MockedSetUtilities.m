//
//  MockedSetUtilities.m
//  Funky
//
//  Created by László Teveli on 2017. 04. 07..
//  Copyright © 2017. tevelee. All rights reserved.
//

#import "MockedSetUtilities.h"
#import <Funky/NSSet+FunkyCore.h>

id mockedSetUtilsWithClass = nil;
FunkySetUtilities* mockedSetUtils = nil;

@implementation NSSet (Mocked)

- (FunkySetUtilities *)utilities
{
    return mockedSetUtilsWithClass ?: mockedSetUtils ?: [FunkySetUtilities utilitiesWithObject:self];
}

@end
