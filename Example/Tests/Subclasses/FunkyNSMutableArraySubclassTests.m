//
//  FunkyNSMutableArraySubclassTests.m
//  Funky
//
//  Created by László Teveli on 2017. 03. 27..
//  Copyright © 2017. tevelee. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Funky/FunkyNSArraySubclass.h>
#import <Funky/FunkyNSMutableArraySubclass.h>

@interface FunkyNSMutableArraySubclassTests : XCTestCase

@end

@implementation FunkyNSMutableArraySubclassTests

#pragma mark - init

- (void)test_initialisesWithEmptyArray_withCustomInit {
    NSMutableArray* array = [[FunkyNSMutableArraySubclass alloc] initWithArray:@[]];
    XCTAssertNotNil(array);
}

- (void)test_initialisesWithNonEmptyArray_withCustomInit {
    NSMutableArray* array = [[FunkyNSMutableArraySubclass alloc] initWithArray:@[@0]];
    XCTAssertNotNil(array);
}

- (void)test_initialisesAsEmpty_withBuiltInNew {
    NSMutableArray* array = [FunkyNSMutableArraySubclass new];
    XCTAssertNotNil(array);
}

- (void)test_initialisesAsEmpty_withBuiltInInit {
    NSMutableArray* array = [[FunkyNSMutableArraySubclass alloc] init];
    XCTAssertNotNil(array);
}

- (void)test_initialisesWithEmptyArray_withBuiltInInit {
    NSMutableArray* array = [[FunkyNSMutableArraySubclass alloc] initWithObjects:nil];
    XCTAssertNotNil(array);
}

- (void)test_initialisesWithNonEmptyArray_withBuiltInInit {
    NSMutableArray* array = [[FunkyNSMutableArraySubclass alloc] initWithObjects:@0, @1, nil];
    XCTAssertNotNil(array);
}

#pragma mark - Init with Constructor

- (void)test_initialisesWithConstructor_asEmpty {
    NSMutableArray* array = [FunkyNSMutableArraySubclass array];
    XCTAssertNotNil(array);
}

- (void)test_initialisesWithConstructor_withObject {
    NSMutableArray* array = [FunkyNSMutableArraySubclass arrayWithObject:@1];
    XCTAssertNotNil(array);
}

- (void)test_initialisesWithConstructor_withObjects {
    NSMutableArray* array = [FunkyNSMutableArraySubclass arrayWithObjects:@0, nil];
    XCTAssertNotNil(array);
}

- (void)test_initialisesWithConstructor_withArray {
    NSMutableArray* array = [FunkyNSMutableArraySubclass arrayWithArray:@[@0]];
    XCTAssertNotNil(array);
}

- (void)test_initialisesWithConstructor_withCapacity {
    NSMutableArray* array = [[FunkyNSMutableArraySubclass alloc] initWithCapacity:15];
    XCTAssertNotNil(array);
}

#pragma mark - count

- (void)test_withZeroElements_hasCorrectCount {
    NSMutableArray* array = [[FunkyNSMutableArraySubclass alloc] initWithArray:@[]];
    XCTAssertEqual(array.count, 0);
}

- (void)test_withOneElement_hasCorrectCount {
    NSMutableArray* array = [[FunkyNSMutableArraySubclass alloc] initWithArray:@[@0]];
    XCTAssertEqual(array.count, 1);
}

- (void)test_withMultipleElements_hasCorrectCount {
    NSMutableArray* array = [[FunkyNSMutableArraySubclass alloc] initWithArray:@[@0, @1, @2]];
    XCTAssertEqual(array.count, 3);
}

- (void)test_withConstructor_hasCorrectCount {
    NSMutableArray* array = [FunkyNSMutableArraySubclass arrayWithObjects:@1, @2, nil];
    XCTAssertEqual(array.count, 2);
}

#pragma mark - objectAtIndex

- (void)test_returnsObjectAtFirstIndex {
    NSMutableArray* array = [[FunkyNSMutableArraySubclass alloc] initWithArray:@[@0, @1, @2]];
    XCTAssertEqual([array objectAtIndex:0], @0);
}

- (void)test_returnsObjectAtLastIndex {
    NSMutableArray* array = [[FunkyNSMutableArraySubclass alloc] initWithArray:@[@0, @1, @2]];
    XCTAssertEqual([array objectAtIndex:1], @1);
}

- (void)test_returnsObjectAtCorrentIndex {
    NSMutableArray* array = [[FunkyNSMutableArraySubclass alloc] initWithArray:@[@0, @1, @2]];
    XCTAssertEqual([array objectAtIndex:2], @2);
}

#pragma mark - arrayByAddingObject

- (void)test_emptyArray_additionIncrementsCount {
    NSMutableArray* array = [[FunkyNSMutableArraySubclass alloc] init];
    NSArray* newArray = [array arrayByAddingObject:@3];
    XCTAssertEqual(array.count + 1, newArray.count);
}

- (void)test_nonEmptyArray_additionIncrementsCount {
    NSMutableArray* array = [[FunkyNSMutableArraySubclass alloc] initWithArray:@[@0, @1, @2]];
    NSArray* newArray = [array arrayByAddingObject:@3];
    XCTAssertEqual(array.count + 1, newArray.count);
}

#pragma mark - containsObject

- (void)test_containsObject_findsElement {
    NSMutableArray* array = [[FunkyNSMutableArraySubclass alloc] initWithArray:@[@0, @1]];
    XCTAssertTrue([array containsObject:@0]);
}

- (void)test_containsObject_doesNotFindUnexistingElement {
    NSMutableArray* array = [[FunkyNSMutableArraySubclass alloc] initWithArray:@[@0, @1]];
    XCTAssertFalse([array containsObject:@3]);
}

#pragma mark - equality

- (void)test_equality_positive {
    NSMutableArray* array = [[FunkyNSMutableArraySubclass alloc] initWithArray:@[@0, @1]];
    NSArray* other = @[@0, @1];
    XCTAssertTrue([array isEqualToArray:other]);
}

- (void)test_equality_negative {
    NSMutableArray* array = [[FunkyNSMutableArraySubclass alloc] initWithArray:@[@0, @1]];
    NSArray* other = @[@0, @2];
    XCTAssertFalse([array isEqualToArray:other]);
}

#pragma mark - indexOfObject

- (void)test_indexOfObject_findsElement {
    NSMutableArray* array = [[FunkyNSMutableArraySubclass alloc] initWithArray:@[@0, @1]];
    XCTAssertEqual([array indexOfObject:@1], 1);
}

- (void)test_indexOfObject_doesNotFindUnexistentElement {
    NSMutableArray* array = [[FunkyNSMutableArraySubclass alloc] initWithArray:@[@0, @1]];
    XCTAssertEqual([array indexOfObject:@2], NSNotFound);
}

#pragma mark - nil

- (void)test_addingNil_throwsException {
    @try {
        NSNumber* nilValue = nil;
        [FunkyNSArraySubclass arrayWithObject:nilValue];
        XCTAssertTrue(NO);
    } @catch (NSException *exception) {
        XCTAssertTrue(YES);
    }
}

#pragma mark - Encoding

- (void)test_coder {
    NSMutableArray* array = [FunkyNSMutableArraySubclass arrayWithArray:@[@0, @1, @2]];
    
    NSData* archived = [NSKeyedArchiver archivedDataWithRootObject:array];
    XCTAssertNotNil(archived);
    
    NSArray* unarchived = [NSKeyedUnarchiver unarchiveObjectWithData:archived];
    XCTAssertEqualObjects(array, unarchived);
}

#pragma mark - copy

- (void)test_copy {
    NSMutableArray* array = [FunkyNSMutableArraySubclass new];
    id copied = [array copy];
    XCTAssertNotNil(copied);
    XCTAssertFalse([copied isKindOfClass:[NSMutableArray class]]);
    XCTAssertTrue([copied isKindOfClass:[NSArray class]]);
    
    NSArray* mutable = [FunkyNSMutableArraySubclass new];
    copied = [mutable copy];
    XCTAssertNotNil(copied);
    XCTAssertFalse([copied isKindOfClass:[NSMutableArray class]]);
    XCTAssertTrue([copied isKindOfClass:[NSArray class]]);
}

#pragma mark - mutableCopy

- (void)test_mutableCopy {
    NSMutableArray* array = [FunkyNSMutableArraySubclass new];
    id copied = [array mutableCopy];
    XCTAssertNotNil(copied);
    XCTAssertTrue([copied isKindOfClass:[NSMutableArray class]]);
    XCTAssertTrue([copied isKindOfClass:[NSArray class]]);
    
    NSArray* mutable = [FunkyNSMutableArraySubclass new];
    copied = [mutable mutableCopy];
    XCTAssertNotNil(copied);
    XCTAssertTrue([copied isKindOfClass:[NSMutableArray class]]);
    XCTAssertTrue([copied isKindOfClass:[NSArray class]]);
}

#pragma mark - NSArray

- (void)test_NSMutableArray {
    FunkyNSMutableArraySubclass* array = [FunkyNSMutableArraySubclass arrayWithArray:@[@0, @1, @2]];
    NSArray* normal = [array NSMutableArray];
    XCTAssertTrue([normal isKindOfClass:[NSArray class]]);
    XCTAssertFalse([normal isKindOfClass:[FunkyNSMutableArraySubclass class]]);
    XCTAssertEqualObjects(array, normal);
}

#pragma mark - Overriden methods

- (void)test_insertObject
{
    NSMutableArray* array = [FunkyNSMutableArraySubclass arrayWithArray:@[@0, @1, @2]];
    [array insertObject:@3 atIndex:1];
    NSArray* expected = @[@0, @3, @1, @2];
    XCTAssertEqualObjects(expected, array);
}

- (void)test_removeObjectAtIndex
{
    NSMutableArray* array = [FunkyNSMutableArraySubclass arrayWithArray:@[@0, @1, @2]];
    [array removeObjectAtIndex:1];
    NSArray* expected = @[@0, @2];
    XCTAssertEqualObjects(expected, array);
}

- (void)test_addObject
{
    NSMutableArray* array = [FunkyNSMutableArraySubclass arrayWithArray:@[@0, @1, @2]];
    [array addObject:@3];
    NSArray* expected = @[@0, @1, @2, @3];
    XCTAssertEqualObjects(expected, array);
}

- (void)test_removeLastObject
{
    NSMutableArray* array = [FunkyNSMutableArraySubclass arrayWithArray:@[@0, @1, @2]];
    [array removeLastObject];
    NSArray* expected = @[@0, @1];
    XCTAssertEqualObjects(expected, array);
}

- (void)test_replaceObjectAtIndex
{
    NSMutableArray* array = [FunkyNSMutableArraySubclass arrayWithArray:@[@0, @1, @2]];
    [array replaceObjectAtIndex:1 withObject:@3];
    NSArray* expected = @[@0, @3, @2];
    XCTAssertEqualObjects(expected, array);
}

@end
