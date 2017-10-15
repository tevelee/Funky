//
//  FunkyNilStoringNSSetTests.m
//  Funky
//
//  Created by László Teveli on 2017. 04. 07..
//  Copyright © 2017. tevelee. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Funky/FunkyNilStoringNSSet.h>
#import <Funky/NSSet+FunkyCore.h>

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

- (void)test_nilStoring_constructor
{
    NSSet* nilStoring = [NSSet nilStoringSet];
    XCTAssertTrue([nilStoring isKindOfClass:[FunkyNilStoringNSSet class]]);
    XCTAssertNotEqual([nilStoring class], [NSSet class]);
}

- (void)test_mutable_constructor
{
    NSMutableSet* nilStoring = [NSMutableSet nilStoringSet];
    XCTAssertTrue([nilStoring isKindOfClass:[FunkyNilStoringNSMutableSet class]]);
    XCTAssertNotEqual([nilStoring class], [NSSet class]);
    XCTAssertNotEqual([nilStoring class], [NSMutableSet class]);
    
    nilStoring = [NSMutableSet nilStoringSetWithCapacity:2];
    XCTAssertTrue([nilStoring isKindOfClass:[FunkyNilStoringNSMutableSet class]]);
    XCTAssertNotEqual([nilStoring class], [NSSet class]);
    XCTAssertNotEqual([nilStoring class], [NSMutableSet class]);
}

- (void)test_storesNSNull
{
    NSSet* nilStoring = [NSSet setWithArray:@[[NSNull null]]].nilStoring;
    XCTAssertEqualObjects(nilStoring.anyObject, [NSNull null]);
    
    NSMutableSet* nilStoringMutable = [NSMutableSet nilStoringSet];
    [nilStoringMutable addObject:[NSNull null]];
    XCTAssertEqualObjects(nilStoringMutable.anyObject, [NSNull null]);
}

- (void)test_setByAddingObject
{
    NSSet* set = [[NSSet setWithArray:@[]].nilStoring setByAddingObject:@2];
    XCTAssertEqual(set.count, 1);
    
    id nilValue = nil;
    set = [[NSSet setWithArray:@[]].nilStoring setByAddingObject:nilValue];
    XCTAssertEqual(set.count, 1);
}

- (void)test_any
{
    NSSet* set = [[NSSet setWithArray:@[]].nilStoring setByAddingObject:@2];
    XCTAssertEqualObjects(set.anyObject, @2);
    
    id nilValue = nil;
    set = [[NSSet setWithArray:@[]].nilStoring setByAddingObject:nilValue];
    XCTAssertNil(set.anyObject);
    
    set = [[[NSSet setWithArray:@[]].nilStoring setByAddingObject:@2] mutableCopy];
    XCTAssertEqualObjects(set.anyObject, @2);
    
    set = [[[NSSet setWithArray:@[]].nilStoring setByAddingObject:nilValue] mutableCopy];
    XCTAssertNil(set.anyObject);
}

- (void)test_setWithObject
{
    NSSet* set = [NSSet nilStoringSetWithObject:@2];
    XCTAssertTrue([set member:@2]);
    
    id nilValue = nil;
    set = [NSSet nilStoringSetWithObject:nilValue];
    XCTAssertEqual(set.count, 1);
    XCTAssertNil(set.anyObject);
    
    NSMutableSet* mutable = [NSMutableSet nilStoringSetWithObject:@2];
    XCTAssertEqualObjects(mutable.anyObject, @2);
    
    mutable = [NSMutableSet nilStoringSetWithObject:nilValue];
    XCTAssertNil(mutable.anyObject);
    XCTAssertEqual(mutable.count, 1);
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

- (void)test_setWithSet
{
    NSSet* original = [NSSet setWithObject:@"1"];
    NSSet* set = [NSSet nilStoringSetWithSet:original];
    XCTAssertEqualObjects(set, original);
    
    set = [NSMutableSet nilStoringSetWithSet:original];
    XCTAssertEqualObjects(set, original);
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

- (void)test_mutable_remove
{
    NSSet* nilValue = nil;
    NSSet* original = [[FunkyNilStoringNSMutableSet setWithArray:@[@1, @2]] setByAddingObject:nilValue];
    NSMutableSet* set = original.mutableCopy;
    [set removeObject:nilValue];
    XCTAssertEqual(set.count, original.count - 1);
    XCTAssertFalse([set containsObject:nilValue]);
    
    set = original.mutableCopy;
    [set removeObject:@2];
    NSSet* expected = [[FunkyNilStoringNSSet setWithObject:@1] setByAddingObject:nilValue];
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

- (void)test_mutable
{
    Class class = [FunkyNilStoringNSSet classForMutableCounterPart];
    XCTAssertEqualObjects(class, [FunkyNilStoringNSMutableSet class]);
    
    class = [FunkyNilStoringNSMutableSet classForMutableCounterPart];
    XCTAssertEqualObjects(class, [FunkyNilStoringNSMutableSet class]);
}

- (void)test_immutable
{
    Class class = [FunkyNilStoringNSSet classForImmutableCounterPart];
    XCTAssertEqualObjects(class, [FunkyNilStoringNSSet class]);
    
    class = [FunkyNilStoringNSMutableSet classForImmutableCounterPart];
    XCTAssertEqualObjects(class, [FunkyNilStoringNSSet class]);
}

- (void)test_flatten
{
    Class class = [FunkyNilStoringNSSet classToFlatten];
    XCTAssertEqualObjects(class, [NSSet class]);
    
    class = [FunkyNilStoringNSMutableSet classToFlatten];
    XCTAssertEqualObjects(class, [NSSet class]);
}

@end
