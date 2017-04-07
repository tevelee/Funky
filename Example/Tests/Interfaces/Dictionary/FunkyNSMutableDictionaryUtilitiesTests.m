//
//  FunkyNSMutableDictionaryUtilitiesTests.m
//  Funky
//
//  Created by László Teveli on 2017. 04. 07..
//  Copyright © 2017. tevelee. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Funky/FunkyDictionaryUtilities.h>
#import <Funky/NSDictionary+FunkyUtilities.h>
#import <Funky/NSDictionary+FunkyCore.h>
#import <OCMock/OCMock.h>
#import "MockedMutableDictionaryUtilities.h"

@interface FunkyNSMutableDictionaryUtilitiesTests : XCTestCase

@end

@implementation FunkyNSMutableDictionaryUtilitiesTests
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
    [dictionary merge:@{@1: @"1"}];
    OCMVerify([mockedMutableDictionaryUtils merge:[OCMArg any]]);
}

@end
