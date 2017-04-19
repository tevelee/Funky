//
//  FunkyNilTolerantNSDictionaryTests.m
//  Funky
//
//  Created by László Teveli on 2017. 04. 08..
//  Copyright © 2017. tevelee. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Funky/FunkyNilTolerantNSDictionary.h>
#import <Funky/NSDictionary+FunkyCore.h>

@interface FunkyNilTolerantNSDictionaryTests : XCTestCase

@end

@implementation FunkyNilTolerantNSDictionaryTests

- (void)test_nilTolerant_extension
{
    NSDictionary* dictionary = @{};
    id nilTolerant = dictionary.nilTolerant;
    XCTAssertTrue([nilTolerant isKindOfClass:[FunkyNilTolerantNSDictionary class]]);
    XCTAssertNotEqual([nilTolerant class], [dictionary class]);
    
    id normal = [nilTolerant NSDictionary];
    XCTAssertFalse([normal isKindOfClass:[FunkyNilTolerantNSDictionary class]]);
    XCTAssertTrue([nilTolerant isKindOfClass:[NSDictionary class]]);
}

- (void)test_dictionaryWithObject
{
    NSDictionary* dictionary = [FunkyNilTolerantNSDictionary dictionaryWithObject:@2 forKey:@2];
    XCTAssertEqual(dictionary.count, 1);
    
    id nilValue = nil;
    dictionary = [FunkyNilTolerantNSDictionary dictionaryWithObject:nilValue forKey:nilValue];
    XCTAssertEqual(dictionary.count, 0);
}

- (void)test_mutable_dictionaryWithObject
{
    id nilValue = nil;
    NSDictionary* dictionary = [FunkyNilTolerantNSMutableDictionary dictionaryWithObject:nilValue forKey:nilValue];
    XCTAssertEqual(dictionary.count, 0);
    
    dictionary = [FunkyNilTolerantNSMutableDictionary dictionaryWithObject:@2 forKey:@2];
    XCTAssertEqual(dictionary.count, 1);
}

- (void)test_mutable_add
{
    NSDictionary* nilValue = nil;
    NSDictionary* original = @{@1: @1, @2: @2};
    NSMutableDictionary* dictionary = original.mutableCopy;
    dictionary = [dictionary nilTolerant];
    [dictionary setObject:nilValue forKey:nilValue];
    XCTAssertEqualObjects(dictionary, original);
    
    dictionary = original.mutableCopy;
    dictionary = [dictionary nilTolerant];
    [dictionary setObject:nilValue forKey:@1];
    XCTAssertEqualObjects(dictionary, original);
    
    dictionary = original.mutableCopy;
    dictionary = [dictionary nilTolerant];
    [dictionary setObject:@1 forKey:nilValue];
    XCTAssertEqualObjects(dictionary, original);
    
    dictionary = original.mutableCopy;
    dictionary = [dictionary nilTolerant];
    [dictionary setObject:@3 forKey:@3];
    NSDictionary* expected = @{@1: @1, @2: @2, @3: @3};
    XCTAssertEqualObjects(dictionary, expected);
}

- (void)test_objectForKey_doesNotThrow
{
    NSDictionary* nilValue = nil;
    BOOL contains = [@{} objectForKey:nilValue] != nil;
    XCTAssertFalse(contains);
}

- (void)test_addEntriesFromDictionary_doesNotThrow
{
    NSDictionary* nilValue = nil;
    NSMutableDictionary* dictionary = [FunkyNilTolerantNSMutableDictionary dictionaryWithObject:@1 forKey:@1];
    [dictionary addEntriesFromDictionary:nilValue];
    XCTAssertEqual(dictionary.count, 1);
}

- (void)test_copy
{
    NSDictionary* dictionary = @{@1: @1, @2: @2, @3: @3}.nilTolerant;
    id copy = [dictionary copy];
    XCTAssertTrue([copy isKindOfClass:[FunkyNilTolerantNSDictionary class]]);
    
    id mutableCopy = [dictionary mutableCopy];
    XCTAssertTrue([mutableCopy isKindOfClass:[FunkyNilTolerantNSMutableDictionary class]]);
    
    id copyOfMutable = [mutableCopy copy];
    XCTAssertTrue([copyOfMutable isKindOfClass:[FunkyNilTolerantNSDictionary class]]);
    
    id mutableCopyOfMutable = [mutableCopy mutableCopy];
    XCTAssertTrue([mutableCopyOfMutable isKindOfClass:[FunkyNilTolerantNSMutableDictionary class]]);
}

- (void)test_mutable
{
    Class class = [FunkyNilTolerantNSDictionary classForMutableCounterPart];
    XCTAssertEqualObjects(class, [FunkyNilTolerantNSMutableDictionary class]);
    
    class = [FunkyNilTolerantNSMutableDictionary classForMutableCounterPart];
    XCTAssertEqualObjects(class, [FunkyNilTolerantNSMutableDictionary class]);
}

- (void)test_immutable
{
    Class class = [FunkyNilTolerantNSDictionary classForImmutableCounterPart];
    XCTAssertEqualObjects(class, [FunkyNilTolerantNSDictionary class]);
    
    class = [FunkyNilTolerantNSMutableDictionary classForImmutableCounterPart];
    XCTAssertEqualObjects(class, [FunkyNilTolerantNSDictionary class]);
}

- (void)test_flatten
{
    Class class = [FunkyNilTolerantNSDictionary classToFlatten];
    XCTAssertEqualObjects(class, [NSDictionary class]);
    
    class = [FunkyNilTolerantNSMutableDictionary classToFlatten];
    XCTAssertEqualObjects(class, [NSDictionary class]);
}

@end
