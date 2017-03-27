//
//  LTNilTolerantNSArrayTests.m
//  LTFunctional
//
//  Created by László Teveli on 2017. 03. 22..
//  Copyright © 2017. tevelee. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <LTFunctional/LTNilTolerantNSArray.h>

@interface LTNilTolerantNSArrayTests : XCTestCase

@end

@implementation LTNilTolerantNSArrayTests

- (void)test_nilTolerant_extension
{
    NSArray* array = @[];
    id nilTolerant = array.nilTolerant;
    XCTAssertTrue([nilTolerant isKindOfClass:[LTNilTolerantNSArray class]]);
    XCTAssertNotEqual([nilTolerant class], [array class]);
    
    id normal = [nilTolerant NSArray];
    XCTAssertFalse([normal isKindOfClass:[LTNilTolerantNSArray class]]);
    XCTAssertTrue([nilTolerant isKindOfClass:[NSArray class]]);
}

- (void)test_arrayByAddingObject
{
    NSArray* array = [@[].nilTolerant arrayByAddingObject:@2];
    XCTAssertEqual(array.count, 1);
    
    id nilValue = nil;
    array = [@[].nilTolerant arrayByAddingObject:nilValue];
    XCTAssertEqual(array.count, 0);
}

- (void)test_arrayWithObject
{
    NSArray* array = [LTNilTolerantNSArray arrayWithObject:@2];
    XCTAssertEqual(array.count, 1);
    
    id nilValue = nil;
    array = [LTNilTolerantNSArray arrayWithObject:nilValue];
    XCTAssertEqual(array.count, 0);
}

- (void)test_mutable_arrayWithObject
{
    id nilValue = nil;
    NSArray* array = [LTNilTolerantNSMutableArray arrayWithObject:nilValue];
    XCTAssertEqual(array.count, 0);
    
    array = [LTNilTolerantNSMutableArray arrayWithObject:@2];
    XCTAssertEqual(array.count, 1);
}

- (void)test_mutable_arrayByAddingObject
{
    id nilValue = nil;
    NSArray* array = [[@[].mutableCopy nilTolerant] arrayByAddingObject:nilValue];
    XCTAssertEqual(array.count, 0);
    
    array = [[@[].mutableCopy nilTolerant] arrayByAddingObject:@2];
    XCTAssertEqual(array.count, 1);
}

- (void)test_mutable_add
{
    NSArray* nilValue = nil;
    NSArray* original = @[@1, @2];
    NSMutableArray* array = original.mutableCopy;
    array = [array nilTolerant];
    [array addObject:nilValue];
    XCTAssertEqualObjects(array, original);
    
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
    array = [array nilTolerant];
    [array insertObject:nilValue atIndex:0];
    XCTAssertEqualObjects(array, original);
    
    array = original.mutableCopy;
    array = [array nilTolerant];
    [array insertObject:@3 atIndex:0];
    NSArray* expected = @[@3, @1, @2,];
    XCTAssertEqualObjects(array, expected);
}

- (void)test_mutable_replace
{
    NSArray* nilValue = nil;
    NSArray* original = @[@1, @2];
    NSMutableArray* array = original.mutableCopy;
    array = [array nilTolerant];
    [array replaceObjectAtIndex:0 withObject:nilValue];
    XCTAssertEqualObjects(array, original);
    
    array = original.mutableCopy;
    array = [array nilTolerant];
    [array replaceObjectAtIndex:0 withObject:@3];
    NSArray* expected = @[@3, @2];
    XCTAssertEqualObjects(array, expected);
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
    NSArray* array = @[@1, @2, @3].nilTolerant;
    id copy = [array copy];
    XCTAssertTrue([copy isKindOfClass:[LTNilTolerantNSArray class]]);
    
    id mutableCopy = [array mutableCopy];
    XCTAssertTrue([mutableCopy isKindOfClass:[LTNilTolerantNSMutableArray class]]);
    
    id copyOfMutable = [mutableCopy copy];
    XCTAssertTrue([copyOfMutable isKindOfClass:[LTNilTolerantNSArray class]]);
    
    id mutableCopyOfMutable = [mutableCopy mutableCopy];
    XCTAssertTrue([mutableCopyOfMutable isKindOfClass:[LTNilTolerantNSMutableArray class]]);
}

@end
