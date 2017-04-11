//
//  FunkyNSDictionaryUtilitiesTests.m
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
#import "MockedDictionaryUtilities.h"

@interface FunkyNSDictionaryUtilitiesTests : XCTestCase

@end

@implementation FunkyNSDictionaryUtilitiesTests
{
    NSDictionary* dictionary;
}

- (void)setUp {
    [super setUp];
    dictionary = @{@0: @"0", @1: @"1", @2: @"2", @3: @"3"};
    mockedDictionaryUtils = OCMPartialMock([FunkyDictionaryUtilities utilitiesWithObject:dictionary]);
}

- (void)tearDown {
    mockedDictionaryUtils = nil;
    [super tearDown];
}

- (void)test_all_callsUtilitiesClass
{
    [dictionary all:^BOOL(id key, id item) {
        return item != nil;
    }];
    OCMVerify([mockedDictionaryUtils all:[OCMArg any]]);
}

- (void)test_none_callsUtilitiesClass
{
    [dictionary none:^BOOL(id key, id item) {
        return item != nil;
    }];
    OCMVerify([mockedDictionaryUtils none:[OCMArg any]]);
}

- (void)test_contains_callsUtilitiesClass
{
    [dictionary contains:^BOOL(id key, id item) {
        return item != nil;
    }];
    OCMVerify([mockedDictionaryUtils contains:[OCMArg any]]);
}

- (void)test_count_callsUtilitiesClass
{
    [dictionary count:^BOOL(id key, id item) {
        return item != nil;
    }];
    OCMVerify([mockedDictionaryUtils count:[OCMArg any]]);
}

- (void)test_map_callsUtilitiesClass
{
    [dictionary map:^FunkyPair*(id key, id item) {
        return [FunkyPair pairWithKey:key value:item];
    }];
    OCMVerify([mockedDictionaryUtils map:[OCMArg any]]);
}

- (void)test_filter_callsUtilitiesClass
{
    [dictionary filter:^BOOL(id key, id item) {
        return item != nil;
    }];
    OCMVerify([mockedDictionaryUtils filter:[OCMArg any]]);
}

- (void)test_reduce_callsUtilitiesClass
{
    [dictionary reduce:^id(id previousValue, id key, id item) {
        return 0;
    } withInitialValue:@0];
    OCMVerify([mockedDictionaryUtils reduce:[OCMArg any] withInitialValue:[OCMArg any]]);
}

- (void)test_merged_callsUtilitiesClass
{
    [dictionary merged:@{@5: @"5", @6: @"6"}];
    OCMVerify([mockedDictionaryUtils merged:[OCMArg any]]);
}

- (void)test_forEach_callsUtilitiesClass
{
    [dictionary forEach:^(id key, id item) {
    }];
    OCMVerify([mockedDictionaryUtils forEach:[OCMArg any]]);
}

@end