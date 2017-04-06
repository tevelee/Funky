//
//  MockedObjectUtilities.m
//  Funky
//
//  Created by László Teveli on 2017. 04. 07..
//  Copyright © 2017. tevelee. All rights reserved.
//

#import "MockedObjectUtilities.h"

FunkyGeneralUtilities* mockedObjectUtils = nil;

@implementation NSObject (Mocked)

- (FunkyGeneralUtilities *)utilities
{
    return mockedObjectUtils ?: [FunkyGeneralUtilities utilitiesWithObject:self];
}

@end
