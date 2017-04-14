//
//  FunkyArrayUtilitiesTests.m
//  Funky
//
//  Created by László Teveli on 2017. 03. 21..
//  Copyright © 2017. tevelee. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Funky/NSArray+FunkyUtilities.h>

@interface FunkyCollectionUtilitiesOnArrayTests : XCTestCase

@property (nonatomic, strong) NSArray* items;

@end

@implementation FunkyCollectionUtilitiesOnArrayTests

- (void)setUp {
    [super setUp];
    self.items = @[@10, @2, @8, @3, @5.5, @43, @113, @(5/3), @(-1)];
}

- (void)tearDown {
    [super tearDown];
}

- (void)test_map_transformsAllItems_toStatic {
    NSArray* result = [self.items map:^id(id item) {
        return @"transformed";
    }];
    XCTAssertTrue([result all:^BOOL(id item) {
        return [item isEqualToString:@"transformed"];
    }]);
}

- (void)test_map_transformsAllItems_toDynamic {
    NSArray* result = [self.items map:^id(id item) {
        return [NSString stringWithFormat:@"test %0.2f", [item doubleValue]];
    }];
    XCTAssertTrue([result all:^BOOL(id item) {
        return [item hasPrefix:@"test "];
    }]);
    XCTAssertEqualObjects(result[0], @"test 10.00");
    XCTAssertEqualObjects(result[4], @"test 5.50");
    XCTAssertEqualObjects(result[8], @"test -1.00");
}

- (void)test_all {
    XCTAssertTrue([self.items all:^BOOL(id item) {
        return [item isKindOfClass:[NSNumber class]];
    }]);
    XCTAssertFalse([self.items all:^BOOL(id item) {
        return [item doubleValue] > 0;
    }]);
}

- (void)test_none {
    XCTAssertTrue([self.items none:^BOOL(id item) {
        return [item doubleValue] > 150;
    }]);
    XCTAssertFalse([self.items none:^BOOL(id item) {
        return [item doubleValue] < 0;
    }]);
}

- (void)test_contains {
    XCTAssertTrue([self.items contains:^BOOL(id item) {
        return [item doubleValue] < 0;
    }]);
    XCTAssertFalse([self.items contains:^BOOL(id item) {
        return [item isKindOfClass:[NSString class]];
    }]);
}

- (void)test_count {
    XCTAssertEqual([self.items count:^BOOL(id item) {
        return [item doubleValue] > 0;
    }], self.items.count - 1);
    XCTAssertEqual([self.items count:^BOOL(id item) {
        return [item doubleValue] > 1000;
    }], 0);
    XCTAssertEqual([self.items count:^BOOL(id item) {
        return [item isKindOfClass:[NSNumber class]];
    }], self.items.count);
}

- (void)test_filtered {
    NSArray* result = [self.items filtered:^BOOL(id item) {
        return [item doubleValue] > 0;
    }];
    XCTAssertTrue([result all:^BOOL(id item) {
        return [item doubleValue] > 0;
    }]);
    XCTAssertFalse([result containsObject:@(-1)]);
    XCTAssertEqual(result.count, self.items.count - 1);
}

- (void)test_flatMap {
    NSArray* result = [self.items flatMap:^id(id item) {
        return @[@0, item];
    }];
    XCTAssertTrue([result all:^BOOL(id item) {
        return [item isKindOfClass:[NSNumber class]];
    }]);
    XCTAssertEqual([result count:^BOOL(id item) {
        return [item isEqual:@0];
    }], self.items.count);
    XCTAssertEqual(result.count, self.items.count * 2);
    
    NSArray* flatMapForSingleValue = [self.items flatMap:^id(id item) {
        return @([item doubleValue] * [item doubleValue]);
    }];
    NSArray* mapForSingleValue = [self.items flatMap:^id(id item) {
        return @([item doubleValue] * [item doubleValue]);
    }];
    XCTAssertEqualObjects(mapForSingleValue, flatMapForSingleValue);
}

- (void)test_reduce_toString {
    NSArray* result = [self.items reduce:^id(id value, id item) {
        return [value stringByAppendingFormat:@", %0.1f", [item doubleValue]];
    } withInitialValue:@""];
    XCTAssertEqualObjects(@", 10.0, 2.0, 8.0, 3.0, 5.5, 43.0, 113.0, 1.0, -1.0", result);
}

- (void)test_reduce_withNilStart {
    NSArray* result = [self.items reduce:^id(id value, id item) {
        return @"A";
    } withInitialValue:nil];
    XCTAssertEqualObjects(@"A", result);
}

- (void)test_flattened
{
    NSArray* result = [@[@[@[@0, @1], @2, @3], @4, @[@5], @[@[@[@[@6]]], @7], @8, @{@0: @1}, [NSSet setWithObject:@0]] flattened];
    NSArray* expected = @[@0, @1, @2, @3, @4, @5, @6, @7, @8, @{@0: @1}, [NSSet setWithObject:@0]];
    XCTAssertEqualObjects(expected, result);
}

- (void)test_merge
{
    NSArray* result = [@[@0, @1] merged:@[@2, @3]];
    NSArray* expected = @[@0, @1, @2, @3];
    XCTAssertEqualObjects(expected, result);
}

- (void)test_groupByUsingFirst
{
    NSDictionary* result = [self.items groupByUsingFirst:^id(id item) {
        return [item doubleValue] > 0 ? @"positive" : @"negative";
    }];
    NSDictionary* expected = @{@"positive": @10, @"negative": @(-1)};
    XCTAssertEqualObjects(expected, result);
}

- (void)test_groupByUsingLast
{
    NSDictionary* result = [self.items groupByUsingLast:^id(id item) {
        return [item doubleValue] > 0 ? @"positive" : @"negative";
    }];
    NSDictionary* expected = @{@"positive": @1, @"negative": @(-1)};
    XCTAssertEqualObjects(expected, result);
}

- (void)test_associateBy
{
    NSDictionary* result = [self.items associateBy:^id(id item) {
        return [item doubleValue] > 0 ? @"positive" : @"negative";
    }];
    NSDictionary* expected = @{@"positive": @[@10, @2, @8, @3, @5.5, @43, @113, @(5/3)], @"negative": @[@(-1)]};
    XCTAssertEqualObjects(expected, result);
}

- (void)test_minValue
{
    double result = [self.items minValue:^double(id item) {
        return [item doubleValue];
    }];
    XCTAssertEqual(result, -1);
}

- (void)test_maxValue
{
    double result = [self.items maxValue:^double(id item) {
        return [item doubleValue];
    }];
    XCTAssertEqual(result, 113);
}

- (void)test_sum
{
    double result = [@[@1, @2, @3, @4, @5, @6] sum:^double(id item) {
        return [item doubleValue];
    }];
    XCTAssertEqual(result, 21);
}

- (void)test_average
{
    double result = [@[@1, @2, @3, @4, @5, @6] average:^double(id item) {
        return [item doubleValue];
    }];
    XCTAssertEqual(result, 3.5);
}

- (void)test_minItems
{
    NSArray* result = [@[@3, @1, @2, @3, @1, @4, @5, @6] minItems:^double(id item) {
        return [item doubleValue];
    }];
    NSArray* expected = @[@1, @1];
    XCTAssertEqualObjects(expected, result);
}

- (void)test_maxItems
{
    NSArray* result = [@[@1, @2, @3, @6, @6, @5, @6] maxItems:^double(id item) {
        return [item doubleValue];
    }];
    NSArray* expected = @[@6, @6, @6];
    XCTAssertEqualObjects(expected, result);
}

- (void)test_forEach
{
    NSArray* array = @[@0, @1, @1, @0, @2, @3, @10, @5, @4, @6, @8, @7, @9, @8];
    NSMutableArray* visitedIndices = [NSMutableArray arrayWithCapacity:array.count];
    [array forEachWithIndex:^(NSUInteger index, id item) {
        [visitedIndices addObject:@(index)];
    }];
    id allIndices = @[@0, @1, @2, @3, @4, @5, @6, @7, @8, @9, @10, @11, @12, @13];
    XCTAssertEqualObjects(visitedIndices, allIndices);
}

@end
