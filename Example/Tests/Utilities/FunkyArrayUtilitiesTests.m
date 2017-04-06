//
//  FunkyArrayUtilitiesTests.m
//  Funky
//
//  Created by László Teveli on 2017. 03. 21..
//  Copyright © 2017. tevelee. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Funky/FunkyArrayUtilities.h>

@interface FunkyArrayUtilitiesTests : XCTestCase

@property (nonatomic, strong) FunkyArrayUtilities* utils;

@end

@implementation FunkyArrayUtilitiesTests

- (void)setUp {
    [super setUp];
    NSArray* items = @[@0, @1, @1, @0, @2, @3, @10, @5, @4, @6, @8, @7, @9, @8];
    self.utils = [FunkyArrayUtilities utilitiesWithObject:(id<FunkyCollection>)items];
}

- (void)tearDown {
    [super tearDown];
}

- (void)test_minIndex
{
    XCTAssertEqual([self.utils firstIndex], 0);
}

- (void)test_maxIndex
{
    XCTAssertEqual([self.utils lastIndex], self.utils.object.count - 1);
}

- (void)test_first
{
    id result = [self.utils first:^BOOL(id item) {
        return [item doubleValue] > 4.5;
    }];
    XCTAssertEqualObjects(result, @10);
    
    result = [self.utils first:^BOOL(id item) {
        return [item doubleValue] == 123;
    }];
    XCTAssertNil(result);
}

- (void)test_last
{
    id result = [self.utils last:^BOOL(id item) {
        return [item doubleValue] < 4.5;
    }];
    XCTAssertEqualObjects(result, @4);
}

- (void)test_firstIndex
{
    NSUInteger result = [self.utils firstIndex:^BOOL(id item) {
        return [item doubleValue] > 4.5;
    }];
    XCTAssertEqual(result, 6);
    
    result = [self.utils firstIndex:^BOOL(id item) {
        return [item doubleValue] == 123;
    }];
    XCTAssertEqual(result, NSNotFound);
}

- (void)test_lastIndex
{
    NSUInteger result = [self.utils lastIndex:^BOOL(id item) {
        return [item doubleValue] > 7;
    }];
    XCTAssertEqual(result, self.utils.object.count - 1);
}

- (void)test_take
{
    id result = [self.utils take:^BOOL(id item) {
        return [item doubleValue] < 4;
    }];
    id expected = @[@0, @1, @1, @0, @2, @3];
    XCTAssertEqualObjects(result, expected);
}

- (void)test_takeLast
{
    id result = [self.utils takeLast:^BOOL(id item) {
        return [item doubleValue] > 5;
    }];
    id expected = @[@6, @8, @7, @9, @8];
    XCTAssertEqualObjects(result, expected);
}

- (void)test_fromValue
{
    id result = [self.utils fromValueInclusive:@10];
    id expected = @[@10, @5, @4, @6, @8, @7, @9, @8];
    XCTAssertEqualObjects(result, expected);
    
    result = [self.utils fromValueExclusive:@10];
    expected = @[@5, @4, @6, @8, @7, @9, @8];
    XCTAssertEqualObjects(result, expected);
}

- (void)test_fromIndex
{
    id result = [self.utils fromIndexInclusive:10];
    id expected = @[@8, @7, @9, @8];
    XCTAssertEqualObjects(result, expected);
    
    result = [self.utils fromIndexInclusive:-3];
    expected = @[@7, @9, @8];
    XCTAssertEqualObjects(result, expected);
    
    result = [self.utils fromIndexExclusive:10];
    expected = @[@7, @9, @8];
    XCTAssertEqualObjects(result, expected);
    
    result = [self.utils fromIndexExclusive:-3];
    expected = @[@9, @8];
    XCTAssertEqualObjects(result, expected);
    
    result = [self.utils fromIndexInclusive:0];
    XCTAssertEqualObjects(result, self.utils.object);
}

- (void)test_untilValue
{
    id result = [self.utils untilValueInclusive:@10];
    id expected = @[@0, @1, @1, @0, @2, @3, @10];
    XCTAssertEqualObjects(result, expected);
    
    result = [self.utils untilValueExclusive:@10];
    expected = @[@0, @1, @1, @0, @2, @3];
    XCTAssertEqualObjects(result, expected);
}

- (void)test_untilIndex
{
    id result = [self.utils untilIndexInclusive:4];
    id expected = @[@0, @1, @1, @0, @2];
    XCTAssertEqualObjects(result, expected);
    
    result = [self.utils untilIndexInclusive:-12];
    expected = @[@0, @1, @1];
    XCTAssertEqualObjects(result, expected);
    
    result = [self.utils untilIndexExclusive:4];
    expected = @[@0, @1, @1, @0];
    XCTAssertEqualObjects(result, expected);
    
    result = [self.utils untilIndexExclusive:-12];
    expected = @[@0, @1];
    XCTAssertEqualObjects(result, expected);
    
    result = [self.utils untilIndexInclusive:13];
    XCTAssertEqualObjects(result, self.utils.object);
}

- (void)test_fromValueUntilValue
{
    id result = [self.utils fromValueInclusive:@10 untilValueInclusive:@8];
    id expected = @[@10, @5, @4, @6, @8];
    XCTAssertEqualObjects(result, expected);
    
    result = [self.utils fromValueInclusive:@10 untilValueExclusive:@8];
    expected = @[@10, @5, @4, @6];
    XCTAssertEqualObjects(result, expected);
    
    result = [self.utils fromValueExclusive:@10 untilValueInclusive:@8];
    expected = @[@5, @4, @6, @8];
    XCTAssertEqualObjects(result, expected);
    
    result = [self.utils fromValueExclusive:@10 untilValueExclusive:@8];
    expected = @[@5, @4, @6];
    XCTAssertEqualObjects(result, expected);
}

- (void)test_fromIndexUntilIndex
{
    id result = [self.utils fromIndexInclusive:10 untilIndexInclusive:12];
    id expected = @[@8, @7, @9];
    XCTAssertEqualObjects(result, expected);
    
    result = [self.utils fromIndexInclusive:-4 untilIndexInclusive:-2];
    expected = @[@8, @7, @9];
    XCTAssertEqualObjects(result, expected);
    
    result = [self.utils fromIndexInclusive:10 untilIndexExclusive:12];
    expected = @[@8, @7];
    XCTAssertEqualObjects(result, expected);
    
    result = [self.utils fromIndexInclusive:-4 untilIndexExclusive:-2];
    expected = @[@8, @7];
    XCTAssertEqualObjects(result, expected);
    
    result = [self.utils fromIndexExclusive:10 untilIndexInclusive:12];
    expected = @[@7, @9];
    XCTAssertEqualObjects(result, expected);
    
    result = [self.utils fromIndexExclusive:-4 untilIndexInclusive:-2];
    expected = @[@7, @9];
    XCTAssertEqualObjects(result, expected);
    
    result = [self.utils fromIndexExclusive:10 untilIndexExclusive:12];
    expected = @[@7];
    XCTAssertEqualObjects(result, expected);
    
    result = [self.utils fromIndexExclusive:-4 untilIndexExclusive:-2];
    expected = @[@7];
    XCTAssertEqualObjects(result, expected);
}

- (void)test_forEach
{
    __block NSInteger numberOfVisitedItems = 0;
    [self.utils forEach:^(id item) {
        numberOfVisitedItems++;
    }];
    XCTAssertEqual(numberOfVisitedItems, self.utils.object.count);
    
    NSMutableArray* visitedIndices = [NSMutableArray arrayWithCapacity:self.utils.object.count];
    [self.utils forEachWithIndex:^(NSUInteger index, id item) {
        [visitedIndices addObject:@(index)];
    }];
    id allIndices = @[@0, @1, @2, @3, @4, @5, @6, @7, @8, @9, @10, @11, @12, @13];
    XCTAssertEqualObjects(visitedIndices, allIndices);
}

- (void)test_mapWithIndex
{
    NSMutableArray* visitedIndices = [NSMutableArray arrayWithCapacity:self.utils.object.count];
    [self.utils mapWithIndex:^id(NSUInteger index, id item) {
        [visitedIndices addObject:@(index)];
        return item;
    }];
    id allIndices = @[@0, @1, @2, @3, @4, @5, @6, @7, @8, @9, @10, @11, @12, @13];
    XCTAssertEqualObjects(visitedIndices, allIndices);
}

- (void)test_flatMapWithIndex
{
    NSMutableArray* visitedIndices = [NSMutableArray arrayWithCapacity:self.utils.object.count];
    [self.utils flatMapWithIndex:^id(NSUInteger index, id item) {
        [visitedIndices addObject:@(index)];
        return item;
    }];
    id allIndices = @[@0, @1, @2, @3, @4, @5, @6, @7, @8, @9, @10, @11, @12, @13];
    XCTAssertEqualObjects(visitedIndices, allIndices);
}

- (void)test_sequenceFactory_repeatedItem
{
    NSArray* array = [FunkyArrayUtilities arrayWithItem:@0 repeated:5];
    NSArray* expected = @[@0, @0, @0, @0, @0];
    XCTAssertEqualObjects(expected, array);
}

- (void)test_sequenceFactory_generatedItemInRepeation
{
    NSArray* array = [FunkyArrayUtilities arrayWithArray:@[@1, @1] nextItem:^id(NSArray* array) {
        return @([array[array.count - 1] intValue] + [array[array.count - 2] intValue]);
    } repeated:5];
    NSArray* expected = @[@1, @1, @2, @3, @5, @8, @13];
    XCTAssertEqualObjects(expected, array);
}

- (void)test_sequenceFactory_generatedItemUntilCondition
{
    NSArray* array = [FunkyArrayUtilities arrayWithArray:@[@1, @1] nextItem:^id(NSArray* array) {
        return @([array[array.count - 1] intValue] + [array[array.count - 2] intValue]);
    } until:^BOOL(NSArray* array) {
        return array.count < 7;
    }];
    NSArray* expected = @[@1, @1, @2, @3, @5, @8, @13];
    XCTAssertEqualObjects(expected, array);
}

- (void)test_unique
{
    id result = [self.utils unique];
    id expected = @[@0, @1, @2, @3, @10, @5, @4, @6, @8, @7, @9];
    XCTAssertEqualObjects(result, expected);
}

- (void)test_reversed
{
    id result = [self.utils reversed];
    id expected = @[@8, @9, @7, @8, @6, @4, @5, @10, @3, @2, @0, @1, @1, @0];
    XCTAssertEqualObjects(result, expected);
}

- (void)test_shuffled
{
    id result = [self.utils shuffled];
    XCTAssertNotEqualObjects(result, self.utils);
}

@end
