//
//  FunkyNSMutableDictionaryPrefixedUtilitiesTests.m
//  Funky
//
//  Created by László Teveli on 2017. 04. 07..
//  Copyright © 2017. tevelee. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Funky/FunkyDictionaryUtilities.h>
#import <Funky/NSDictionary+FunkyPrefixedUtilities.h>
#import <Funky/NSDictionary+FunkyCore.h>
#import <OCMock/OCMock.h>
#import "MockedMutableDictionaryUtilities.h"

@interface FunkyNSMutableDictionaryPrefixedUtilitiesTests : XCTestCase

@end

@implementation FunkyNSMutableDictionaryPrefixedUtilitiesTests
{
    NSMutableDictionary* dictionary;
}

- (void)setUp {
    [super setUp];
    dictionary = [@{@0: @"0", @1: @"1", @2: @"2", @3: @"3"} mutableCopy];
    mockedMutableDictionaryUtils = OCMPartialMock([FunkyMutableDictionaryUtilities utilitiesWithObject:dictionary]);
}

- (void)tearDown {
    mockedMutableDictionaryUtils = nil;
    [super tearDown];
}

- (void)test_merge_callsUtilitiesClass
{
    [dictionary funky_merge:@{@1: @"1"}];
    OCMVerify([mockedMutableDictionaryUtils merge:[OCMArg any]]);
}

- (void)test_filter_callsUtilitiesClass
{
    [dictionary funky_filter:^BOOL(id key, id value) {
        return YES;
    }];
    OCMVerify([mockedMutableDictionaryUtils filter:[OCMArg any]]);
}


@end
