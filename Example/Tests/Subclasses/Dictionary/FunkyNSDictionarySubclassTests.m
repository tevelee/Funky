//
//  FunkyNSDictionarySubclassTests.m
//  Funky
//
//  Created by László Teveli on 2017. 04. 08..
//  Copyright © 2017. tevelee. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Funky/FunkyNSDictionarySubclass.h>
#import <Funky/FunkyNSMutableDictionarySubclass.h>

@interface FunkyNSDictionarySubclassTests : XCTestCase

@end

@implementation FunkyNSDictionarySubclassTests

#pragma mark - init

- (void)test_initialisesWithEmptyDictionary_withCustomInit {
    NSDictionary* dictionary = [[FunkyNSDictionarySubclass alloc] initWithDictionary:@{}];
    XCTAssertNotNil(dictionary);
}

- (void)test_initialisesWithNonEmptyDictionary_withCustomInit {
    NSDictionary* dictionary = [[FunkyNSDictionarySubclass alloc] initWithDictionary:@{@0: @0}];
    XCTAssertNotNil(dictionary);
}

- (void)test_initialisesAsEmpty_withBuiltInNew {
    NSDictionary* dictionary = [FunkyNSDictionarySubclass new];
    XCTAssertNotNil(dictionary);
}

- (void)test_initialisesAsEmpty_withBuiltInInit {
    NSDictionary* dictionary = [[FunkyNSDictionarySubclass alloc] init];
    XCTAssertNotNil(dictionary);
}

- (void)test_initialisesWithEmptyDictionary_withBuiltInInit {
    id nilValue = nil;
    NSDictionary* dictionary = [[FunkyNSDictionarySubclass alloc] initWithObjectsAndKeys:nilValue, nilValue, nil];
    XCTAssertNotNil(dictionary);
}

- (void)test_initialisesWithNonEmptyDictionary_withBuiltInInit {
    NSDictionary* dictionary = [[FunkyNSDictionarySubclass alloc] initWithObjectsAndKeys:@0, @0, @1, @1, nil];
    XCTAssertNotNil(dictionary);
}

#pragma mark - Init with Constructor

- (void)test_initialisesWithConstructor_asEmpty {
    NSDictionary* dictionary = [FunkyNSDictionarySubclass dictionary];
    XCTAssertNotNil(dictionary);
}

- (void)test_initialisesWithConstructor_withObject {
    NSDictionary* dictionary = [FunkyNSDictionarySubclass dictionaryWithObject:@1 forKey:@1];
    XCTAssertNotNil(dictionary);
}

- (void)test_initialisesWithConstructor_withObjects {
    NSDictionary* dictionary = [FunkyNSDictionarySubclass dictionaryWithObjectsAndKeys:@0, @0, nil];
    XCTAssertNotNil(dictionary);
}

- (void)test_initialisesWithConstructor_withDictionary {
    NSDictionary* dictionary = [FunkyNSDictionarySubclass dictionaryWithDictionary:@{@0: @0}];
    XCTAssertNotNil(dictionary);
}

#pragma mark - count

- (void)test_withZeroElements_hasCorrectCount {
    NSDictionary* dictionary = [[FunkyNSDictionarySubclass alloc] initWithDictionary:@{}];
    XCTAssertEqual(dictionary.count, 0);
}

- (void)test_withOneElement_hasCorrectCount {
    NSDictionary* dictionary = [[FunkyNSDictionarySubclass alloc] initWithDictionary:@{@0: @0}];
    XCTAssertEqual(dictionary.count, 1);
}

- (void)test_withMultipleElements_hasCorrectCount {
    NSDictionary* dictionary = [[FunkyNSDictionarySubclass alloc] initWithDictionary:@{@0: @0, @1: @1, @2: @2}];
    XCTAssertEqual(dictionary.count, 3);
}

- (void)test_withConstructor_hasCorrectCount {
    NSDictionary* dictionary = [FunkyNSDictionarySubclass dictionaryWithObjectsAndKeys:@1, @1, @2, @2, nil];
    XCTAssertEqual(dictionary.count, 2);
}

#pragma mark - objectAtIndex

- (void)test_returnsObjectAtFirstIndex {
    NSDictionary* dictionary = [[FunkyNSDictionarySubclass alloc] initWithDictionary:@{@0: @0, @1: @1, @2: @2}];
    XCTAssertEqual([dictionary objectForKey:@0], @0);
}

- (void)test_returnsObjectAtLastIndex {
    NSDictionary* dictionary = [[FunkyNSDictionarySubclass alloc] initWithDictionary:@{@0: @0, @1: @1, @2: @2}];
    XCTAssertEqual([dictionary objectForKey:@1], @1);
}

- (void)test_returnsObjectAtCorrentIndex {
    NSDictionary* dictionary = [[FunkyNSDictionarySubclass alloc] initWithDictionary:@{@0: @0, @1: @1, @2: @2}];
    XCTAssertEqual([dictionary objectForKey:@2], @2);
}

#pragma mark - containsObject

- (void)test_containsObject_findsElement {
    NSDictionary* dictionary = [[FunkyNSDictionarySubclass alloc] initWithDictionary:@{@0: @0, @1: @1}];
    XCTAssertNotNil([dictionary objectForKey:@0]);
}

- (void)test_containsObject_doesNotFindUnexistingElement {
    NSDictionary* dictionary = [[FunkyNSDictionarySubclass alloc] initWithDictionary:@{@0: @0, @1: @1}];
    XCTAssertNil([dictionary objectForKey:@3]);
}

#pragma mark - equality

- (void)test_equality_positive {
    NSDictionary* dictionary = [[FunkyNSDictionarySubclass alloc] initWithDictionary:@{@0: @0, @1: @1}];
    NSDictionary* other = @{@0: @0, @1: @1};
    XCTAssertTrue([dictionary isEqualToDictionary:other]);
}

- (void)test_equality_negative {
    NSDictionary* dictionary = [[FunkyNSDictionarySubclass alloc] initWithDictionary:@{@0: @0, @1: @1}];
    NSDictionary* other = @{@0: @0, @2: @2};
    XCTAssertFalse([dictionary isEqualToDictionary:other]);
}

#pragma mark - objectsForKeys

- (void)test_objectsForKeys_findsElement {
    NSDictionary* dictionary = [[FunkyNSDictionarySubclass alloc] initWithDictionary:@{@0: @0, @1: @1}];
    XCTAssertEqualObjects([dictionary objectsForKeys:@[@1] notFoundMarker:@(NSNotFound)], @[@1]);
}

- (void)test_objectsForKeys_doesNotFindUnexistentElement {
    NSDictionary* dictionary = [[FunkyNSDictionarySubclass alloc] initWithDictionary:@{@0: @0, @1: @1}];
    XCTAssertEqualObjects([dictionary objectsForKeys:@[@2] notFoundMarker:@(NSNotFound)], @[@(NSNotFound)]);
}

#pragma mark - nil

- (void)test_addingNilKey_throwsException {
    @try {
        NSNumber* nilValue = nil;
        [FunkyNSDictionarySubclass dictionaryWithObject:@1 forKey:nilValue];
        XCTAssertTrue(NO);
    } @catch (NSException *exception) {
        XCTAssertTrue(YES);
    }
}

- (void)test_addingNilValue_throwsException {
    @try {
        NSNumber* nilValue = nil;
        [FunkyNSDictionarySubclass dictionaryWithObject:nilValue forKey:@1];
        XCTAssertTrue(NO);
    } @catch (NSException *exception) {
        XCTAssertTrue(YES);
    }
}

#pragma mark - Encoding

- (void)test_coder {
    NSDictionary* dictionary = [FunkyNSDictionarySubclass dictionaryWithDictionary:@{@0: @0, @1: @1, @2: @2}];
    
    NSData* archived = [NSKeyedArchiver archivedDataWithRootObject:dictionary];
    XCTAssertNotNil(archived);
    
    NSDictionary* unarchived = [NSKeyedUnarchiver unarchiveObjectWithData:archived];
    XCTAssertEqualObjects(dictionary, unarchived);
}

#pragma mark - copy

- (void)test_copy {
    NSDictionary* dictionary = [FunkyNSDictionarySubclass new];
    id copied = [dictionary copy];
    XCTAssertNotNil(copied);
    XCTAssertFalse([copied isKindOfClass:[NSMutableDictionary class]]);
    XCTAssertTrue([copied isKindOfClass:[NSDictionary class]]);
    
    NSDictionary* mutable = [FunkyNSMutableDictionarySubclass new];
    copied = [mutable copy];
    XCTAssertNotNil(copied);
    XCTAssertFalse([copied isKindOfClass:[NSMutableDictionary class]]);
    XCTAssertTrue([copied isKindOfClass:[NSDictionary class]]);
}

#pragma mark - mutableCopy

- (void)test_mutableCopy {
    NSDictionary* dictionary = [FunkyNSDictionarySubclass new];
    id copied = [dictionary mutableCopy];
    XCTAssertNotNil(copied);
    XCTAssertTrue([copied isKindOfClass:[NSMutableDictionary class]]);
    XCTAssertTrue([copied isKindOfClass:[NSDictionary class]]);
    
    NSDictionary* mutable = [FunkyNSMutableDictionarySubclass new];
    copied = [mutable mutableCopy];
    XCTAssertNotNil(copied);
    XCTAssertTrue([copied isKindOfClass:[NSMutableDictionary class]]);
    XCTAssertTrue([copied isKindOfClass:[NSDictionary class]]);
}

#pragma mark - NSDictionary

- (void)test_NSDictionary {
    FunkyNSDictionarySubclass* dictionary = [FunkyNSDictionarySubclass dictionaryWithDictionary:@{@0: @0, @1: @1, @2: @2}];
    NSDictionary* normal = [dictionary NSDictionary];
    XCTAssertTrue([normal isKindOfClass:[NSDictionary class]]);
    XCTAssertFalse([normal isKindOfClass:[FunkyNSDictionarySubclass class]]);
    XCTAssertEqualObjects(dictionary, normal);
}

#pragma mark - initWithCoder

- (void)test_initWithCoder {
    NSDictionary* original = [FunkyNSDictionarySubclass dictionaryWithDictionary:@{@0: @0, @1: @1, @2: @2}];
    
    NSData* archived = [NSKeyedArchiver archivedDataWithRootObject:original];
    NSMutableData* data = archived.mutableCopy;
    
    NSCoder* coder = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    NSDictionary* dictionary = [[FunkyNSDictionarySubclass alloc] initWithCoder:coder];
    XCTAssertNotNil(dictionary);
}

@end
