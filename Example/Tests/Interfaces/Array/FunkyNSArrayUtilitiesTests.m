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
#import "MockedArrayUtilties.h"

@interface FunkyNSArrayUtilitiesTests : XCTestCase

@end

@implementation FunkyNSArrayUtilitiesTests
{
    NSArray* array;
}

- (void)setUp {
    [super setUp];
    array = @[@0, @1, @2, @3];
    mockedArrayUtils = OCMPartialMock([FunkyArrayUtilities utilitiesWithObject:(id<FunkyCollection>)array]);
}

- (void)tearDown {
    mockedArrayUtils = nil;
    mockedArrayUtilsWithClass = nil;
    [super tearDown];
}

- (void)test_all_callsUtilitiesClass
{
    [array all:^BOOL(id item) {
        return item != nil;
    }];
    OCMVerify([mockedArrayUtils all:[OCMArg any]]);
}

- (void)test_none_callsUtilitiesClass
{
    [array none:^BOOL(id item) {
        return item != nil;
    }];
    OCMVerify([mockedArrayUtils none:[OCMArg any]]);
}

- (void)test_contains_callsUtilitiesClass
{
    [array contains:^BOOL(id item) {
        return item != nil;
    }];
    OCMVerify([mockedArrayUtils contains:[OCMArg any]]);
}

- (void)test_count_callsUtilitiesClass
{
    [array count:^BOOL(id item) {
        return item != nil;
    }];
    OCMVerify([mockedArrayUtils count:[OCMArg any]]);
}

- (void)test_map_callsUtilitiesClass
{
    [array map:^id(id item) {
        return item;
    }];
    OCMVerify([mockedArrayUtils map:[OCMArg any]]);
}

- (void)test_mapWithIndex_callsUtilitiesClass
{
    [array mapWithIndex:^id(NSUInteger index, id item) {
        return item;
    }];
    OCMVerify([mockedArrayUtils mapWithIndex:[OCMArg any]]);
}

- (void)test_flatMap_callsUtilitiesClass
{
    [array flatMap:^id(id item) {
        return item;
    }];
    OCMVerify([mockedArrayUtils flatMap:[OCMArg any]]);
}

- (void)test_flatMapWithIndex_callsUtilitiesClass
{
    [array flatMapWithIndex:^id(NSUInteger index, id item) {
        return item;
    }];
    OCMVerify([mockedArrayUtils flatMapWithIndex:[OCMArg any]]);
}

- (void)test_filter_callsUtilitiesClass
{
    [array filter:^BOOL(id item) {
        return item != nil;
    }];
    OCMVerify([mockedArrayUtils filter:[OCMArg any]]);
}

- (void)test_reduce_callsUtilitiesClass
{
    [array reduce:^id(id value, id item) {
        return 0;
    } withInitialValue:@0];
    OCMVerify([mockedArrayUtils reduce:[OCMArg any] withInitialValue:[OCMArg any]]);
}

- (void)test_flattened_callsUtilitiesClass
{
    [array flattened];
    OCMVerify([mockedArrayUtils flattened]);
}

- (void)test_merged_callsUtilitiesClass
{
    [array merged:@[@5, @6]];
    OCMVerify([mockedArrayUtils merged:[OCMArg any]]);
}

- (void)test_forEach_callsUtilitiesClass
{
    [array forEach:^(id item) {
    }];
    OCMVerify([mockedArrayUtils forEach:[OCMArg any]]);
}

- (void)test_forEachWithIndex_callsUtilitiesClass
{
    [array forEachWithIndex:^(NSUInteger index, id item) {
    }];
    OCMVerify([mockedArrayUtils forEachWithIndex:[OCMArg any]]);
}

- (void)test_groupByUsingFirst_callsUtilitiesClass
{
    [array groupByUsingFirst:^id(id item) {
        return item;
    }];
    OCMVerify([mockedArrayUtils groupByUsingFirst:[OCMArg any]]);
}

- (void)test_groupByUsingLast_callsUtilitiesClass
{
    [array groupByUsingLast:^id(id item) {
        return item;
    }];
    OCMVerify([mockedArrayUtils groupByUsingLast:[OCMArg any]]);
}

- (void)test_associateBy_callsUtilitiesClass
{
    [array associateBy:^id(id item) {
        return item;
    }];
    OCMVerify([mockedArrayUtils associateBy:[OCMArg any]]);
}

- (void)test_sum_callsUtilitiesClass
{
    [array sum:^double(id item) {
        return 0;
    }];
    OCMVerify([mockedArrayUtils sum:[OCMArg any]]);
}

- (void)test_average_callsUtilitiesClass
{
    [array average:^double(id item) {
        return 0;
    }];
    OCMVerify([mockedArrayUtils average:[OCMArg any]]);
}

- (void)test_minValue_callsUtilitiesClass
{
    [array minValue:^double(id item) {
        return 0;
    }];
    OCMVerify([mockedArrayUtils minValue:[OCMArg any]]);
}

- (void)test_maxValue_callsUtilitiesClass
{
    [array maxValue:^double(id item) {
        return 0;
    }];
    OCMVerify([mockedArrayUtils maxValue:[OCMArg any]]);
}

- (void)test_minItems_callsUtilitiesClass
{
    [array maxItems:^double(id item) {
        return 0;
    }];
    OCMVerify([mockedArrayUtils maxItems:[OCMArg any]]);
}

- (void)test_maxItems_callsUtilitiesClass
{
    [array minItems:^double(id item) {
        return 0;
    }];
    OCMVerify([mockedArrayUtils minItems:[OCMArg any]]);
}

- (void)test_firstIndex_callsUtilitiesClass
{
    [array firstIndex];
    OCMVerify([mockedArrayUtils firstIndex]);
}

- (void)test_lastIndex_callsUtilitiesClass
{
    [array lastIndex];
    OCMVerify([mockedArrayUtils lastIndex]);
}

- (void)test_first_callsUtilitiesClass
{
    [array first:^BOOL(id item) {
        return item != nil;
    }];
    OCMVerify([mockedArrayUtils first:[OCMArg any]]);
}

- (void)test_firstIndexWithBlock_callsUtilitiesClass
{
    [array firstIndex:^BOOL(id item) {
        return item != nil;
    }];
    OCMVerify([mockedArrayUtils firstIndex:[OCMArg any]]);
}

- (void)test_last_callsUtilitiesClass
{
    [array last:^BOOL(id item) {
        return item != nil;
    }];
    OCMVerify([mockedArrayUtils last:[OCMArg any]]);
}

- (void)test_lastIndexWithBlock_callsUtilitiesClass
{
    [array lastIndex:^BOOL(id item) {
        return item != nil;
    }];
    OCMVerify([mockedArrayUtils lastIndex:[OCMArg any]]);
}

- (void)test_take_callsUtilitiesClass
{
    [array take:^BOOL(id item) {
        return item != nil;
    }];
    OCMVerify([mockedArrayUtils take:[OCMArg any]]);
}

- (void)test_takeLast_callsUtilitiesClass
{
    [array takeLast:^BOOL(id item) {
        return item != nil;
    }];
    OCMVerify([mockedArrayUtils takeLast:[OCMArg any]]);
}

- (void)test_fromValueExclusive_callsUtilitiesClass
{
    [array fromValueExclusive:@2];
    OCMVerify([mockedArrayUtils fromValueExclusive:[OCMArg any]]);
}

- (void)test_fromValueInclusive_callsUtilitiesClass
{
    [array fromValueInclusive:@2];
    OCMVerify([mockedArrayUtils fromValueInclusive:[OCMArg any]]);
}

- (void)test_fromIndexExclusive_callsUtilitiesClass
{
    [array fromIndexExclusive:1];
    OCMVerify([mockedArrayUtils fromIndexExclusive:1]);
}

- (void)test_fromIndexInclusive_callsUtilitiesClass
{
    [array fromIndexInclusive:1];
    OCMVerify([mockedArrayUtils fromIndexInclusive:1]);
}

- (void)test_untilValueExclusive_callsUtilitiesClass
{
    [array untilValueExclusive:@2];
    OCMVerify([mockedArrayUtils untilValueExclusive:[OCMArg any]]);
}

- (void)test_untilValueInclusive_callsUtilitiesClass
{
    [array untilValueInclusive:@2];
    OCMVerify([mockedArrayUtils untilValueInclusive:[OCMArg any]]);
}

- (void)test_untilIndexExclusive_callsUtilitiesClass
{
    [array untilIndexExclusive:1];
    OCMVerify([mockedArrayUtils untilIndexExclusive:1]);
}

- (void)test_untilIndexInclusive_callsUtilitiesClass
{
    [array untilIndexInclusive:1];
    OCMVerify([mockedArrayUtils untilIndexInclusive:1]);
}

- (void)test_fromValueExclusive_untilValueExclusive_callsUtilitiesClass
{
    [array fromValueExclusive:@2 untilValueExclusive:@3];
    OCMVerify([mockedArrayUtils fromValueExclusive:[OCMArg any] untilValueExclusive:[OCMArg any]]);
}

- (void)test_fromValueExclusive_untilValueInclusive_callsUtilitiesClass
{
    [array fromValueExclusive:@2 untilValueInclusive:@3];
    OCMVerify([mockedArrayUtils fromValueExclusive:[OCMArg any] untilValueInclusive:[OCMArg any]]);
}

- (void)test_fromValueInclusive_untilValueExclusive_callsUtilitiesClass
{
    [array fromValueInclusive:@2 untilValueExclusive:@3];
    OCMVerify([mockedArrayUtils fromValueInclusive:[OCMArg any] untilValueExclusive:[OCMArg any]]);
}

- (void)test_fromValueInclusive_untilValueInclusive_callsUtilitiesClass
{
    [array fromValueInclusive:@2 untilValueInclusive:@3];
    OCMVerify([mockedArrayUtils fromValueInclusive:[OCMArg any] untilValueInclusive:[OCMArg any]]);
}

- (void)test_fromIndexExclusive_untilIndexExclusive_callsUtilitiesClass
{
    [array fromIndexExclusive:1 untilIndexExclusive:2];
    OCMVerify([mockedArrayUtils fromIndexExclusive:1 untilIndexExclusive:2]);
}

- (void)test_fromIndexExclusive_untilIndexInclusive_callsUtilitiesClass
{
    [array fromIndexExclusive:1 untilIndexInclusive:2];
    OCMVerify([mockedArrayUtils fromIndexExclusive:1 untilIndexInclusive:2]);
}

- (void)test_fromIndexInclusive_untilIndexExclusive_callsUtilitiesClass
{
    [array fromIndexInclusive:1 untilIndexExclusive:2];
    OCMVerify([mockedArrayUtils fromIndexInclusive:1 untilIndexExclusive:2]);
}

- (void)test_fromIndexInclusive_untilIndexInclusive_callsUtilitiesClass
{
    [array fromIndexInclusive:1 untilIndexInclusive:2];
    OCMVerify([mockedArrayUtils fromIndexInclusive:1 untilIndexInclusive:2]);
}

- (void)test_unique_callsUtilitiesClass
{
    [array unique];
    OCMVerify([mockedArrayUtils unique]);
}

- (void)test_reversed_callsUtilitiesClass
{
    [array reversed];
    OCMVerify([mockedArrayUtils reversed]);
}

- (void)test_shuffled_callsUtilitiesClass
{
    [array shuffled];
    OCMVerify([mockedArrayUtils shuffled]);
}

- (void)test_arrayWithItem_callsUtilitiesClass
{
    mockedArrayUtilsWithClass = OCMClassMock([FunkyArrayUtilities class]);
    [NSArray arrayWithItem:@0 repeated:3];
    OCMVerify([mockedArrayUtilsWithClass arrayWithItem:[OCMArg any] repeated:3]);
}

- (void)test_arrayWithArrayRepeated_callsUtilitiesClass
{
    mockedArrayUtilsWithClass = OCMClassMock([FunkyArrayUtilities class]);
    [NSArray arrayWithArray:@[] nextItem:^id(NSArray *array) {
        return @1;
    } repeated:3];
    OCMVerify([mockedArrayUtilsWithClass arrayWithArray:[OCMArg any] nextItem:[OCMArg any] repeated:3]);
}

- (void)test_arrayWithArrayUntil_callsUtilitiesClass
{
    mockedArrayUtilsWithClass = OCMClassMock([FunkyArrayUtilities class]);
    [NSArray arrayWithArray:@[] nextItem:^id(NSArray *array) {
        return @1;
    } until:^BOOL(NSArray *array) {
        return NO;
    }];
    OCMVerify([mockedArrayUtilsWithClass arrayWithArray:[OCMArg any] nextItem:[OCMArg any] until:[OCMArg any]]);
}

@end
