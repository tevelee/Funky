//
//  LTArrayUtilitiesTests.m
//  LTFunctional
//
//  Created by László Teveli on 2017. 03. 21..
//  Copyright © 2017. tevelee. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <LTFunctional/NSSet+LTUtilities.h>

@interface LTCollectionUtilitiesOnSetTests : XCTestCase

@property (nonatomic, strong) NSSet* items;

@end

@implementation LTCollectionUtilitiesOnSetTests

- (void)setUp {
    [super setUp];
    self.items = [NSSet setWithArray:@[@10, @2, @8, @3, @5.5, @43, @113, @(5/3), @(-1)]];
}

- (void)tearDown {
    [super tearDown];
}

- (void)test_map_transformsAllItems_toStatic {
    NSSet* result = [self.items map:^id(id item) {
        return @"transformed";
    }];
    XCTAssertTrue([result all:^BOOL(id item) {
        return [item isEqualToString:@"transformed"];
    }]);
}

- (void)test_map_transformsAllItems_toDynamic {
    NSSet* result = [self.items map:^id(id item) {
        return [NSString stringWithFormat:@"test %0.2f", [item doubleValue]];
    }];
    XCTAssertTrue([result all:^BOOL(id item) {
        return [item hasPrefix:@"test "];
    }]);
    XCTAssertTrue([result containsObject:@"test 10.00"]);
    XCTAssertTrue([result containsObject:@"test 5.50"]);
    XCTAssertTrue([result containsObject:@"test -1.00"]);
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

- (void)test_filter {
    NSSet* result = [self.items filter:^BOOL(id item) {
        return [item doubleValue] > 0;
    }];
    XCTAssertTrue([result all:^BOOL(id item) {
        return [item doubleValue] > 0;
    }]);
    XCTAssertFalse([result containsObject:@(-1)]);
    XCTAssertEqual(result.count, self.items.count - 1);
}

- (void)test_flatMap {
    NSSet* result = [self.items flatMap:^id(id item) {
        return [NSSet setWithArray:@[@0, item]];
    }];
    XCTAssertTrue([result all:^BOOL(id item) {
        return [item isKindOfClass:[NSNumber class]];
    }]);
    XCTAssertEqual([result count:^BOOL(id item) {
        return [item isEqual:@0];
    }], 1);
    XCTAssertEqual(result.count, self.items.count + 1);
    
    NSSet* flatMapForSingleValue = [self.items flatMap:^id(id item) {
        return @([item doubleValue] * [item doubleValue]);
    }];
    NSSet* mapForSingleValue = [self.items flatMap:^id(id item) {
        return @([item doubleValue] * [item doubleValue]);
    }];
    XCTAssertEqualObjects(mapForSingleValue, flatMapForSingleValue);
}

- (void)test_reduce_toString {
    double result = [[self.items reduce:^id(id value, id item) {
        return @([value doubleValue] + [item doubleValue]);
    } withInitialValue:@0] doubleValue];
    double expected = [self.items sum:^double(id item) {
        return [item doubleValue];
    }];
    XCTAssertEqual(expected, result);
}

- (void)test_reduce_withNilStart {
    NSSet* result = [self.items reduce:^id(id value, id item) {
        return @"A";
    } withInitialValue:nil];
    XCTAssertEqualObjects(@"A", result);
}

- (void)test_flattened
{
    NSSet* result = [[NSSet setWithObjects:[NSSet setWithObject:@0], @1, [NSSet setWithObjects:@2, [NSSet setWithObject:@3], @[@0, @1], @{@0: @1}, nil], nil] flattened];
    NSSet* expected = [NSSet setWithArray:@[@0, @1, @2, @3, @[@0, @1], @{@0: @1}]];
    XCTAssertEqualObjects(expected, result);
}

- (void)test_merge
{
    NSSet* result = [[NSSet setWithArray:@[@0, @1]] merge:[NSSet setWithArray:@[@2, @3]]];
    NSSet* expected = [NSSet setWithArray:@[@0, @1, @2, @3]];
    XCTAssertEqualObjects(expected, result);
}

- (void)test_groupBy
{
    NSDictionary* result = [self.items groupBy:^id(id item) {
        return [item doubleValue] > 0 ? @"positive" : @"negative";
    }];
    XCTAssertEqualObjects(result[@"negative"], @(-1));
    XCTAssertTrue([result[@"positive"] doubleValue] > 0);
}

- (void)test_associateBy
{
    NSDictionary* result = [self.items associateBy:^id(id item) {
        return [item doubleValue] > 0 ? @"positive" : @"negative";
    }];
    NSDictionary* expected = @{@"positive": [NSSet setWithArray:@[@10, @2, @8, @3, @5.5, @43, @113, @(5/3)]],
                               @"negative": [NSSet setWithObject:@(-1)]};
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
    double result = [[NSSet setWithArray:@[@1, @2, @3, @4, @5, @6]] sum:^double(id item) {
        return [item doubleValue];
    }];
    XCTAssertEqual(result, 21);
}

- (void)test_average
{
    double result = [[NSSet setWithArray:@[@1, @2, @3, @4, @5, @6]] average:^double(id item) {
        return [item doubleValue];
    }];
    XCTAssertEqual(result, 3.5);
}

- (void)test_minItems
{
    NSSet* result = [[NSSet setWithArray:@[@3, @1, @2, @3, @1, @4, @5, @6]] minItems:^double(id item) {
        return [item doubleValue];
    }];
    NSSet* expected = [NSSet setWithArray:@[@1, @1]];
    XCTAssertEqualObjects(expected, result);
}

- (void)test_maxItems
{
    NSSet* result = [[NSSet setWithArray:@[@1, @2, @3, @6, @6, @5, @6]] maxItems:^double(id item) {
        return [item doubleValue];
    }];
    NSSet* expected = [NSSet setWithArray:@[@6, @6, @6]];
    XCTAssertEqualObjects(expected, result);
}

- (void)test_forEach
{
    NSSet* set = [NSSet setWithArray:@[@0, @1, @2, @3, @10, @5, @4, @6, @8, @7, @9]];
    NSMutableSet* visitedObjects = [NSMutableSet setWithCapacity:set.count];
    [set forEach:^(id item) {
        [visitedObjects addObject:item];
    }];
    XCTAssertEqualObjects(visitedObjects, set);
}

@end
