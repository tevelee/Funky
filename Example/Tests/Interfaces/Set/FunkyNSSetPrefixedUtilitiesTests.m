//
//  FunkyNSSetPrefixedUtilitiesTests.m
//  Funky
//
//  Created by László Teveli on 2017. 04. 07..
//  Copyright © 2017. tevelee. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Funky/FunkySetUtilities.h>
#import <Funky/NSSet+FunkyPrefixedUtilities.h>
#import <Funky/NSSet+FunkyCore.h>
#import <OCMock/OCMock.h>
#import "MockedSetUtilities.h"

@interface FunkyNSSetPrefixedUtilitiesTests : XCTestCase

@end

@implementation FunkyNSSetPrefixedUtilitiesTests
{
    NSSet* set;
}

- (void)setUp {
    [super setUp];
    set = [NSSet setWithArray:@[@0, @1, @2, @3]];
    mockedSetUtils = OCMPartialMock([FunkySetUtilities utilitiesWithObject:(id<FunkyCollection>)set]);
}

- (void)tearDown {
    mockedSetUtils = nil;
    mockedSetUtilsWithClass = nil;
    [super tearDown];
}

- (void)test_all_callsUtilitiesClass
{
    [set funky_all:^BOOL(id item) {
        return item != nil;
    }];
    OCMVerify([mockedSetUtils all:[OCMArg any]]);
}

- (void)test_none_callsUtilitiesClass
{
    [set funky_none:^BOOL(id item) {
        return item != nil;
    }];
    OCMVerify([mockedSetUtils none:[OCMArg any]]);
}

- (void)test_contains_callsUtilitiesClass
{
    [set funky_contains:^BOOL(id item) {
        return item != nil;
    }];
    OCMVerify([mockedSetUtils contains:[OCMArg any]]);
}

- (void)test_count_callsUtilitiesClass
{
    [set funky_count:^BOOL(id item) {
        return item != nil;
    }];
    OCMVerify([mockedSetUtils count:[OCMArg any]]);
}

- (void)test_map_callsUtilitiesClass
{
    [set funky_map:^id(id item) {
        return item;
    }];
    OCMVerify([mockedSetUtils map:[OCMArg any]]);
}

- (void)test_flatMap_callsUtilitiesClass
{
    [set funky_flatMap:^id(id item) {
        return item;
    }];
    OCMVerify([mockedSetUtils flatMap:[OCMArg any]]);
}

- (void)test_filter_callsUtilitiesClass
{
    [set funky_filter:^BOOL(id item) {
        return item != nil;
    }];
    OCMVerify([mockedSetUtils filter:[OCMArg any]]);
}

- (void)test_reduce_callsUtilitiesClass
{
    [set funky_reduce:^id(id value, id item) {
        return 0;
    } withInitialValue:@0];
    OCMVerify([mockedSetUtils reduce:[OCMArg any] withInitialValue:[OCMArg any]]);
}

- (void)test_flattened_callsUtilitiesClass
{
    [set funky_flattened];
    OCMVerify([mockedSetUtils flattened]);
}

- (void)test_union_callsUtilitiesClass
{
    [set funky_takingUnion:[NSSet setWithArray:@[@5, @6]]];
    OCMVerify([mockedSetUtils takingUnion:[OCMArg any]]);
}

- (void)test_minus_callsUtilitiesClass
{
    [set funky_takingMinus:[NSSet setWithArray:@[@5, @6]]];
    OCMVerify([mockedSetUtils takingMinus:[OCMArg any]]);
}

- (void)test_intersect_callsUtilitiesClass
{
    [set funky_takingIntersection:[NSSet setWithArray:@[@5, @6]]];
    OCMVerify([mockedSetUtils takingIntersection:[OCMArg any]]);
}

- (void)test_forEach_callsUtilitiesClass
{
    [set funky_forEach:^(id item) {
    }];
    OCMVerify([mockedSetUtils forEach:[OCMArg any]]);
}

- (void)test_associateBy_callsUtilitiesClass
{
    [set funky_associateBy:^id(id item) {
        return item;
    }];
    OCMVerify([mockedSetUtils associateBy:[OCMArg any]]);
}

- (void)test_sum_callsUtilitiesClass
{
    [set funky_sum:^double(id item) {
        return 0;
    }];
    OCMVerify([mockedSetUtils sum:[OCMArg any]]);
}

- (void)test_average_callsUtilitiesClass
{
    [set funky_average:^double(id item) {
        return 0;
    }];
    OCMVerify([mockedSetUtils average:[OCMArg any]]);
}

- (void)test_minValue_callsUtilitiesClass
{
    [set funky_minValue:^double(id item) {
        return 0;
    }];
    OCMVerify([mockedSetUtils minValue:[OCMArg any]]);
}

- (void)test_maxValue_callsUtilitiesClass
{
    [set funky_maxValue:^double(id item) {
        return 0;
    }];
    OCMVerify([mockedSetUtils maxValue:[OCMArg any]]);
}

- (void)test_minItems_callsUtilitiesClass
{
    [set funky_maxItems:^double(id item) {
        return 0;
    }];
    OCMVerify([mockedSetUtils maxItems:[OCMArg any]]);
}

- (void)test_maxItems_callsUtilitiesClass
{
    [set funky_minItems:^double(id item) {
        return 0;
    }];
    OCMVerify([mockedSetUtils minItems:[OCMArg any]]);
}

- (void)test_groupBy_callsUtilitiesClass
{
    [set funky_groupBy:^id(id item) {
        return item;
    }];
    OCMVerify([mockedSetUtils groupBy:[OCMArg any]]);
}

@end
