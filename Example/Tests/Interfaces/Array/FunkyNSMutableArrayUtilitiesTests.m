//
//  FunkyNSArray+UtilitiesTests.m
//  Funky
//
//  Created by László Teveli on 2017. 03. 26..
//  Copyright © 2017. tevelee. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Funky/FunkyArrayUtilities.h>
#import <Funky/NSArray+FunkyUtilities.h>
#import <Funky/NSArray+FunkyCore.h>
#import <OCMock/OCMock.h>
#import "MockedMutableArrayUtilities.h"

@interface FunkyNSMutableArrayUtilitiesTests : XCTestCase

@end

@implementation FunkyNSMutableArrayUtilitiesTests
{
    NSMutableArray* array;
}

- (void)setUp {
    [super setUp];
    array = [@[@0, @1, @2, @3] mutableCopy];
    mockedMutableArrayUtils = OCMPartialMock([FunkyMutableArrayUtilities utilitiesWithObject:(id<FunkyCollection>)array]);
}

- (void)tearDown {
    mockedMutableArrayUtils = nil;
    mockedMutableArrayUtilsWithClass = nil;
    [super tearDown];
}

- (void)test_removeDuplicates_callsUtilitiesClass
{
    [array removeDuplicates];
    OCMVerify([mockedMutableArrayUtils removeDuplicates]);
}

- (void)test_reverse_callsUtilitiesClass
{
    [array reverse];
    OCMVerify([mockedMutableArrayUtils reverse]);
}

- (void)test_shuffle_callsUtilitiesClass
{
    [array shuffle];
    OCMVerify([mockedMutableArrayUtils shuffle]);
}

- (void)test_flatten_callsUtilitiesClass
{
    [array flatten];
    OCMVerify([mockedMutableArrayUtils flatten]);
}

- (void)test_sort_callsUtilitiesClass
{
    [array sort:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [obj1 compare:obj1];
    }];
    OCMVerify([mockedMutableArrayUtils sort:[OCMArg any]]);
}

- (void)test_filter_callsUtilitiesClass
{
    [array filter:^BOOL(id item) {
        return YES;
    }];
    OCMVerify([mockedMutableArrayUtils filter:[OCMArg any]]);
}

- (void)test_merge_callsUtilitiesClass
{
    [array merge:@[@1]];
    OCMVerify([mockedMutableArrayUtils merge:[OCMArg any]]);
}

- (void)test_arrayWithItem_callsUtilitiesClass
{
    mockedMutableArrayUtilsWithClass = OCMClassMock([FunkyMutableArrayUtilities class]);
    [NSMutableArray arrayWithItem:@0 repeated:3];
    OCMVerify([mockedMutableArrayUtilsWithClass arrayWithItem:[OCMArg any] repeated:3]);
}

- (void)test_arrayWithArrayRepeated_callsUtilitiesClass
{
    mockedMutableArrayUtilsWithClass = OCMClassMock([FunkyMutableArrayUtilities class]);
    [NSMutableArray arrayWithArray:@[] nextItem:^id(NSArray *array) {
        return @1;
    } repeated:3];
    OCMVerify([mockedMutableArrayUtilsWithClass arrayWithArray:[OCMArg any] nextItem:[OCMArg any] repeated:3]);
}

- (void)test_arrayWithArrayUntil_callsUtilitiesClass
{
    mockedMutableArrayUtilsWithClass = OCMClassMock([FunkyMutableArrayUtilities class]);
    [NSMutableArray arrayWithArray:@[] nextItem:^id(NSArray *array) {
        return @1;
    } until:^BOOL(NSArray *array) {
        return NO;
    }];
    OCMVerify([mockedMutableArrayUtilsWithClass arrayWithArray:[OCMArg any] nextItem:[OCMArg any] until:[OCMArg any]]);
}

@end
