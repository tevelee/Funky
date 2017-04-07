//
//  FunkyNSSetUtilitiesTests.m
//  Funky
//
//  Created by László Teveli on 2017. 04. 07..
//  Copyright © 2017. tevelee. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Funky/FunkySetUtilities.h>
#import <Funky/NSSet+FunkyUtilities.h>
#import <Funky/NSSet+FunkyCore.h>
#import <OCMock/OCMock.h>
#import "MockedSetUtilities.h"

@interface FunkyNSSetUtilitiesTests : XCTestCase

@end

@implementation FunkyNSSetUtilitiesTests
{
    NSSet* array;
}

- (void)setUp {
    [super setUp];
    array = [NSSet setWithArray:@[@0, @1, @2, @3]];
    mockedSetUtils = OCMPartialMock([FunkySetUtilities utilitiesWithObject:(id<FunkyCollection>)array]);
}

- (void)tearDown {
    mockedSetUtils = nil;
    mockedSetUtilsWithClass = nil;
    [super tearDown];
}

- (void)test_all_callsUtilitiesClass
{
    [array all:^BOOL(id item) {
        return item != nil;
    }];
    OCMVerify([mockedSetUtils all:[OCMArg any]]);
}

- (void)test_none_callsUtilitiesClass
{
    [array none:^BOOL(id item) {
        return item != nil;
    }];
    OCMVerify([mockedSetUtils none:[OCMArg any]]);
}

- (void)test_contains_callsUtilitiesClass
{
    [array contains:^BOOL(id item) {
        return item != nil;
    }];
    OCMVerify([mockedSetUtils contains:[OCMArg any]]);
}

- (void)test_count_callsUtilitiesClass
{
    [array count:^BOOL(id item) {
        return item != nil;
    }];
    OCMVerify([mockedSetUtils count:[OCMArg any]]);
}

- (void)test_map_callsUtilitiesClass
{
    [array map:^id(id item) {
        return item;
    }];
    OCMVerify([mockedSetUtils map:[OCMArg any]]);
}

- (void)test_flatMap_callsUtilitiesClass
{
    [array flatMap:^id(id item) {
        return item;
    }];
    OCMVerify([mockedSetUtils flatMap:[OCMArg any]]);
}

- (void)test_filter_callsUtilitiesClass
{
    [array filter:^BOOL(id item) {
        return item != nil;
    }];
    OCMVerify([mockedSetUtils filter:[OCMArg any]]);
}

- (void)test_reduce_callsUtilitiesClass
{
    [array reduce:^id(id value, id item) {
        return 0;
    } withInitialValue:@0];
    OCMVerify([mockedSetUtils reduce:[OCMArg any] withInitialValue:[OCMArg any]]);
}

- (void)test_flattened_callsUtilitiesClass
{
    [array flattened];
    OCMVerify([mockedSetUtils flattened]);
}

- (void)test_union_callsUtilitiesClass
{
    [array takingUnion:[NSSet setWithArray:@[@5, @6]]];
    OCMVerify([mockedSetUtils takingUnion:[OCMArg any]]);
}

- (void)test_minus_callsUtilitiesClass
{
    [array takingMinus:[NSSet setWithArray:@[@5, @6]]];
    OCMVerify([mockedSetUtils takingMinus:[OCMArg any]]);
}

- (void)test_intersect_callsUtilitiesClass
{
    [array takingIntersection:[NSSet setWithArray:@[@5, @6]]];
    OCMVerify([mockedSetUtils takingIntersection:[OCMArg any]]);
}

- (void)test_forEach_callsUtilitiesClass
{
    [array forEach:^(id item) {
    }];
    OCMVerify([mockedSetUtils forEach:[OCMArg any]]);
}

- (void)test_associateBy_callsUtilitiesClass
{
    [array associateBy:^id(id item) {
        return item;
    }];
    OCMVerify([mockedSetUtils associateBy:[OCMArg any]]);
}

- (void)test_sum_callsUtilitiesClass
{
    [array sum:^double(id item) {
        return 0;
    }];
    OCMVerify([mockedSetUtils sum:[OCMArg any]]);
}

- (void)test_average_callsUtilitiesClass
{
    [array average:^double(id item) {
        return 0;
    }];
    OCMVerify([mockedSetUtils average:[OCMArg any]]);
}

- (void)test_minValue_callsUtilitiesClass
{
    [array minValue:^double(id item) {
        return 0;
    }];
    OCMVerify([mockedSetUtils minValue:[OCMArg any]]);
}

- (void)test_maxValue_callsUtilitiesClass
{
    [array maxValue:^double(id item) {
        return 0;
    }];
    OCMVerify([mockedSetUtils maxValue:[OCMArg any]]);
}

- (void)test_minItems_callsUtilitiesClass
{
    [array maxItems:^double(id item) {
        return 0;
    }];
    OCMVerify([mockedSetUtils maxItems:[OCMArg any]]);
}

- (void)test_maxItems_callsUtilitiesClass
{
    [array minItems:^double(id item) {
        return 0;
    }];
    OCMVerify([mockedSetUtils minItems:[OCMArg any]]);
}

@end
