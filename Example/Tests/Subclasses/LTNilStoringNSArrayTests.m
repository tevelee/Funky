//
//  LTNilStoringNSArrayTests.m
//  LTFunctional
//
//  Created by László Teveli on 2017. 03. 27..
//  Copyright © 2017. tevelee. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <LTFunctional/LTNilStoringNSArray.h>

@interface LTNilStoringNSArrayTests : XCTestCase

@end

@implementation LTNilStoringNSArrayTests

- (void)test_nilStoring_extension
{
    NSArray* array = @[];
    id nilStoring = array.nilStoring;
    XCTAssertTrue([nilStoring isKindOfClass:[LTNilStoringNSArray class]]);
    XCTAssertNotEqual([nilStoring class], [array class]);
    
    id normal = [nilStoring NSArray];
    XCTAssertFalse([normal isKindOfClass:[LTNilStoringNSArray class]]);
    XCTAssertTrue([nilStoring isKindOfClass:[NSArray class]]);
}

- (void)test_arrayByAddingObject
{
    NSArray* array = [@[].nilStoring arrayByAddingObject:@2];
    XCTAssertEqual(array.count, 1);
    
    id nilValue = nil;
    array = [@[].nilStoring arrayByAddingObject:nilValue];
    XCTAssertEqual(array.count, 1);
    XCTAssertNil(array.firstObject);
}

- (void)test_arrayWithObject
{
    NSArray* array = [LTNilStoringNSArray arrayWithObject:@2];
    XCTAssertEqual(array.count, 1);
    
    id nilValue = nil;
    array = [LTNilStoringNSArray arrayWithObject:nilValue];
    XCTAssertEqual(array.count, 1);
    XCTAssertNil(array.firstObject);
}

- (void)test_mutable_arrayWithObject
{
    id nilValue = nil;
    NSArray* array = [LTNilStoringNSMutableArray arrayWithObject:nilValue];
    XCTAssertEqual(array.count, 1);
    XCTAssertNil(array.firstObject);
    
    array = [LTNilStoringNSMutableArray arrayWithObject:@2];
    XCTAssertEqual(array.count, 1);
}

- (void)test_mutable_arrayByAddingObject
{
    id nilValue = nil;
    NSArray* array = [[@[].mutableCopy nilStoring] arrayByAddingObject:nilValue];
    XCTAssertEqual(array.count, 1);
    XCTAssertNil(array.firstObject);
    
    array = [[@[].mutableCopy nilStoring] arrayByAddingObject:@2];
    XCTAssertEqual(array.count, 1);
}

- (void)test_mutable_add
{
    NSArray* nilValue = nil;
    NSArray* original = @[@1, @2];
    NSMutableArray* array = original.mutableCopy;
    array = [array nilStoring];
    [array addObject:nilValue];
    XCTAssertEqual(array.count, original.count + 1);
    XCTAssertNil(array.lastObject);
    
    array = original.mutableCopy;
    [array addObject:@3];
    NSArray* expected = @[@1, @2, @3];
    XCTAssertEqualObjects(array, expected);
}

- (void)test_mutable_insert
{
    NSArray* nilValue = nil;
    NSArray* original = @[@1, @2];
    NSMutableArray* array = original.mutableCopy;
    array = [array nilStoring];
    [array insertObject:nilValue atIndex:0];
    XCTAssertEqual(array.count, original.count + 1);
    XCTAssertNil(array.firstObject);
    
    array = original.mutableCopy;
    array = [array nilStoring];
    [array insertObject:@3 atIndex:0];
    NSArray* expected = @[@3, @1, @2,];
    XCTAssertEqualObjects(array, expected);
}

- (void)test_mutable_replace
{
    NSArray* nilValue = nil;
    NSArray* original = @[@1, @2];
    NSMutableArray* array = original.mutableCopy;
    array = [array nilStoring];
    [array replaceObjectAtIndex:0 withObject:nilValue];
    XCTAssertEqual(array.count, original.count);
    XCTAssertNil(array.firstObject);
    
    array = original.mutableCopy;
    array = [array nilStoring];
    [array replaceObjectAtIndex:0 withObject:@3];
    NSArray* expected = @[@3, @2];
    XCTAssertEqualObjects(array, expected);
}

- (void)test_indexOfObject
{
    NSUInteger index = [@[@0, @1, @2].nilStoring indexOfObject:@1];
    XCTAssertEqual(index, 1);
    
    id nilValue = nil;
    index = [[[LTNilStoringNSArray arrayWithObject:nilValue] arrayByAddingObject:nilValue] indexOfObject:nilValue];
    XCTAssertEqual(index, 0);
    
    index = [[@[@0, @1, @2].mutableCopy nilStoring] indexOfObject:@1];
    XCTAssertEqual(index, 1);
    
    index = [[[LTNilStoringNSMutableArray arrayWithObject:nilValue] arrayByAddingObject:nilValue] indexOfObject:nilValue];
    XCTAssertEqual(index, 0);
}

- (void)test_indexOfObjectIndenticalTo
{
    NSUInteger index = [@[@0, @1, @2].nilStoring indexOfObjectIdenticalTo:@1];
    XCTAssertEqual(index, 1);
    
    id nilValue = nil;
    index = [[[LTNilStoringNSArray arrayWithObject:nilValue] arrayByAddingObject:nilValue] indexOfObject:nilValue];
    XCTAssertEqual(index, 0);
    
    index = [[@[@0, @1, @2].mutableCopy nilStoring] indexOfObjectIdenticalTo:@1];
    XCTAssertEqual(index, 1);
    
    index = [[[LTNilStoringNSMutableArray arrayWithObject:nilValue] arrayByAddingObject:nilValue] indexOfObject:nilValue];
    XCTAssertEqual(index, 0);
}

- (void)test_addNilArray_doesNotThrow
{
    NSArray* nilValue = nil;
    NSArray* array = [@[] arrayByAddingObjectsFromArray:nilValue];
    XCTAssertEqual(array.count, 0);
}

- (void)test_containsObject_doesNotThrow
{
    NSArray* nilValue = nil;
    BOOL contains = [@[] containsObject:nilValue];
    XCTAssertFalse(contains);
}

- (void)test_copy
{
    NSArray* array = @[@1, @2, @3].nilStoring;
    id copy = [array copy];
    XCTAssertTrue([copy isKindOfClass:[LTNilStoringNSArray class]]);
    
    id mutableCopy = [array mutableCopy];
    XCTAssertTrue([mutableCopy isKindOfClass:[LTNilStoringNSMutableArray class]]);
    
    id copyOfMutable = [mutableCopy copy];
    XCTAssertTrue([copyOfMutable isKindOfClass:[LTNilStoringNSArray class]]);
    
    id mutableCopyOfMutable = [mutableCopy mutableCopy];
    XCTAssertTrue([mutableCopyOfMutable isKindOfClass:[LTNilStoringNSMutableArray class]]);
}

@end
