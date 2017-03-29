//
//  FunkyArrayUtilitiesTests.m
//  Funky
//
//  Created by László Teveli on 2017. 03. 21..
//  Copyright © 2017. tevelee. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Funky/NSArray+FunkyUtilities.h>

@interface FunkyArrayUtilitiesTests : XCTestCase

@property (nonatomic, strong) NSArray* items;

@end

@implementation FunkyArrayUtilitiesTests

- (void)setUp {
    [super setUp];
    self.items = @[@0, @1, @1, @0, @2, @3, @10, @5, @4, @6, @8, @7, @9, @8];
}

- (void)tearDown {
    [super tearDown];
}

- (void)test_minIndex
{
    XCTAssertEqual([self.items firstIndex], 0);
}

- (void)test_maxIndex
{
    XCTAssertEqual([self.items lastIndex], self.items.count - 1);
}

- (void)test_first
{
    id result = [self.items first:^BOOL(id item) {
        return [item doubleValue] > 4.5;
    }];
    XCTAssertEqualObjects(result, @10);
    
    result = [self.items first:^BOOL(id item) {
        return [item doubleValue] == 123;
    }];
    XCTAssertNil(result);
}

- (void)test_last
{
    id result = [self.items last:^BOOL(id item) {
        return [item doubleValue] < 4.5;
    }];
    XCTAssertEqualObjects(result, @4);
}

- (void)test_firstIndex
{
    NSUInteger result = [self.items firstIndex:^BOOL(id item) {
        return [item doubleValue] > 4.5;
    }];
    XCTAssertEqual(result, 6);
    
    result = [self.items firstIndex:^BOOL(id item) {
        return [item doubleValue] == 123;
    }];
    XCTAssertEqual(result, NSNotFound);
}

- (void)test_lastIndex
{
    NSUInteger result = [self.items lastIndex:^BOOL(id item) {
        return [item doubleValue] > 7;
    }];
    XCTAssertEqual(result, self.items.count - 1);
}

- (void)test_take
{
    id result = [self.items take:^BOOL(id item) {
        return [item doubleValue] < 4;
    }];
    id expected = @[@0, @1, @1, @0, @2, @3];
    XCTAssertEqualObjects(result, expected);
}

- (void)test_takeLast
{
    id result = [self.items takeLast:^BOOL(id item) {
        return [item doubleValue] > 5;
    }];
    id expected = @[@6, @8, @7, @9, @8];
    XCTAssertEqualObjects(result, expected);
}

- (void)test_fromValue
{
    id result = [self.items fromValueInclusive:@10];
    id expected = @[@10, @5, @4, @6, @8, @7, @9, @8];
    XCTAssertEqualObjects(result, expected);
    
    result = [self.items fromValueExclusive:@10];
    expected = @[@5, @4, @6, @8, @7, @9, @8];
    XCTAssertEqualObjects(result, expected);
}

- (void)test_fromIndex
{
    id result = [self.items fromIndexInclusive:10];
    id expected = @[@8, @7, @9, @8];
    XCTAssertEqualObjects(result, expected);
    
    result = [self.items fromIndexInclusive:-3];
    expected = @[@7, @9, @8];
    XCTAssertEqualObjects(result, expected);
    
    result = [self.items fromIndexExclusive:10];
    expected = @[@7, @9, @8];
    XCTAssertEqualObjects(result, expected);
    
    result = [self.items fromIndexExclusive:-3];
    expected = @[@9, @8];
    XCTAssertEqualObjects(result, expected);
    
    result = [self.items fromIndexInclusive:0];
    XCTAssertEqualObjects(result, self.items);
}

- (void)test_untilValue
{
    id result = [self.items untilValueInclusive:@10];
    id expected = @[@0, @1, @1, @0, @2, @3, @10];
    XCTAssertEqualObjects(result, expected);
    
    result = [self.items untilValueExclusive:@10];
    expected = @[@0, @1, @1, @0, @2, @3];
    XCTAssertEqualObjects(result, expected);
}

- (void)test_untilIndex
{
    id result = [self.items untilIndexInclusive:4];
    id expected = @[@0, @1, @1, @0, @2];
    XCTAssertEqualObjects(result, expected);
    
    result = [self.items untilIndexInclusive:-12];
    expected = @[@0, @1, @1];
    XCTAssertEqualObjects(result, expected);
    
    result = [self.items untilIndexExclusive:4];
    expected = @[@0, @1, @1, @0];
    XCTAssertEqualObjects(result, expected);
    
    result = [self.items untilIndexExclusive:-12];
    expected = @[@0, @1];
    XCTAssertEqualObjects(result, expected);
    
    result = [self.items untilIndexInclusive:13];
    XCTAssertEqualObjects(result, self.items);
}

- (void)test_fromValueUntilValue
{
    id result = [self.items fromValueInclusive:@10 untilValueInclusive:@8];
    id expected = @[@10, @5, @4, @6, @8];
    XCTAssertEqualObjects(result, expected);
    
    result = [self.items fromValueInclusive:@10 untilValueExclusive:@8];
    expected = @[@10, @5, @4, @6];
    XCTAssertEqualObjects(result, expected);
    
    result = [self.items fromValueExclusive:@10 untilValueInclusive:@8];
    expected = @[@5, @4, @6, @8];
    XCTAssertEqualObjects(result, expected);
    
    result = [self.items fromValueExclusive:@10 untilValueExclusive:@8];
    expected = @[@5, @4, @6];
    XCTAssertEqualObjects(result, expected);
}

- (void)test_fromIndexUntilIndex
{
    id result = [self.items fromIndexInclusive:10 untilIndexInclusive:12];
    id expected = @[@8, @7, @9];
    XCTAssertEqualObjects(result, expected);
    
    result = [self.items fromIndexInclusive:-4 untilIndexInclusive:-2];
    expected = @[@8, @7, @9];
    XCTAssertEqualObjects(result, expected);
    
    result = [self.items fromIndexInclusive:10 untilIndexExclusive:12];
    expected = @[@8, @7];
    XCTAssertEqualObjects(result, expected);
    
    result = [self.items fromIndexInclusive:-4 untilIndexExclusive:-2];
    expected = @[@8, @7];
    XCTAssertEqualObjects(result, expected);
    
    result = [self.items fromIndexExclusive:10 untilIndexInclusive:12];
    expected = @[@7, @9];
    XCTAssertEqualObjects(result, expected);
    
    result = [self.items fromIndexExclusive:-4 untilIndexInclusive:-2];
    expected = @[@7, @9];
    XCTAssertEqualObjects(result, expected);
    
    result = [self.items fromIndexExclusive:10 untilIndexExclusive:12];
    expected = @[@7];
    XCTAssertEqualObjects(result, expected);
    
    result = [self.items fromIndexExclusive:-4 untilIndexExclusive:-2];
    expected = @[@7];
    XCTAssertEqualObjects(result, expected);
}

- (void)test_forEach
{
    __block NSInteger numberOfVisitedItems = 0;
    [self.items forEach:^(id item) {
        numberOfVisitedItems++;
    }];
    XCTAssertEqual(numberOfVisitedItems, self.items.count);
    
    NSMutableArray* visitedIndices = [NSMutableArray arrayWithCapacity:self.items.count];
    [self.items forEachWithIndex:^(NSUInteger index, id item) {
        [visitedIndices addObject:@(index)];
    }];
    id allIndices = @[@0, @1, @2, @3, @4, @5, @6, @7, @8, @9, @10, @11, @12, @13];
    XCTAssertEqualObjects(visitedIndices, allIndices);
}

- (void)test_mapWithIndex
{
    NSMutableArray* visitedIndices = [NSMutableArray arrayWithCapacity:self.items.count];
    [self.items mapWithIndex:^id(NSUInteger index, id item) {
        [visitedIndices addObject:@(index)];
        return item;
    }];
    id allIndices = @[@0, @1, @2, @3, @4, @5, @6, @7, @8, @9, @10, @11, @12, @13];
    XCTAssertEqualObjects(visitedIndices, allIndices);
}

- (void)test_flatMapWithIndex
{
    NSMutableArray* visitedIndices = [NSMutableArray arrayWithCapacity:self.items.count];
    [self.items flatMapWithIndex:^id(NSUInteger index, id item) {
        [visitedIndices addObject:@(index)];
        return item;
    }];
    id allIndices = @[@0, @1, @2, @3, @4, @5, @6, @7, @8, @9, @10, @11, @12, @13];
    XCTAssertEqualObjects(visitedIndices, allIndices);
}

- (void)test_sequenceFactory_repeatedItem
{
    NSArray* array = [NSArray arrayWithItem:@0 repeated:5];
    NSArray* expected = @[@0, @0, @0, @0, @0];
    XCTAssertEqualObjects(expected, array);
}

- (void)test_sequenceFactory_generatedItemInRepeation
{
    NSArray* array = [NSArray arrayWithArray:@[@1, @1] nextItem:^id(NSArray* array) {
        return @([array[array.lastIndex] intValue] + [array[array.lastIndex - 1] intValue]);
    } repeated:5];
    NSArray* expected = @[@1, @1, @2, @3, @5, @8, @13];
    XCTAssertEqualObjects(expected, array);
}

- (void)test_sequenceFactory_generatedItemUntilCondition
{
    NSArray* array = [NSArray arrayWithArray:@[@1, @1] nextItem:^id(NSArray* array) {
        return @([array[array.lastIndex] intValue] + [array[array.lastIndex - 1] intValue]);
    } until:^BOOL(NSArray* array) {
        return array.count < 7;
    }];
    NSArray* expected = @[@1, @1, @2, @3, @5, @8, @13];
    XCTAssertEqualObjects(expected, array);
}

- (void)test_unique
{
    id result = [self.items unique];
    id expected = @[@0, @1, @2, @3, @10, @5, @4, @6, @8, @7, @9];
    XCTAssertEqualObjects(result, expected);
}

- (void)test_reversed
{
    id result = [self.items reversed];
    id expected = @[@8, @9, @7, @8, @6, @4, @5, @10, @3, @2, @0, @1, @1, @0];
    XCTAssertEqualObjects(result, expected);
}

- (void)test_shuffled
{
    id result = [self.items shuffled];
    XCTAssertNotEqualObjects(result, self.items);
}

@end
