//
//  FunkyNSMutableDictionarySubclassTests.m
//  Funky
//
//  Created by László Teveli on 2017. 04. 08..
//  Copyright © 2017. tevelee. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Funky/FunkyNSDictionarySubclass.h>
#import <Funky/FunkyNSMutableDictionarySubclass.h>

@interface FunkyNSMutableDictionarySubclassTests : XCTestCase

@end

@implementation FunkyNSMutableDictionarySubclassTests

#pragma mark - init

- (void)test_initialisesWithEmptyDictionary_withCustomInit {
    NSMutableDictionary* dictionary = [[FunkyNSMutableDictionarySubclass alloc] initWithDictionary:@{}];
    XCTAssertNotNil(dictionary);
}

- (void)test_initialisesWithNonEmptyDictionary_withCustomInit {
    NSMutableDictionary* dictionary = [[FunkyNSMutableDictionarySubclass alloc] initWithDictionary:@{@0: @0}];
    XCTAssertNotNil(dictionary);
}

- (void)test_initialisesAsEmpty_withBuiltInNew {
    NSMutableDictionary* dictionary = [FunkyNSMutableDictionarySubclass new];
    XCTAssertNotNil(dictionary);
}

- (void)test_initialisesAsEmpty_withBuiltInInit {
    NSMutableDictionary* dictionary = [[FunkyNSMutableDictionarySubclass alloc] init];
    XCTAssertNotNil(dictionary);
}

- (void)test_initialisesWithEmptyDictionary_withBuiltInInit {
    id nilValue = nil;
    NSMutableDictionary* dictionary = [[FunkyNSMutableDictionarySubclass alloc] initWithObjectsAndKeys:nilValue, nilValue, nil];
    XCTAssertNotNil(dictionary);
}

- (void)test_initialisesWithNonEmptyDictionary_withBuiltInInit {
    NSMutableDictionary* dictionary = [[FunkyNSMutableDictionarySubclass alloc] initWithObjectsAndKeys:@0, @0, @1, @1, nil];
    XCTAssertNotNil(dictionary);
}

#pragma mark - Init with Constructor

- (void)test_initialisesWithConstructor_asEmpty {
    NSMutableDictionary* dictionary = [FunkyNSMutableDictionarySubclass dictionary];
    XCTAssertNotNil(dictionary);
}

- (void)test_initialisesWithConstructor_withObject {
    NSMutableDictionary* dictionary = [FunkyNSMutableDictionarySubclass dictionaryWithObject:@1 forKey:@1];
    XCTAssertNotNil(dictionary);
}

- (void)test_initialisesWithConstructor_withObjects {
    NSMutableDictionary* dictionary = [FunkyNSMutableDictionarySubclass dictionaryWithObjectsAndKeys:@1, @1, nil];
    XCTAssertNotNil(dictionary);
}

- (void)test_initialisesWithConstructor_withDictionary {
    NSMutableDictionary* dictionary = [FunkyNSMutableDictionarySubclass dictionaryWithDictionary:@{@0: @0}];
    XCTAssertNotNil(dictionary);
}

- (void)test_initialisesWithConstructor_withCapacity {
    NSMutableDictionary* dictionary = [[FunkyNSMutableDictionarySubclass alloc] initWithCapacity:15];
    XCTAssertNotNil(dictionary);
}

#pragma mark - count

- (void)test_withZeroElements_hasCorrectCount {
    NSMutableDictionary* dictionary = [[FunkyNSMutableDictionarySubclass alloc] initWithDictionary:@{}];
    XCTAssertEqual(dictionary.count, 0);
}

- (void)test_withOneElement_hasCorrectCount {
    NSMutableDictionary* dictionary = [[FunkyNSMutableDictionarySubclass alloc] initWithDictionary:@{@0: @0}];
    XCTAssertEqual(dictionary.count, 1);
}

- (void)test_withMultipleElements_hasCorrectCount {
    NSMutableDictionary* dictionary = [[FunkyNSMutableDictionarySubclass alloc] initWithDictionary:@{@0: @0, @1: @1, @2: @2}];
    XCTAssertEqual(dictionary.count, 3);
}

- (void)test_withConstructor_hasCorrectCount {
    NSMutableDictionary* dictionary = [FunkyNSMutableDictionarySubclass dictionaryWithObjectsAndKeys:@1, @1, @2, @2, nil];
    XCTAssertEqual(dictionary.count, 2);
}

#pragma mark - objectForKey

- (void)test_containsObject_findsElement {
    NSMutableDictionary* dictionary = [[FunkyNSMutableDictionarySubclass alloc] initWithDictionary:@{@0: @0, @1: @1}];
    XCTAssertNotNil([dictionary objectForKey:@0]);
}

- (void)test_containsObject_doesNotFindUnexistingElement {
    NSMutableDictionary* dictionary = [[FunkyNSMutableDictionarySubclass alloc] initWithDictionary:@{@0: @0, @1: @1}];
    XCTAssertNil([dictionary objectForKey:@3]);
}

#pragma mark - equality

- (void)test_equality_positive {
    NSMutableDictionary* dictionary = [[FunkyNSMutableDictionarySubclass alloc] initWithDictionary:@{@0: @0, @1: @1}];
    NSDictionary* other = @{@0: @0, @1: @1};
    XCTAssertTrue([dictionary isEqualToDictionary:other]);
}

- (void)test_equality_negative {
    NSMutableDictionary* dictionary = [[FunkyNSMutableDictionarySubclass alloc] initWithDictionary:@{@0: @0, @1: @1}];
    NSDictionary* other = @{@0: @0, @2: @2};
    XCTAssertFalse([dictionary isEqualToDictionary:other]);
}

#pragma mark - objectsForKeys

- (void)test_objectsForKeys_findsElement {
    NSDictionary* dictionary = [[FunkyNSMutableDictionarySubclass alloc] initWithDictionary:@{@0: @0, @1: @1}];
    XCTAssertEqualObjects([dictionary objectsForKeys:@[@1] notFoundMarker:@(NSNotFound)], @[@1]);
}

- (void)test_objectsForKeys_doesNotFindUnexistentElement {
    NSDictionary* dictionary = [[FunkyNSMutableDictionarySubclass alloc] initWithDictionary:@{@0: @0, @1: @1}];
    XCTAssertEqualObjects([dictionary objectsForKeys:@[@2] notFoundMarker:@(NSNotFound)], @[@(NSNotFound)]);
}

#pragma mark - nil

- (void)test_addingNilKey_throwsException {
    @try {
        NSNumber* nilValue = nil;
        [FunkyNSDictionarySubclass dictionaryWithObject:@0 forKey:nilValue];
        XCTAssertTrue(NO);
    } @catch (NSException *exception) {
        XCTAssertTrue(YES);
    }
}

- (void)test_addingNilValue_throwsException {
    @try {
        NSNumber* nilValue = nil;
        [FunkyNSDictionarySubclass dictionaryWithObject:nilValue forKey:@0];
        XCTAssertTrue(NO);
    } @catch (NSException *exception) {
        XCTAssertTrue(YES);
    }
}

#pragma mark - Encoding

- (void)test_coder {
    NSMutableDictionary* dictionary = [FunkyNSMutableDictionarySubclass dictionaryWithDictionary:@{@0: @0, @1: @1, @2: @2}];
    
    NSData* archived = [NSKeyedArchiver archivedDataWithRootObject:dictionary];
    XCTAssertNotNil(archived);
    
    NSDictionary* unarchived = [NSKeyedUnarchiver unarchiveObjectWithData:archived];
    XCTAssertEqualObjects(dictionary, unarchived);
}

#pragma mark - copy

- (void)test_copy {
    NSMutableDictionary* dictionary = [FunkyNSMutableDictionarySubclass new];
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
    NSMutableDictionary* dictionary = [FunkyNSMutableDictionarySubclass new];
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

- (void)test_NSMutableDictionary {
    FunkyNSMutableDictionarySubclass* dictionary = [FunkyNSMutableDictionarySubclass dictionaryWithDictionary:@{@0: @0, @1: @1, @2: @2}];
    NSDictionary* normal = [dictionary NSMutableDictionary];
    XCTAssertTrue([normal isKindOfClass:[NSDictionary class]]);
    XCTAssertFalse([normal isKindOfClass:[FunkyNSMutableDictionarySubclass class]]);
    XCTAssertEqualObjects(dictionary, normal);
}

#pragma mark - Overriden methods

- (void)test_addObject
{
    NSMutableDictionary* dictionary = [FunkyNSMutableDictionarySubclass dictionaryWithDictionary:@{@0: @0, @1: @1, @2: @2}];
    [dictionary setObject:@3 forKey:@3];
    NSDictionary* expected = @{@0: @0, @1: @1, @2: @2, @3: @3};
    XCTAssertEqualObjects(expected, dictionary);
}

- (void)test_removeLastObject
{
    NSMutableDictionary* dictionary = [FunkyNSMutableDictionarySubclass dictionaryWithDictionary:@{@0: @0, @1: @1, @2: @2}];
    [dictionary removeObjectForKey:@2];
    NSDictionary* expected = @{@0: @0, @1: @1};
    XCTAssertEqualObjects(expected, dictionary);
}

@end
