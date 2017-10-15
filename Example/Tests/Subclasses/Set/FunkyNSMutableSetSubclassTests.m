//
//  FunkyNSMutableSetSubclassTests.m
//  Funky
//
//  Created by László Teveli on 2017. 04. 08..
//  Copyright © 2017. tevelee. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Funky/FunkyNSSetSubclass.h>
#import <Funky/FunkyNSMutableSetSubclass.h>

@interface FunkyNSMutableSetSubclassTests : XCTestCase

@end

@implementation FunkyNSMutableSetSubclassTests

#pragma mark - init

- (void)test_initialisesWithEmptySet_withCustomInit {
    NSMutableSet* set = [[FunkyNSMutableSetSubclass alloc] initWithSet:[NSSet set]];
    XCTAssertNotNil(set);
}

- (void)test_initialisesWithNonEmptySet_withCustomInit {
    NSMutableSet* set = [[FunkyNSMutableSetSubclass alloc] initWithSet:[NSSet setWithObject:@0]];
    XCTAssertNotNil(set);
}

- (void)test_initialisesAsEmpty_withBuiltInNew {
    NSMutableSet* set = [FunkyNSMutableSetSubclass new];
    XCTAssertNotNil(set);
}

- (void)test_initialisesAsEmpty_withBuiltInInit {
    NSMutableSet* set = [[FunkyNSMutableSetSubclass alloc] init];
    XCTAssertNotNil(set);
}

- (void)test_initialisesWithEmptySet_withBuiltInInit {
    id nilValue = nil;
    NSMutableSet* set = [[FunkyNSMutableSetSubclass alloc] initWithObjects:nilValue, nil];
    XCTAssertNotNil(set);
}

- (void)test_initialisesWithNonEmptySet_withBuiltInInit {
    NSMutableSet* set = [[FunkyNSMutableSetSubclass alloc] initWithObjects:@0, @1, nil];
    XCTAssertNotNil(set);
}

#pragma mark - Init with Constructor

- (void)test_initialisesWithConstructor_asEmpty {
    NSMutableSet* set = [FunkyNSMutableSetSubclass set];
    XCTAssertNotNil(set);
}

- (void)test_initialisesWithConstructor_withObject {
    NSMutableSet* set = [FunkyNSMutableSetSubclass setWithObject:@1];
    XCTAssertNotNil(set);
}

- (void)test_initialisesWithConstructor_withObjects {
    NSMutableSet* set = [FunkyNSMutableSetSubclass setWithObjects:@0, nil];
    XCTAssertNotNil(set);
}

- (void)test_initialisesWithConstructor_withSet {
    NSMutableSet* set = [FunkyNSMutableSetSubclass setWithSet:[NSSet setWithObject:@0]];
    XCTAssertNotNil(set);
}

- (void)test_initialisesWithConstructor_withCapacity {
    NSMutableSet* set = [[FunkyNSMutableSetSubclass alloc] initWithCapacity:15];
    XCTAssertNotNil(set);
}

#pragma mark - count

- (void)test_withZeroElements_hasCorrectCount {
    NSMutableSet* set = [[FunkyNSMutableSetSubclass alloc] initWithSet:[NSSet set]];
    XCTAssertEqual(set.count, 0);
}

- (void)test_withOneElement_hasCorrectCount {
    NSMutableSet* set = [[FunkyNSMutableSetSubclass alloc] initWithSet:[NSSet setWithObject:@0]];
    XCTAssertEqual(set.count, 1);
}

- (void)test_withMultipleElements_hasCorrectCount {
    NSMutableSet* set = [[FunkyNSMutableSetSubclass alloc] initWithSet:[NSSet setWithArray:@[@0, @1, @2]]];
    XCTAssertEqual(set.count, 3);
}

- (void)test_withConstructor_hasCorrectCount {
    NSMutableSet* set = [FunkyNSMutableSetSubclass setWithObjects:@1, @2, nil];
    XCTAssertEqual(set.count, 2);
}

#pragma mark - member

- (void)test_validMember {
    NSSet* set = [[FunkyNSMutableSetSubclass alloc] initWithSet:[NSSet setWithArray:@[@0, @1, @2]]];
    XCTAssertNotNil([set member:@0]);
}

- (void)test_invalidMember {
    NSSet* set = [[FunkyNSMutableSetSubclass alloc] initWithSet:[NSSet setWithArray:@[@0, @1, @2]]];
    XCTAssertNil([set member:@3]);
}

#pragma mark - setByAddingObject

- (void)test_emptySet_additionIncrementsCount {
    NSMutableSet* set = [[FunkyNSMutableSetSubclass alloc] init];
    NSSet* newSet = [set setByAddingObject:@3];
    XCTAssertEqual(set.count + 1, newSet.count);
}

- (void)test_nonEmptySet_additionIncrementsCount {
    NSMutableSet* set = [[FunkyNSMutableSetSubclass alloc] initWithSet:[NSSet setWithArray:@[@0, @1, @2]]];
    NSSet* newSet = [set setByAddingObject:@3];
    XCTAssertEqual(set.count + 1, newSet.count);
}

#pragma mark - containsObject

- (void)test_containsObject_findsElement {
    NSMutableSet* set = [[FunkyNSMutableSetSubclass alloc] initWithSet:[NSSet setWithArray:@[@0, @1]]];
    XCTAssertTrue([set containsObject:@0]);
}

- (void)test_containsObject_doesNotFindUnexistingElement {
    NSMutableSet* set = [[FunkyNSMutableSetSubclass alloc] initWithSet:[NSSet setWithArray:@[@0, @1]]];
    XCTAssertFalse([set containsObject:@3]);
}

#pragma mark - equality

- (void)test_equality_positive {
    NSMutableSet* set = [[FunkyNSMutableSetSubclass alloc] initWithSet:[NSSet setWithArray:@[@0, @1]]];
    NSSet* other = [NSSet setWithArray:@[@0, @1]];
    XCTAssertTrue([set isEqualToSet:other]);
}

- (void)test_equality_negative {
    NSMutableSet* set = [[FunkyNSMutableSetSubclass alloc] initWithSet:[NSSet setWithArray:@[@0, @1]]];
    NSSet* other = [NSSet setWithArray:@[@0, @2]];
    XCTAssertFalse([set isEqualToSet:other]);
}

#pragma mark - nil

- (void)test_addingNil_throwsException {
    @try {
        NSNumber* nilValue = nil;
        [FunkyNSSetSubclass setWithObject:nilValue];
        XCTAssertTrue(NO);
    } @catch (NSException *exception) {
        XCTAssertTrue(YES);
    }
}

#pragma mark - Encoding

- (void)test_coder {
    NSMutableSet* set = [FunkyNSMutableSetSubclass setWithSet:[NSSet setWithArray:@[@0, @1, @2]]];
    
    NSData* archived = [NSKeyedArchiver archivedDataWithRootObject:set];
    XCTAssertNotNil(archived);
    
    NSSet* unarchived = [NSKeyedUnarchiver unarchiveObjectWithData:archived];
    XCTAssertEqualObjects(set, unarchived);
}

#pragma mark - copy

- (void)test_copy {
    NSMutableSet* set = [FunkyNSMutableSetSubclass new];
    id copied = [set copy];
    XCTAssertNotNil(copied);
    XCTAssertFalse([copied isKindOfClass:[NSMutableSet class]]);
    XCTAssertTrue([copied isKindOfClass:[NSSet class]]);
    
    NSSet* mutable = [FunkyNSMutableSetSubclass new];
    copied = [mutable copy];
    XCTAssertNotNil(copied);
    XCTAssertFalse([copied isKindOfClass:[NSMutableSet class]]);
    XCTAssertTrue([copied isKindOfClass:[NSSet class]]);
}

#pragma mark - mutableCopy

- (void)test_mutableCopy {
    NSMutableSet* set = [FunkyNSMutableSetSubclass new];
    id copied = [set mutableCopy];
    XCTAssertNotNil(copied);
    XCTAssertTrue([copied isKindOfClass:[NSMutableSet class]]);
    XCTAssertTrue([copied isKindOfClass:[NSSet class]]);
    
    NSSet* mutable = [FunkyNSMutableSetSubclass new];
    copied = [mutable mutableCopy];
    XCTAssertNotNil(copied);
    XCTAssertTrue([copied isKindOfClass:[NSMutableSet class]]);
    XCTAssertTrue([copied isKindOfClass:[NSSet class]]);
}

#pragma mark - NSSet

- (void)test_NSMutableSet {
    FunkyNSMutableSetSubclass* set = [FunkyNSMutableSetSubclass setWithSet:[NSSet setWithArray:@[@0, @1, @2]]];
    NSSet* normal = [set NSMutableSet];
    XCTAssertTrue([normal isKindOfClass:[NSSet class]]);
    XCTAssertFalse([normal isKindOfClass:[FunkyNSMutableSetSubclass class]]);
    XCTAssertEqualObjects(set, normal);
}

#pragma mark - Overriden methods

- (void)test_addObject
{
    NSMutableSet* set = [FunkyNSMutableSetSubclass setWithSet:[NSSet setWithArray:@[@0, @1, @2]]];
    [set addObject:@3];
    NSSet* expected = [NSSet setWithArray:@[@0, @1, @2, @3]];
    XCTAssertEqualObjects(expected, set);
}

- (void)test_removeLastObject
{
    NSMutableSet* set = [FunkyNSMutableSetSubclass setWithSet:[NSSet setWithArray:@[@0, @1, @2]]];
    [set removeObject:@2];
    NSSet* expected = [NSSet setWithArray:@[@0, @1]];
    XCTAssertEqualObjects(expected, set);
}

#pragma mark - initWithCoder

- (void)test_initWithCoder {
    NSMutableData* data = [NSMutableData data];
    NSCoder* coder = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    NSSet* set = [[FunkyNSMutableSetSubclass alloc] initWithCoder:coder];
    XCTAssertNotNil(set);
}

@end
