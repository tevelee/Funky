//
//  LTNSMutableArraySubclassTests.m
//  LTFunctional
//
//  Created by László Teveli on 2017. 03. 27..
//  Copyright © 2017. tevelee. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <LTFunctional/LTNSArraySubclass.h>
#import <LTFunctional/LTNSMutableArraySubclass.h>

@interface LTNSMutableArraySubclassTests : XCTestCase

@end

@implementation LTNSMutableArraySubclassTests

#pragma mark - init

- (void)test_initialisesWithEmptyArray_withCustomInit {
    NSMutableArray* array = [[LTNSMutableArraySubclass alloc] initWithArray:@[]];
    XCTAssertNotNil(array);
}

- (void)test_initialisesWithNonEmptyArray_withCustomInit {
    NSMutableArray* array = [[LTNSMutableArraySubclass alloc] initWithArray:@[@0]];
    XCTAssertNotNil(array);
}

- (void)test_initialisesAsEmpty_withBuiltInNew {
    NSMutableArray* array = [LTNSMutableArraySubclass new];
    XCTAssertNotNil(array);
}

- (void)test_initialisesAsEmpty_withBuiltInInit {
    NSMutableArray* array = [[LTNSMutableArraySubclass alloc] init];
    XCTAssertNotNil(array);
}

- (void)test_initialisesWithEmptyArray_withBuiltInInit {
    NSMutableArray* array = [[LTNSMutableArraySubclass alloc] initWithObjects:nil];
    XCTAssertNotNil(array);
}

- (void)test_initialisesWithNonEmptyArray_withBuiltInInit {
    NSMutableArray* array = [[LTNSMutableArraySubclass alloc] initWithObjects:@0, @1, nil];
    XCTAssertNotNil(array);
}

#pragma mark - Init with Constructor

- (void)test_initialisesWithConstructor_asEmpty {
    NSMutableArray* array = [LTNSMutableArraySubclass array];
    XCTAssertNotNil(array);
}

- (void)test_initialisesWithConstructor_withObject {
    NSMutableArray* array = [LTNSMutableArraySubclass arrayWithObject:@1];
    XCTAssertNotNil(array);
}

- (void)test_initialisesWithConstructor_withObjects {
    NSMutableArray* array = [LTNSMutableArraySubclass arrayWithObjects:@0, nil];
    XCTAssertNotNil(array);
}

- (void)test_initialisesWithConstructor_withArray {
    NSMutableArray* array = [LTNSMutableArraySubclass arrayWithArray:@[@0]];
    XCTAssertNotNil(array);
}

- (void)test_initialisesWithConstructor_withCapacity {
    NSMutableArray* array = [[LTNSMutableArraySubclass alloc] initWithCapacity:15];
    XCTAssertNotNil(array);
}

#pragma mark - count

- (void)test_withZeroElements_hasCorrectCount {
    NSMutableArray* array = [[LTNSMutableArraySubclass alloc] initWithArray:@[]];
    XCTAssertEqual(array.count, 0);
}

- (void)test_withOneElement_hasCorrectCount {
    NSMutableArray* array = [[LTNSMutableArraySubclass alloc] initWithArray:@[@0]];
    XCTAssertEqual(array.count, 1);
}

- (void)test_withMultipleElements_hasCorrectCount {
    NSMutableArray* array = [[LTNSMutableArraySubclass alloc] initWithArray:@[@0, @1, @2]];
    XCTAssertEqual(array.count, 3);
}

- (void)test_withConstructor_hasCorrectCount {
    NSMutableArray* array = [LTNSMutableArraySubclass arrayWithObjects:@1, @2, nil];
    XCTAssertEqual(array.count, 2);
}

#pragma mark - objectAtIndex

- (void)test_returnsObjectAtFirstIndex {
    NSMutableArray* array = [[LTNSMutableArraySubclass alloc] initWithArray:@[@0, @1, @2]];
    XCTAssertEqual([array objectAtIndex:0], @0);
}

- (void)test_returnsObjectAtLastIndex {
    NSMutableArray* array = [[LTNSMutableArraySubclass alloc] initWithArray:@[@0, @1, @2]];
    XCTAssertEqual([array objectAtIndex:1], @1);
}

- (void)test_returnsObjectAtCorrentIndex {
    NSMutableArray* array = [[LTNSMutableArraySubclass alloc] initWithArray:@[@0, @1, @2]];
    XCTAssertEqual([array objectAtIndex:2], @2);
}

#pragma mark - arrayByAddingObject

- (void)test_emptyArray_additionIncrementsCount {
    NSMutableArray* array = [[LTNSMutableArraySubclass alloc] init];
    NSArray* newArray = [array arrayByAddingObject:@3];
    XCTAssertEqual(array.count + 1, newArray.count);
}

- (void)test_nonEmptyArray_additionIncrementsCount {
    NSMutableArray* array = [[LTNSMutableArraySubclass alloc] initWithArray:@[@0, @1, @2]];
    NSArray* newArray = [array arrayByAddingObject:@3];
    XCTAssertEqual(array.count + 1, newArray.count);
}

#pragma mark - containsObject

- (void)test_containsObject_findsElement {
    NSMutableArray* array = [[LTNSMutableArraySubclass alloc] initWithArray:@[@0, @1]];
    XCTAssertTrue([array containsObject:@0]);
}

- (void)test_containsObject_doesNotFindUnexistingElement {
    NSMutableArray* array = [[LTNSMutableArraySubclass alloc] initWithArray:@[@0, @1]];
    XCTAssertFalse([array containsObject:@3]);
}

#pragma mark - equality

- (void)test_equality_positive {
    NSMutableArray* array = [[LTNSMutableArraySubclass alloc] initWithArray:@[@0, @1]];
    NSArray* other = @[@0, @1];
    XCTAssertTrue([array isEqualToArray:other]);
}

- (void)test_equality_negative {
    NSMutableArray* array = [[LTNSMutableArraySubclass alloc] initWithArray:@[@0, @1]];
    NSArray* other = @[@0, @2];
    XCTAssertFalse([array isEqualToArray:other]);
}

#pragma mark - indexOfObject

- (void)test_indexOfObject_findsElement {
    NSMutableArray* array = [[LTNSMutableArraySubclass alloc] initWithArray:@[@0, @1]];
    XCTAssertEqual([array indexOfObject:@1], 1);
}

- (void)test_indexOfObject_doesNotFindUnexistentElement {
    NSMutableArray* array = [[LTNSMutableArraySubclass alloc] initWithArray:@[@0, @1]];
    XCTAssertEqual([array indexOfObject:@2], NSNotFound);
}

#pragma mark - nil

- (void)test_addingNil_throwsException {
    @try {
        NSNumber* nilValue = nil;
        [LTNSArraySubclass arrayWithObject:nilValue];
        XCTAssertTrue(NO);
    } @catch (NSException *exception) {
        XCTAssertTrue(YES);
    }
}

#pragma mark - Encoding

- (void)test_coder {
    NSMutableArray* array = [LTNSMutableArraySubclass arrayWithArray:@[@0, @1, @2]];
    
    NSData* archived = [NSKeyedArchiver archivedDataWithRootObject:array];
    XCTAssertNotNil(archived);
    
    NSArray* unarchived = [NSKeyedUnarchiver unarchiveObjectWithData:archived];
    XCTAssertEqualObjects(array, unarchived);
}

#pragma mark - copy

- (void)test_copy {
    NSMutableArray* array = [LTNSMutableArraySubclass new];
    id copied = [array copy];
    XCTAssertNotNil(copied);
    XCTAssertFalse([copied isKindOfClass:[NSMutableArray class]]);
    XCTAssertTrue([copied isKindOfClass:[NSArray class]]);
    
    NSArray* mutable = [LTNSMutableArraySubclass new];
    copied = [mutable copy];
    XCTAssertNotNil(copied);
    XCTAssertFalse([copied isKindOfClass:[NSMutableArray class]]);
    XCTAssertTrue([copied isKindOfClass:[NSArray class]]);
}

#pragma mark - mutableCopy

- (void)test_mutableCopy {
    NSMutableArray* array = [LTNSMutableArraySubclass new];
    id copied = [array mutableCopy];
    XCTAssertNotNil(copied);
    XCTAssertTrue([copied isKindOfClass:[NSMutableArray class]]);
    XCTAssertTrue([copied isKindOfClass:[NSArray class]]);
    
    NSArray* mutable = [LTNSMutableArraySubclass new];
    copied = [mutable mutableCopy];
    XCTAssertNotNil(copied);
    XCTAssertTrue([copied isKindOfClass:[NSMutableArray class]]);
    XCTAssertTrue([copied isKindOfClass:[NSArray class]]);
}

#pragma mark - NSArray

- (void)test_NSMutableArray {
    LTNSMutableArraySubclass* array = [LTNSMutableArraySubclass arrayWithArray:@[@0, @1, @2]];
    NSArray* normal = [array NSMutableArray];
    XCTAssertTrue([normal isKindOfClass:[NSArray class]]);
    XCTAssertFalse([normal isKindOfClass:[LTNSMutableArraySubclass class]]);
    XCTAssertEqualObjects(array, normal);
}

#pragma mark - Overriden methods

- (void)test_insertObject
{
    NSMutableArray* array = [LTNSMutableArraySubclass arrayWithArray:@[@0, @1, @2]];
    [array insertObject:@3 atIndex:1];
    NSArray* expected = @[@0, @3, @1, @2];
    XCTAssertEqualObjects(expected, array);
}

- (void)test_removeObjectAtIndex
{
    NSMutableArray* array = [LTNSMutableArraySubclass arrayWithArray:@[@0, @1, @2]];
    [array removeObjectAtIndex:1];
    NSArray* expected = @[@0, @2];
    XCTAssertEqualObjects(expected, array);
}

- (void)test_addObject
{
    NSMutableArray* array = [LTNSMutableArraySubclass arrayWithArray:@[@0, @1, @2]];
    [array addObject:@3];
    NSArray* expected = @[@0, @1, @2, @3];
    XCTAssertEqualObjects(expected, array);
}

- (void)test_removeLastObject
{
    NSMutableArray* array = [LTNSMutableArraySubclass arrayWithArray:@[@0, @1, @2]];
    [array removeLastObject];
    NSArray* expected = @[@0, @1];
    XCTAssertEqualObjects(expected, array);
}

- (void)test_replaceObjectAtIndex
{
    NSMutableArray* array = [LTNSMutableArraySubclass arrayWithArray:@[@0, @1, @2]];
    [array replaceObjectAtIndex:1 withObject:@3];
    NSArray* expected = @[@0, @3, @2];
    XCTAssertEqualObjects(expected, array);
}

@end
