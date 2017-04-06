//
//  FunkyNSObjectPrefixedUtilitiesTests.m
//  Funky
//
//  Created by László Teveli on 2017. 04. 07..
//  Copyright © 2017. tevelee. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Funky/NSObject+FunkyPrefixedUtilities.h>
#import <OCMock/OCMock.h>
#import "MockedObjectUtilities.h"

@interface FunkyNSObjectPrefixedUtilitiesTests : XCTestCase

@end

@implementation FunkyNSObjectPrefixedUtilitiesTests
{
    NSObject* object;
}

- (void)setUp {
    [super setUp];
    object = @13;
    mockedObjectUtils = OCMPartialMock([FunkyGeneralUtilities utilitiesWithObject:object]);
}

- (void)tearDown {
    mockedObjectUtils = nil;
    [super tearDown];
}

- (void)test_apply_callsUtilitiesClass
{
    [object funky_apply:^(NSNumber* current) {
        NSLog(@"%@", current);
    }];
    OCMVerify([mockedObjectUtils apply:[OCMArg any]]);
}

@end
