//
//  FunkyNilTolerantNSSetTests.m
//  Funky
//
//  Created by László Teveli on 2017. 04. 07..
//  Copyright © 2017. tevelee. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Funky/FunkyNilTolerantNSSet.h>
#import <Funky/NSSet+FunkyCore.h>

@interface FunkyNilTolerantNSSetTests : XCTestCase

@end

@implementation FunkyNilTolerantNSSetTests

- (void)test_nilTolerant_extension
{
    NSSet* set = [NSSet set];
    id nilTolerant = set.nilTolerant;
    XCTAssertTrue([nilTolerant isKindOfClass:[FunkyNilTolerantNSSet class]]);
    XCTAssertNotEqual([nilTolerant class], [set class]);
    
    id normal = [nilTolerant NSSet];
    XCTAssertFalse([normal isKindOfClass:[FunkyNilTolerantNSSet class]]);
    XCTAssertTrue([nilTolerant isKindOfClass:[NSSet class]]);
}

- (void)test_nilTolerant_constructor
{
    NSSet* nilTolerant = [NSSet nilTolerantSet];
    XCTAssertTrue([nilTolerant isKindOfClass:[FunkyNilTolerantNSSet class]]);
    XCTAssertNotEqual([nilTolerant class], [NSSet class]);
}

- (void)test_nilTolerant_mutable_constructor
{
    NSSet* nilTolerant = [NSMutableSet nilTolerantSet];
    XCTAssertTrue([nilTolerant isKindOfClass:[FunkyNilTolerantNSMutableSet class]]);
    XCTAssertNotEqual([nilTolerant class], [NSSet class]);
    XCTAssertNotEqual([nilTolerant class], [NSMutableSet class]);
    
    nilTolerant = [NSMutableSet nilTolerantSetWithCapacity:2];
    XCTAssertTrue([nilTolerant isKindOfClass:[FunkyNilTolerantNSMutableSet class]]);
    XCTAssertNotEqual([nilTolerant class], [NSSet class]);
    XCTAssertNotEqual([nilTolerant class], [NSMutableSet class]);
}

- (void)test_setByAddingObject
{
    NSSet* set = [[NSSet set].nilTolerant setByAddingObject:@2];
    XCTAssertEqual(set.count, 1);
    
    id nilValue = nil;
    set = [[NSSet set].nilTolerant setByAddingObject:nilValue];
    XCTAssertEqual(set.count, 0);
}

- (void)test_setWithObject
{
    NSSet* set = [FunkyNilTolerantNSSet setWithObject:@2];
    XCTAssertEqual(set.count, 1);
    
    id nilValue = nil;
    set = [FunkyNilTolerantNSSet setWithObject:nilValue];
    XCTAssertEqual(set.count, 0);
}

- (void)test_setWithSet
{
    NSSet* original = [NSSet setWithObject:@"1"];
    NSSet* set = [NSSet nilTolerantSetWithSet:original];
    XCTAssertEqualObjects(set, original);
    
    set = [NSMutableSet nilTolerantSetWithSet:original];
    XCTAssertEqualObjects(set, original);
}

- (void)test_mutable_setWithObject
{
    id nilValue = nil;
    NSSet* set = [FunkyNilTolerantNSMutableSet setWithObject:nilValue];
    XCTAssertEqual(set.count, 0);
    
    set = [FunkyNilTolerantNSMutableSet setWithObject:@2];
    XCTAssertEqual(set.count, 1);
}

- (void)test_mutable_setByAddingObject
{
    id nilValue = nil;
    NSSet* set = [[FunkyNilTolerantNSMutableSet set] setByAddingObject:nilValue];
    XCTAssertEqual(set.count, 0);
    
    set = [[FunkyNilTolerantNSSet set] setByAddingObject:@2];
    XCTAssertEqual(set.count, 1);
}

- (void)test_contains_setByAddingObject
{
    id nilValue = nil;
    NSSet* set = [[FunkyNilTolerantNSSet set] setByAddingObject:nilValue];
    XCTAssertFalse([set containsObject:nilValue]);
    
    set = [[FunkyNilTolerantNSMutableSet set] setByAddingObject:nilValue];
    XCTAssertFalse([set containsObject:nilValue]);
}

- (void)test_mutable_add
{
    NSSet* nilValue = nil;
    NSSet* original = [NSSet setWithArray:@[@1, @2]];
    NSMutableSet* set = original.mutableCopy;
    set = [set nilTolerant];
    [set addObject:nilValue];
    XCTAssertEqualObjects(set, original);
    
    set = original.nilTolerant.mutableCopy;
    [set addObject:@3];
    NSSet* expected = [NSSet setWithArray:@[@1, @2, @3]];
    XCTAssertEqualObjects(set, expected);
}

- (void)test_addNilSet_doesNotThrow
{
    NSSet* nilValue = nil;
    NSSet* set = [[NSSet set] setByAddingObjectsFromSet:nilValue];
    XCTAssertEqual(set.count, 0);
}

- (void)test_removeObject
{
    NSSet* nilValue = nil;
    NSSet* set = [FunkyNilTolerantNSSet setWithObject:@1];
    XCTAssertEqual(set.count, 1);
    
    NSMutableSet* removed = set.mutableCopy;
    [removed removeObject:@1];
    XCTAssertEqual(removed.count, 0);
    
    removed = set.mutableCopy;
    [removed removeObject:nilValue];
    XCTAssertEqual(removed.count, 1);
}

- (void)test_containsObject_doesNotThrow
{
    NSSet* nilValue = nil;
    BOOL contains = [@[] containsObject:nilValue];
    XCTAssertFalse(contains);
}

- (void)test_copy
{
    NSSet* set = [NSSet setWithArray:@[@1, @2, @3]].nilTolerant;
    id copy = [set copy];
    XCTAssertTrue([copy isKindOfClass:[FunkyNilTolerantNSSet class]]);
    
    id mutableCopy = [set mutableCopy];
    XCTAssertTrue([mutableCopy isKindOfClass:[FunkyNilTolerantNSMutableSet class]]);
    
    id copyOfMutable = [mutableCopy copy];
    XCTAssertTrue([copyOfMutable isKindOfClass:[FunkyNilTolerantNSSet class]]);
    
    id mutableCopyOfMutable = [mutableCopy mutableCopy];
    XCTAssertTrue([mutableCopyOfMutable isKindOfClass:[FunkyNilTolerantNSMutableSet class]]);
}

- (void)test_mutable
{
    Class class = [FunkyNilTolerantNSSet classForMutableCounterPart];
    XCTAssertEqualObjects(class, [FunkyNilTolerantNSMutableSet class]);
    
    class = [FunkyNilTolerantNSMutableSet classForMutableCounterPart];
    XCTAssertEqualObjects(class, [FunkyNilTolerantNSMutableSet class]);
}

- (void)test_immutable
{
    Class class = [FunkyNilTolerantNSSet classForImmutableCounterPart];
    XCTAssertEqualObjects(class, [FunkyNilTolerantNSSet class]);
    
    class = [FunkyNilTolerantNSMutableSet classForImmutableCounterPart];
    XCTAssertEqualObjects(class, [FunkyNilTolerantNSSet class]);
}

- (void)test_flatten
{
    Class class = [FunkyNilTolerantNSSet classToFlatten];
    XCTAssertEqualObjects(class, [NSSet class]);
    
    class = [FunkyNilTolerantNSMutableSet classToFlatten];
    XCTAssertEqualObjects(class, [NSSet class]);
}

@end
