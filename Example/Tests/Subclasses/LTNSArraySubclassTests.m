//
//  LTNSArraySubclassTests.m
//  LTFunctional
//
//  Created by László Teveli on 2017. 03. 22..
//  Copyright © 2017. tevelee. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <LTFunctional/LTNilStoringNSArray.h>

@interface LTNSArraySubclassTests : XCTestCase

@end

@implementation LTNSArraySubclassTests

#pragma mark - init

- (void)test_initialisesWithEmptyArray_withCustomInit {
    NSArray* array = [[LTNilStoringNSArray alloc] initWithArray:@[]];
    XCTAssertNotNil(array);
}

- (void)test_initialisesWithNonEmptyArray_withCustomInit {
    NSArray* array = [[LTNilStoringNSArray alloc] initWithArray:@[@0]];
    XCTAssertNotNil(array);
}

- (void)test_initialisesAsEmpty_withBuiltInNew {
    NSArray* array = [LTNilStoringNSArray new];
    XCTAssertNotNil(array);
}

- (void)test_initialisesAsEmpty_withBuiltInInit {
    NSArray* array = [[LTNilStoringNSArray alloc] init];
    XCTAssertNotNil(array);
}

- (void)test_initialisesWithEmptyArray_withBuiltInInit {
    NSArray* array = [[LTNilStoringNSArray alloc] initWithObjects:nil];
    XCTAssertNotNil(array);
}

- (void)test_initialisesWithNonEmptyArray_withBuiltInInit {
    NSArray* array = [[LTNilStoringNSArray alloc] initWithObjects:@0, @1, nil];
    XCTAssertNotNil(array);
}

#pragma mark - Init with Constructor

- (void)test_initialisesWithConstructor_asEmpty {
    NSArray* array = [LTNilStoringNSArray array];
    XCTAssertNotNil(array);
}

- (void)test_initialisesWithConstructor_withObject {
    NSArray* array = [LTNilStoringNSArray arrayWithObject:@1];
    XCTAssertNotNil(array);
}

- (void)test_initialisesWithConstructor_withObjects {
    NSArray* array = [LTNilStoringNSArray arrayWithObjects:@0, nil];
    XCTAssertNotNil(array);
}

- (void)test_initialisesWithConstructor_withArray {
    NSArray* array = [LTNilStoringNSArray arrayWithArray:@[@0]];
    XCTAssertNotNil(array);
}

#pragma mark - count

- (void)test_withZeroElements_hasCorrectCount {
    NSArray* array = [[LTNilStoringNSArray alloc] initWithArray:@[]];
    XCTAssertEqual(array.count, 0);
}

- (void)test_withOneElement_hasCorrectCount {
    NSArray* array = [[LTNilStoringNSArray alloc] initWithArray:@[@0]];
    XCTAssertEqual(array.count, 1);
}

- (void)test_withMultipleElements_hasCorrectCount {
    NSArray* array = [[LTNilStoringNSArray alloc] initWithArray:@[@0, @1, @2]];
    XCTAssertEqual(array.count, 3);
}

- (void)test_withConstructor_hasCorrectCount {
    NSArray* array = [LTNilStoringNSArray arrayWithObjects:@1, @2, nil];
    XCTAssertEqual(array.count, 2);
}

#pragma mark - objectAtIndex

- (void)test_returnsObjectAtFirstIndex {
    NSArray* array = [[LTNilStoringNSArray alloc] initWithArray:@[@0, @1, @2]];
    XCTAssertEqual([array objectAtIndex:0], @0);
}

- (void)test_returnsObjectAtLastIndex {
    NSArray* array = [[LTNilStoringNSArray alloc] initWithArray:@[@0, @1, @2]];
    XCTAssertEqual([array objectAtIndex:1], @1);
}

- (void)test_returnsObjectAtCorrentIndex {
    NSArray* array = [[LTNilStoringNSArray alloc] initWithArray:@[@0, @1, @2]];
    XCTAssertEqual([array objectAtIndex:2], @2);
}

#pragma mark - arrayByAddingObject

- (void)test_emptyArray_additionIncrementsCount {
    NSArray* array = [[LTNilStoringNSArray alloc] init];
    NSArray* newArray = [array arrayByAddingObject:@3];
    XCTAssertEqual(array.count + 1, newArray.count);
}

- (void)test_nonEmptyArray_additionIncrementsCount {
    NSArray* array = [[LTNilStoringNSArray alloc] initWithArray:@[@0, @1, @2]];
    NSArray* newArray = [array arrayByAddingObject:@3];
    XCTAssertEqual(array.count + 1, newArray.count);
}

#pragma mark - containsObject

- (void)test_containsObject_findsElement {
    NSArray* array = [[LTNilStoringNSArray alloc] initWithArray:@[@0, @1]];
    XCTAssertTrue([array containsObject:@0]);
}

- (void)test_containsObject_doesNotFindUnexistingElement {
    NSArray* array = [[LTNilStoringNSArray alloc] initWithArray:@[@0, @1]];
    XCTAssertFalse([array containsObject:@3]);
}

#pragma mark - equality

- (void)test_equality_positive {
    NSArray* array = [[LTNilStoringNSArray alloc] initWithArray:@[@0, @1]];
    NSArray* other = @[@0, @1];
    XCTAssertTrue([array isEqualToArray:other]);
}

- (void)test_equality_negative {
    NSArray* array = [[LTNilStoringNSArray alloc] initWithArray:@[@0, @1]];
    NSArray* other = @[@0, @2];
    XCTAssertFalse([array isEqualToArray:other]);
}

#pragma mark - indexOfObject

- (void)test_indexOfObject_findsElement {
    NSArray* array = [[LTNilStoringNSArray alloc] initWithArray:@[@0, @1]];
    XCTAssertEqual([array indexOfObject:@1], 1);
}

- (void)test_indexOfObject_doesNotFindUnexistentElement {
    NSArray* array = [[LTNilStoringNSArray alloc] initWithArray:@[@0, @1]];
    XCTAssertEqual([array indexOfObject:@2], NSNotFound);
}

#pragma mark - nil

- (void)test_addingNil_throwsException {
    @try {
        NSNumber* nilValue = nil;
        [LTNilStoringNSArray arrayWithObject:nilValue];
        XCTAssertTrue(NO);
    } @catch (NSException *exception) {
        XCTAssertTrue(YES);
    }
}


@end
