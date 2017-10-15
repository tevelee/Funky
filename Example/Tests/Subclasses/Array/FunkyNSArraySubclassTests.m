//
//  FunkyNSArraySubclassTests.m
//  Funky
//
//  Created by László Teveli on 2017. 03. 22..
//  Copyright © 2017. tevelee. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Funky/FunkyNSArraySubclass.h>
#import <Funky/FunkyNSMutableArraySubclass.h>

@interface FunkyNSArraySubclassTests : XCTestCase

@end

@implementation FunkyNSArraySubclassTests

#pragma mark - init

- (void)test_initialisesWithEmptyArray_withCustomInit {
    NSArray* array = [[FunkyNSArraySubclass alloc] initWithArray:@[]];
    XCTAssertNotNil(array);
}

- (void)test_initialisesWithNonEmptyArray_withCustomInit {
    NSArray* array = [[FunkyNSArraySubclass alloc] initWithArray:@[@0]];
    XCTAssertNotNil(array);
}

- (void)test_initialisesAsEmpty_withBuiltInNew {
    NSArray* array = [FunkyNSArraySubclass new];
    XCTAssertNotNil(array);
}

- (void)test_initialisesAsEmpty_withBuiltInInit {
    NSArray* array = [[FunkyNSArraySubclass alloc] init];
    XCTAssertNotNil(array);
}

- (void)test_initialisesWithEmptyArray_withBuiltInInit {
    id nilValue = nil;
    NSArray* array = [[FunkyNSArraySubclass alloc] initWithObjects:nilValue, nil];
    XCTAssertNotNil(array);
}

- (void)test_initialisesWithNonEmptyArray_withBuiltInInit {
    NSArray* array = [[FunkyNSArraySubclass alloc] initWithObjects:@0, @1, nil];
    XCTAssertNotNil(array);
}

#pragma mark - Init with Constructor

- (void)test_initialisesWithConstructor_asEmpty {
    NSArray* array = [FunkyNSArraySubclass array];
    XCTAssertNotNil(array);
}

- (void)test_initialisesWithConstructor_withObject {
    NSArray* array = [FunkyNSArraySubclass arrayWithObject:@1];
    XCTAssertNotNil(array);
}

- (void)test_initialisesWithConstructor_withObjects {
    NSArray* array = [FunkyNSArraySubclass arrayWithObjects:@0, nil];
    XCTAssertNotNil(array);
}

- (void)test_initialisesWithConstructor_withArray {
    NSArray* array = [FunkyNSArraySubclass arrayWithArray:@[@0]];
    XCTAssertNotNil(array);
}

#pragma mark - count

- (void)test_withZeroElements_hasCorrectCount {
    NSArray* array = [[FunkyNSArraySubclass alloc] initWithArray:@[]];
    XCTAssertEqual(array.count, 0);
}

- (void)test_withOneElement_hasCorrectCount {
    NSArray* array = [[FunkyNSArraySubclass alloc] initWithArray:@[@0]];
    XCTAssertEqual(array.count, 1);
}

- (void)test_withMultipleElements_hasCorrectCount {
    NSArray* array = [[FunkyNSArraySubclass alloc] initWithArray:@[@0, @1, @2]];
    XCTAssertEqual(array.count, 3);
}

- (void)test_withConstructor_hasCorrectCount {
    NSArray* array = [FunkyNSArraySubclass arrayWithObjects:@1, @2, nil];
    XCTAssertEqual(array.count, 2);
}

#pragma mark - objectAtIndex

- (void)test_returnsObjectAtFirstIndex {
    NSArray* array = [[FunkyNSArraySubclass alloc] initWithArray:@[@0, @1, @2]];
    XCTAssertEqual([array objectAtIndex:0], @0);
}

- (void)test_returnsObjectAtLastIndex {
    NSArray* array = [[FunkyNSArraySubclass alloc] initWithArray:@[@0, @1, @2]];
    XCTAssertEqual([array objectAtIndex:1], @1);
}

- (void)test_returnsObjectAtCorrentIndex {
    NSArray* array = [[FunkyNSArraySubclass alloc] initWithArray:@[@0, @1, @2]];
    XCTAssertEqual([array objectAtIndex:2], @2);
}

#pragma mark - arrayByAddingObject

- (void)test_emptyArray_additionIncrementsCount {
    NSArray* array = [[FunkyNSArraySubclass alloc] init];
    NSArray* newArray = [array arrayByAddingObject:@3];
    XCTAssertEqual(array.count + 1, newArray.count);
}

- (void)test_nonEmptyArray_additionIncrementsCount {
    NSArray* array = [[FunkyNSArraySubclass alloc] initWithArray:@[@0, @1, @2]];
    NSArray* newArray = [array arrayByAddingObject:@3];
    XCTAssertEqual(array.count + 1, newArray.count);
}

#pragma mark - containsObject

- (void)test_containsObject_findsElement {
    NSArray* array = [[FunkyNSArraySubclass alloc] initWithArray:@[@0, @1]];
    XCTAssertTrue([array containsObject:@0]);
}

- (void)test_containsObject_doesNotFindUnexistingElement {
    NSArray* array = [[FunkyNSArraySubclass alloc] initWithArray:@[@0, @1]];
    XCTAssertFalse([array containsObject:@3]);
}

#pragma mark - equality

- (void)test_equality_positive {
    NSArray* array = [[FunkyNSArraySubclass alloc] initWithArray:@[@0, @1]];
    NSArray* other = @[@0, @1];
    XCTAssertTrue([array isEqualToArray:other]);
}

- (void)test_equality_negative {
    NSArray* array = [[FunkyNSArraySubclass alloc] initWithArray:@[@0, @1]];
    NSArray* other = @[@0, @2];
    XCTAssertFalse([array isEqualToArray:other]);
}

#pragma mark - indexOfObject

- (void)test_indexOfObject_findsElement {
    NSArray* array = [[FunkyNSArraySubclass alloc] initWithArray:@[@0, @1]];
    XCTAssertEqual([array indexOfObject:@1], 1);
}

- (void)test_indexOfObject_doesNotFindUnexistentElement {
    NSArray* array = [[FunkyNSArraySubclass alloc] initWithArray:@[@0, @1]];
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
    NSArray* array = [FunkyNSArraySubclass arrayWithArray:@[@0, @1, @2]];
    
    NSData* archived = [NSKeyedArchiver archivedDataWithRootObject:array];
    XCTAssertNotNil(archived);
    
    NSArray* unarchived = [NSKeyedUnarchiver unarchiveObjectWithData:archived];
    XCTAssertEqualObjects(array, unarchived);
}

#pragma mark - copy

- (void)test_copy {
    NSArray* array = [FunkyNSArraySubclass new];
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
    NSArray* array = [FunkyNSArraySubclass new];
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

- (void)test_NSArray {
    FunkyNSArraySubclass* array = [FunkyNSArraySubclass arrayWithArray:@[@0, @1, @2]];
    NSArray* normal = [array NSArray];
    XCTAssertTrue([normal isKindOfClass:[NSArray class]]);
    XCTAssertFalse([normal isKindOfClass:[FunkyNSArraySubclass class]]);
    XCTAssertEqualObjects(array, normal);
}

#pragma mark - initWithCoder

- (void)test_initWithCoder {
    NSMutableData* data = [NSMutableData data];
    NSCoder* coder = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    NSArray* array = [[FunkyNSArraySubclass alloc] initWithCoder:coder];
    XCTAssertNotNil(array);
}

@end
