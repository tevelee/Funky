//
//  FunkyNilTolerantNSArrayTests.m
//  Funky
//
//  Created by László Teveli on 2017. 03. 22..
//  Copyright © 2017. tevelee. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Funky/FunkyNilTolerantNSArray.h>
#import <Funky/NSArray+FunkyCore.h>

@interface FunkyNilTolerantNSArrayTests : XCTestCase

@end

@implementation FunkyNilTolerantNSArrayTests

- (void)test_nilTolerant_extension
{
    NSArray* array = @[];
    id nilTolerant = array.nilTolerant;
    XCTAssertTrue([nilTolerant isKindOfClass:[FunkyNilTolerantNSArray class]]);
    XCTAssertNotEqual([nilTolerant class], [array class]);
    
    id normal = [nilTolerant NSArray];
    XCTAssertFalse([normal isKindOfClass:[FunkyNilTolerantNSArray class]]);
    XCTAssertTrue([nilTolerant isKindOfClass:[NSArray class]]);
}

- (void)test_nilTolerant_constructor
{
    NSArray* nilTolerant = [NSArray nilTolerantArray];
    XCTAssertTrue([nilTolerant isKindOfClass:[FunkyNilTolerantNSArray class]]);
    XCTAssertNotEqual([nilTolerant class], [NSArray class]);
}

- (void)test_nilTolerant_mutable_constructor
{
    NSArray* nilTolerant = [NSMutableArray nilTolerantArray];
    XCTAssertTrue([nilTolerant isKindOfClass:[FunkyNilTolerantNSMutableArray class]]);
    XCTAssertNotEqual([nilTolerant class], [NSArray class]);
    XCTAssertNotEqual([nilTolerant class], [NSMutableArray class]);
    
    nilTolerant = [NSMutableArray nilTolerantArrayWithCapacity:2];
    XCTAssertTrue([nilTolerant isKindOfClass:[FunkyNilTolerantNSMutableArray class]]);
    XCTAssertNotEqual([nilTolerant class], [NSArray class]);
    XCTAssertNotEqual([nilTolerant class], [NSMutableArray class]);
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
    NSArray* array = [NSArray nilTolerantArrayWithObject:@2];
    XCTAssertEqual(array.count, 1);
    
    id nilValue = nil;
    array = [NSArray nilTolerantArrayWithObject:nilValue];
    XCTAssertEqual(array.count, 0);

    NSMutableArray* mutable = [NSMutableArray nilTolerantArrayWithObject:@2];
    XCTAssertEqual(mutable.count, 1);
    
    mutable = [NSMutableArray nilTolerantArrayWithObject:nilValue];
    XCTAssertEqual(mutable.count, 0);
}

- (void)test_arrayWithArray
{
    NSArray* original = @[@"1", @"2"];
    NSArray* array = [NSArray nilTolerantArrayWithArray:original];
    XCTAssertEqualObjects(array, original);
    
    array = [NSMutableArray nilTolerantArrayWithArray:original];
    XCTAssertEqualObjects(array, original);
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
    XCTAssertTrue([copy isKindOfClass:[FunkyNilTolerantNSArray class]]);
    
    id mutableCopy = [array mutableCopy];
    XCTAssertTrue([mutableCopy isKindOfClass:[FunkyNilTolerantNSMutableArray class]]);
    
    id copyOfMutable = [mutableCopy copy];
    XCTAssertTrue([copyOfMutable isKindOfClass:[FunkyNilTolerantNSArray class]]);
    
    id mutableCopyOfMutable = [mutableCopy mutableCopy];
    XCTAssertTrue([mutableCopyOfMutable isKindOfClass:[FunkyNilTolerantNSMutableArray class]]);
}

- (void)test_mutable
{
    Class class = [FunkyNilTolerantNSArray classForMutableCounterPart];
    XCTAssertEqualObjects(class, [FunkyNilTolerantNSMutableArray class]);
    
    class = [FunkyNilTolerantNSMutableArray classForMutableCounterPart];
    XCTAssertEqualObjects(class, [FunkyNilTolerantNSMutableArray class]);
}

- (void)test_immutable
{
    Class class = [FunkyNilTolerantNSArray classForImmutableCounterPart];
    XCTAssertEqualObjects(class, [FunkyNilTolerantNSArray class]);
    
    class = [FunkyNilTolerantNSArray classForImmutableCounterPart];
    XCTAssertEqualObjects(class, [FunkyNilTolerantNSArray class]);
}

- (void)test_flatten
{
    Class class = [FunkyNilTolerantNSArray classToFlatten];
    XCTAssertEqualObjects(class, [NSArray class]);
    
    class = [FunkyNilTolerantNSMutableArray classToFlatten];
    XCTAssertEqualObjects(class, [NSArray class]);
}

@end
