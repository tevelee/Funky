//
//  FunkyNilStoringNSArrayTests.m
//  Funky
//
//  Created by László Teveli on 2017. 03. 27..
//  Copyright © 2017. tevelee. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Funky/FunkyNilStoringNSArray.h>
#import <Funky/NSArray+FunkyCore.h>

@interface FunkyNilStoringNSArrayTests : XCTestCase

@end

@implementation FunkyNilStoringNSArrayTests

- (void)test_nilStoring_extension
{
    NSArray* array = @[];
    id nilStoring = array.nilStoring;
    XCTAssertTrue([nilStoring isKindOfClass:[FunkyNilStoringNSArray class]]);
    XCTAssertNotEqual([nilStoring class], [array class]);
    
    id normal = [nilStoring NSArray];
    XCTAssertFalse([normal isKindOfClass:[FunkyNilStoringNSArray class]]);
    XCTAssertTrue([nilStoring isKindOfClass:[NSArray class]]);
}

- (void)test_nilStoring_constructor
{
    NSArray* nilStoring = [NSArray nilStoringArray];
    XCTAssertTrue([nilStoring isKindOfClass:[FunkyNilStoringNSArray class]]);
    XCTAssertNotEqual([nilStoring class], [NSArray class]);
}

- (void)test_nilStoring_mutable_constructor
{
    NSArray* nilStoring = [NSMutableArray nilStoringArray];
    XCTAssertTrue([nilStoring isKindOfClass:[FunkyNilStoringNSMutableArray class]]);
    XCTAssertNotEqual([nilStoring class], [NSArray class]);
    XCTAssertNotEqual([nilStoring class], [NSMutableArray class]);
    
    nilStoring = [NSMutableArray nilStoringArrayWithCapacity:2];
    XCTAssertTrue([nilStoring isKindOfClass:[FunkyNilStoringNSMutableArray class]]);
    XCTAssertNotEqual([nilStoring class], [NSArray class]);
    XCTAssertNotEqual([nilStoring class], [NSMutableArray class]);
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
    NSArray* array = [FunkyNilStoringNSArray arrayWithObject:@2];
    XCTAssertEqual(array.count, 1);
    
    id nilValue = nil;
    array = [FunkyNilStoringNSArray arrayWithObject:nilValue];
    XCTAssertEqual(array.count, 1);
    XCTAssertNil(array.firstObject);
}

- (void)test_mutable_arrayWithObject
{
    id nilValue = nil;
    NSArray* array = [FunkyNilStoringNSMutableArray arrayWithObject:nilValue];
    XCTAssertEqual(array.count, 1);
    XCTAssertNil(array.firstObject);
    
    array = [FunkyNilStoringNSMutableArray arrayWithObject:@2];
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
    index = [[[FunkyNilStoringNSArray arrayWithObject:nilValue] arrayByAddingObject:nilValue] indexOfObject:nilValue];
    XCTAssertEqual(index, 0);
    
    index = [[@[@0, @1, @2].mutableCopy nilStoring] indexOfObject:@1];
    XCTAssertEqual(index, 1);
    
    index = [[[FunkyNilStoringNSMutableArray arrayWithObject:nilValue] arrayByAddingObject:nilValue] indexOfObject:nilValue];
    XCTAssertEqual(index, 0);
}

- (void)test_indexOfObjectInRange
{
    NSUInteger index = [@[@0, @1, @2].nilStoring indexOfObject:@1 inRange:NSMakeRange(0, 3)];
    XCTAssertEqual(index, 1);
    
    id nilValue = nil;
    index = [[[FunkyNilStoringNSArray arrayWithObject:nilValue] arrayByAddingObject:nilValue] indexOfObject:nilValue];
    XCTAssertEqual(index, 0);
    
    index = [[@[@0, @1, @2].mutableCopy nilStoring] indexOfObject:@1 inRange:NSMakeRange(0, 3)];
    XCTAssertEqual(index, 1);
    
    index = [[[FunkyNilStoringNSMutableArray arrayWithObject:nilValue] arrayByAddingObject:nilValue] indexOfObject:nilValue];
    XCTAssertEqual(index, 0);
}

- (void)test_indexOfObjectIndenticalTo
{
    NSUInteger index = [@[@0, @1, @2].nilStoring indexOfObjectIdenticalTo:@1];
    XCTAssertEqual(index, 1);
    
    id nilValue = nil;
    index = [[[FunkyNilStoringNSArray arrayWithObject:nilValue] arrayByAddingObject:nilValue] indexOfObject:nilValue];
    XCTAssertEqual(index, 0);
    
    index = [[@[@0, @1, @2].mutableCopy nilStoring] indexOfObjectIdenticalTo:@1];
    XCTAssertEqual(index, 1);
    
    index = [[[FunkyNilStoringNSMutableArray arrayWithObject:nilValue] arrayByAddingObject:nilValue] indexOfObject:nilValue];
    XCTAssertEqual(index, 0);
}

- (void)test_indexOfObjectIndenticalToInRange
{
    NSUInteger index = [@[@0, @1, @2].nilStoring indexOfObjectIdenticalTo:@1 inRange:NSMakeRange(0, 3)];
    XCTAssertEqual(index, 1);
    
    id nilValue = nil;
    index = [[[FunkyNilStoringNSArray arrayWithObject:nilValue] arrayByAddingObject:nilValue] indexOfObject:nilValue];
    XCTAssertEqual(index, 0);
    
    index = [[@[@0, @1, @2].mutableCopy nilStoring] indexOfObjectIdenticalTo:@1 inRange:NSMakeRange(0, 3)];
    XCTAssertEqual(index, 1);
    
    index = [[[FunkyNilStoringNSMutableArray arrayWithObject:nilValue] arrayByAddingObject:nilValue] indexOfObject:nilValue];
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
    XCTAssertTrue([copy isKindOfClass:[FunkyNilStoringNSArray class]]);
    
    id mutableCopy = [array mutableCopy];
    XCTAssertTrue([mutableCopy isKindOfClass:[FunkyNilStoringNSMutableArray class]]);
    
    id copyOfMutable = [mutableCopy copy];
    XCTAssertTrue([copyOfMutable isKindOfClass:[FunkyNilStoringNSArray class]]);
    
    id mutableCopyOfMutable = [mutableCopy mutableCopy];
    XCTAssertTrue([mutableCopyOfMutable isKindOfClass:[FunkyNilStoringNSMutableArray class]]);
}

- (void)test_mutable
{
    Class class = [FunkyNilStoringNSArray classForMutableCounterPart];
    XCTAssertEqualObjects(class, [FunkyNilStoringNSMutableArray class]);
    
    class = [FunkyNilStoringNSMutableArray classForMutableCounterPart];
    XCTAssertEqualObjects(class, [FunkyNilStoringNSMutableArray class]);
}

- (void)test_immutable
{
    Class class = [FunkyNilStoringNSArray classForImmutableCounterPart];
    XCTAssertEqualObjects(class, [FunkyNilStoringNSArray class]);
    
    class = [FunkyNilStoringNSMutableArray classForImmutableCounterPart];
    XCTAssertEqualObjects(class, [FunkyNilStoringNSArray class]);
}

- (void)test_flatten
{
    Class class = [FunkyNilStoringNSArray classToFlatten];
    XCTAssertEqualObjects(class, [NSArray class]);
    
    class = [FunkyNilStoringNSMutableArray classToFlatten];
    XCTAssertEqualObjects(class, [NSArray class]);
}

@end
