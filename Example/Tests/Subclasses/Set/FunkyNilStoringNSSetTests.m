//
//  FunkyNilStoringNSSetTests.m
//  Funky
//
//  Created by László Teveli on 2017. 04. 07..
//  Copyright © 2017. tevelee. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Funky/FunkyNilStoringNSSet.h>

@interface FunkyNilStoringNSSetTests : XCTestCase

@end

@implementation FunkyNilStoringNSSetTests

- (void)test_nilStoring_extension
{
    NSSet* set = [NSSet setWithArray:@[]];
    id nilStoring = set.nilStoring;
    XCTAssertTrue([nilStoring isKindOfClass:[FunkyNilStoringNSSet class]]);
    XCTAssertNotEqual([nilStoring class], [set class]);
    
    id normal = [nilStoring NSSet];
    XCTAssertFalse([normal isKindOfClass:[FunkyNilStoringNSSet class]]);
    XCTAssertTrue([nilStoring isKindOfClass:[NSSet class]]);
}

- (void)test_setByAddingObject
{
    NSSet* set = [[NSSet setWithArray:@[]].nilStoring setByAddingObject:@2];
    XCTAssertEqual(set.count, 1);
    
    id nilValue = nil;
    set = [[NSSet setWithArray:@[]].nilStoring setByAddingObject:nilValue];
    XCTAssertEqual(set.count, 1);
    XCTAssertNil(set.anyObject);
}

- (void)test_setWithObject
{
    NSSet* set = [FunkyNilStoringNSSet setWithObject:@2];
    XCTAssertTrue([set member:@2]);
}

- (void)test_member
{
    NSSet* set = [FunkyNilStoringNSSet setWithObject:@2];
    XCTAssertEqual(set.count, 1);
    
    id nilValue = nil;
    set = [FunkyNilStoringNSSet setWithObject:nilValue];
    XCTAssertEqual(set.count, 1);
    XCTAssertNil(set.anyObject);
}

- (void)test_mutable_setWithObject
{
    id nilValue = nil;
    NSSet* set = [FunkyNilStoringNSMutableSet setWithObject:nilValue];
    XCTAssertEqual(set.count, 1);
    XCTAssertNil(set.anyObject);
    
    set = [FunkyNilStoringNSMutableSet setWithObject:@2];
    XCTAssertEqual(set.count, 1);
}

- (void)test_mutable_setByAddingObject
{
    id nilValue = nil;
    NSSet* set = [[[NSSet setWithArray:@[]].mutableCopy nilStoring] setByAddingObject:nilValue];
    XCTAssertEqual(set.count, 1);
    XCTAssertNil(set.anyObject);
    
    set = [[[NSSet setWithArray:@[]].mutableCopy nilStoring] setByAddingObject:@2];
    XCTAssertEqual(set.count, 1);
}

- (void)test_mutable_add
{
    NSSet* nilValue = nil;
    NSSet* original = [NSSet setWithArray:@[@1, @2]];
    NSMutableSet* set = original.mutableCopy;
    set = [set nilStoring];
    [set addObject:nilValue];
    XCTAssertEqual(set.count, original.count + 1);
    XCTAssertTrue([set containsObject:nilValue]);
    
    set = original.mutableCopy;
    [set addObject:@3];
    NSSet* expected = [NSSet setWithArray:@[@1, @2, @3]];
    XCTAssertEqualObjects(set, expected);
}

- (void)test_addNilSet_doesNotThrow
{
    NSSet* nilValue = nil;
    NSSet* set = [[NSSet setWithArray:@[]] setByAddingObjectsFromSet:nilValue];
    XCTAssertEqual(set.count, 0);
}

- (void)test_containsObject_doesNotThrow
{
    NSSet* nilValue = nil;
    BOOL contains = [[NSSet setWithArray:@[]].nilStoring containsObject:nilValue];
    XCTAssertFalse(contains);
}

- (void)test_containsObject_nil
{
    NSSet* nilValue = nil;
    NSSet* set = [FunkyNilStoringNSMutableSet setWithObject:nilValue];
    BOOL contains = [set containsObject:nilValue];
    XCTAssertTrue(contains);
}

- (void)test_copy
{
    NSSet* set = [NSSet setWithArray:@[@1, @2, @3]].nilStoring;
    id copy = [set copy];
    XCTAssertTrue([copy isKindOfClass:[FunkyNilStoringNSSet class]]);
    
    id mutableCopy = [set mutableCopy];
    XCTAssertTrue([mutableCopy isKindOfClass:[FunkyNilStoringNSMutableSet class]]);
    
    id copyOfMutable = [mutableCopy copy];
    XCTAssertTrue([copyOfMutable isKindOfClass:[FunkyNilStoringNSSet class]]);
    
    id mutableCopyOfMutable = [mutableCopy mutableCopy];
    XCTAssertTrue([mutableCopyOfMutable isKindOfClass:[FunkyNilStoringNSMutableSet class]]);
}

@end
