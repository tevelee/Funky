//
//  FunkyNSSetSubclassTests.m
//  Funky
//
//  Created by László Teveli on 2017. 04. 08..
//  Copyright © 2017. tevelee. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Funky/FunkyNSSetSubclass.h>
#import <Funky/FunkyNSMutableSetSubclass.h>

@interface FunkyNSSetSubclassTests : XCTestCase

@end

@implementation FunkyNSSetSubclassTests

#pragma mark - init

- (void)test_initialisesWithEmptySet_withCustomInit {
    NSSet* set = [[FunkyNSSetSubclass alloc] initWithSet:[NSSet set]];
    XCTAssertNotNil(set);
}

- (void)test_initialisesWithNonEmptySet_withCustomInit {
    NSSet* set = [[FunkyNSSetSubclass alloc] initWithSet:[NSSet setWithObject:@0]];
    XCTAssertNotNil(set);
}

- (void)test_initialisesAsEmpty_withBuiltInNew {
    NSSet* set = [FunkyNSSetSubclass new];
    XCTAssertNotNil(set);
}

- (void)test_initialisesAsEmpty_withBuiltInInit {
    NSSet* set = [[FunkyNSSetSubclass alloc] init];
    XCTAssertNotNil(set);
}

- (void)test_initialisesWithEmptySet_withBuiltInInit {
    id nilValue = nil;
    NSSet* set = [[FunkyNSSetSubclass alloc] initWithObjects:nilValue, nil];
    XCTAssertNotNil(set);
}

- (void)test_initialisesWithNonEmptySet_withBuiltInInit {
    NSSet* set = [[FunkyNSSetSubclass alloc] initWithObjects:@0, @1, nil];
    XCTAssertNotNil(set);
}

#pragma mark - Init with Constructor

- (void)test_initialisesWithConstructor_asEmpty {
    NSSet* set = [FunkyNSSetSubclass set];
    XCTAssertNotNil(set);
}

- (void)test_initialisesWithConstructor_withObject {
    NSSet* set = [FunkyNSSetSubclass setWithObject:@1];
    XCTAssertNotNil(set);
}

- (void)test_initialisesWithConstructor_withObjects {
    NSSet* set = [FunkyNSSetSubclass setWithObjects:@0, nil];
    XCTAssertNotNil(set);
}

- (void)test_initialisesWithConstructor_withSet {
    NSSet* set = [FunkyNSSetSubclass setWithSet:[NSSet setWithObject:@0]];
    XCTAssertNotNil(set);
}

#pragma mark - count

- (void)test_withZeroElements_hasCorrectCount {
    NSSet* set = [[FunkyNSSetSubclass alloc] initWithSet:[NSSet set]];
    XCTAssertEqual(set.count, 0);
}

- (void)test_withOneElement_hasCorrectCount {
    NSSet* set = [[FunkyNSSetSubclass alloc] initWithSet:[NSSet setWithObject:@0]];
    XCTAssertEqual(set.count, 1);
}

- (void)test_withMultipleElements_hasCorrectCount {
    NSSet* set = [[FunkyNSSetSubclass alloc] initWithSet:[NSSet setWithArray:@[@0, @1, @2]]];
    XCTAssertEqual(set.count, 3);
}

- (void)test_withConstructor_hasCorrectCount {
    NSSet* set = [FunkyNSSetSubclass setWithObjects:@1, @2, nil];
    XCTAssertEqual(set.count, 2);
}

#pragma mark - member

- (void)test_validMember {
    NSSet* set = [[FunkyNSSetSubclass alloc] initWithSet:[NSSet setWithArray:@[@0, @1, @2]]];
    XCTAssertNotNil([set member:@0]);
}

- (void)test_invalidMember {
    NSSet* set = [[FunkyNSSetSubclass alloc] initWithSet:[NSSet setWithArray:@[@0, @1, @2]]];
    XCTAssertNil([set member:@3]);
}

#pragma mark - setByAddingObject

- (void)test_emptySet_additionIncrementsCount {
    NSSet* set = [[FunkyNSSetSubclass alloc] init];
    NSSet* newSet = [set setByAddingObject:@3];
    XCTAssertEqual(set.count + 1, newSet.count);
}

- (void)test_nonEmptySet_additionIncrementsCount {
    NSSet* set = [[FunkyNSSetSubclass alloc] initWithSet:[NSSet setWithArray:@[@0, @1, @2]]];
    NSSet* newSet = [set setByAddingObject:@3];
    XCTAssertEqual(set.count + 1, newSet.count);
}

#pragma mark - containsObject

- (void)test_containsObject_findsElement {
    NSSet* set = [[FunkyNSSetSubclass alloc] initWithSet:[NSSet setWithArray:@[@0, @1]]];
    XCTAssertTrue([set containsObject:@0]);
}

- (void)test_containsObject_doesNotFindUnexistingElement {
    NSSet* set = [[FunkyNSSetSubclass alloc] initWithSet:[NSSet setWithArray:@[@0, @1]]];
    XCTAssertFalse([set containsObject:@3]);
}

#pragma mark - equality

- (void)test_equality_positive {
    NSSet* set = [[FunkyNSSetSubclass alloc] initWithSet:[NSSet setWithArray:@[@0, @1]]];
    NSSet* other = [NSSet setWithArray:@[@0, @1]];
    XCTAssertTrue([set isEqualToSet:other]);
}

- (void)test_equality_negative {
    NSSet* set = [[FunkyNSSetSubclass alloc] initWithSet:[NSSet setWithArray:@[@0, @1]]];
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
    NSSet* set = [FunkyNSSetSubclass setWithSet:[NSSet setWithArray:@[@0, @1, @2]]];
    
    NSData* archived = [NSKeyedArchiver archivedDataWithRootObject:set];
    XCTAssertNotNil(archived);
    
    NSSet* unarchived = [NSKeyedUnarchiver unarchiveObjectWithData:archived];
    XCTAssertEqualObjects(set, unarchived);
}

#pragma mark - copy

- (void)test_copy {
    NSSet* set = [FunkyNSSetSubclass new];
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
    NSSet* set = [FunkyNSSetSubclass new];
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

- (void)test_NSSet {
    FunkyNSSetSubclass* set = [FunkyNSSetSubclass setWithSet:[NSSet setWithArray:@[@0, @1, @2]]];
    NSSet* normal = [set NSSet];
    XCTAssertTrue([normal isKindOfClass:[NSSet class]]);
    XCTAssertFalse([normal isKindOfClass:[FunkyNSSetSubclass class]]);
    XCTAssertEqualObjects(set, normal);
}

#pragma mark - initWithCoder

- (void)test_initWithCoder {
    NSMutableData* data = [NSMutableData data];
    NSCoder* coder = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    NSSet* set = [[FunkyNSSetSubclass alloc] initWithCoder:coder];
    XCTAssertNotNil(set);
}

@end
