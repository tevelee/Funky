//
//  FunkyNilStoringNSDictionaryTests.m
//  Funky
//
//  Created by László Teveli on 2017. 04. 08..
//  Copyright © 2017. tevelee. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Funky/FunkyNilStoringNSDictionary.h>
#import <Funky/NSDictionary+FunkyCore.h>

@interface FunkyNilStoringNSDictionaryTests : XCTestCase

@end

@implementation FunkyNilStoringNSDictionaryTests

- (void)test_nilStoring_extension
{
    NSDictionary* dictionary = @{};
    id nilStoring = dictionary.nilStoring;
    XCTAssertTrue([nilStoring isKindOfClass:[FunkyNilStoringNSDictionary class]]);
    XCTAssertNotEqual([nilStoring class], [dictionary class]);
    
    id normal = [nilStoring NSDictionary];
    XCTAssertFalse([normal isKindOfClass:[FunkyNilStoringNSDictionary class]]);
    XCTAssertTrue([nilStoring isKindOfClass:[NSDictionary class]]);
}

- (void)test_nilStoring_constructor
{
    NSDictionary* nilStoring = [NSDictionary nilStoringDictionary];
    XCTAssertTrue([nilStoring isKindOfClass:[FunkyNilStoringNSDictionary class]]);
    XCTAssertNotEqual([nilStoring class], [NSDictionary class]);
}

- (void)test_nilStoring_mutable_constructor
{
    NSDictionary* nilStoring = [NSMutableDictionary nilStoringDictionary];
    XCTAssertTrue([nilStoring isKindOfClass:[FunkyNilStoringNSMutableDictionary class]]);
    XCTAssertNotEqual([nilStoring class], [NSDictionary class]);
    XCTAssertNotEqual([nilStoring class], [NSMutableDictionary class]);
    
    nilStoring = [NSMutableDictionary nilStoringDictionaryWithCapacity:2];
    XCTAssertTrue([nilStoring isKindOfClass:[FunkyNilStoringNSMutableDictionary class]]);
    XCTAssertNotEqual([nilStoring class], [NSDictionary class]);
    XCTAssertNotEqual([nilStoring class], [NSMutableDictionary class]);
}

- (void)test_nilStoring_storesNSNull
{
    NSDictionary* nilStoring = @{@"": [NSNull null]}.nilStoring;
    XCTAssertEqualObjects(nilStoring[@""], [NSNull null]);
    
    id nilValue = nil;
    NSMutableDictionary* nilStoringMutable = [NSMutableDictionary nilStoringDictionary];
    [nilStoringMutable setObject:nilValue forKey:@"1"];
    [nilStoringMutable setObject:[NSNull null] forKey:@"2"];
    XCTAssertNil(nilStoringMutable[@"1"]);
    XCTAssertEqualObjects(nilStoringMutable[@"2"], [NSNull null]);
}

- (void)test_dictionaryWithObject
{
    NSDictionary* dictionary = [FunkyNilStoringNSDictionary dictionaryWithObject:@2 forKey:@2];
    XCTAssertEqual(dictionary.count, 1);
    
    id nilValue = nil;
    dictionary = [FunkyNilStoringNSDictionary dictionaryWithObject:@1 forKey:nilValue];
    XCTAssertEqual(dictionary.count, 1);
    XCTAssertEqualObjects([dictionary objectForKey:nilValue], @1);
    
    dictionary = [FunkyNilStoringNSDictionary dictionaryWithObject:nilValue forKey:@1];
    XCTAssertEqual(dictionary.count, 1);
    XCTAssertNil([dictionary objectForKey:@1]);
    
    dictionary = [FunkyNilStoringNSDictionary dictionaryWithObject:nilValue forKey:nilValue];
    XCTAssertEqual(dictionary.count, 1);
    XCTAssertNil([dictionary objectForKey:nilValue]);
}

- (void)test_mutable_dictionaryWithObject
{
    id nilValue = nil;
    NSDictionary* dictionary = [FunkyNilStoringNSMutableDictionary dictionaryWithObject:nilValue forKey:nilValue];
    XCTAssertEqual(dictionary.count, 1);
    XCTAssertNil([dictionary objectForKey:nilValue]);
    
    dictionary = [FunkyNilStoringNSMutableDictionary dictionaryWithObject:@2 forKey:@2];
    XCTAssertEqual(dictionary.count, 1);
}

- (void)test_mutable_add
{
    NSDictionary* nilValue = nil;
    NSDictionary* original = @{@1: @1, @2: @2};
    NSMutableDictionary* dictionary = original.mutableCopy;
    dictionary = [dictionary nilStoring];
    [dictionary setObject:nilValue forKey:nilValue];
    XCTAssertEqual(dictionary.count, original.count + 1);
    XCTAssertNil([dictionary objectForKey:nilValue]);
    
    dictionary = original.mutableCopy;
    [dictionary setObject:@3 forKey:@3];
    NSDictionary* expected = @{@1: @1, @2: @2, @3: @3};
    XCTAssertEqualObjects(dictionary, expected);
}

- (void)test_objectForKey
{
    id object = [@{@0: @0, @1: @1, @2: @2}.nilStoring objectForKey:@1];
    XCTAssertEqualObjects(object, @1);
    
    id nilValue = nil;
    object = [[FunkyNilStoringNSDictionary dictionaryWithObject:nilValue forKey:nilValue] objectForKey:nilValue];
    XCTAssertNil(object);
    
    object = [[FunkyNilStoringNSMutableDictionary dictionaryWithObject:nilValue forKey:nilValue] objectForKey:nilValue];
    XCTAssertNil(object);
}

- (void)test_containsObject_doesNotThrow
{
    NSDictionary* nilValue = nil;
    BOOL contains = [@{} objectForKey:nilValue] != nil;
    XCTAssertFalse(contains);
}

- (void)test_copy
{
    NSDictionary* dictionary = @{@1: @1, @2: @2, @3: @3}.nilStoring;
    id copy = [dictionary copy];
    XCTAssertTrue([copy isKindOfClass:[FunkyNilStoringNSDictionary class]]);
    
    id mutableCopy = [dictionary mutableCopy];
    XCTAssertTrue([mutableCopy isKindOfClass:[FunkyNilStoringNSMutableDictionary class]]);
    
    id copyOfMutable = [mutableCopy copy];
    XCTAssertTrue([copyOfMutable isKindOfClass:[FunkyNilStoringNSDictionary class]]);
    
    id mutableCopyOfMutable = [mutableCopy mutableCopy];
    XCTAssertTrue([mutableCopyOfMutable isKindOfClass:[FunkyNilStoringNSMutableDictionary class]]);
}

- (void)test_allKeysForObject_nilKeys
{
    id nilValue = nil;
    NSMutableDictionary* dictionary = [FunkyNilStoringNSMutableDictionary dictionaryWithObject:@0 forKey:nilValue];
    [dictionary setObject:@0 forKey:nilValue];
    [dictionary setObject:@3 forKey:@3];
    XCTAssertEqual([dictionary allKeysForObject:@0].count, 1);
    
    id copy = [dictionary copy];
    XCTAssertEqual([copy allKeysForObject:@0].count, 1);
}

- (void)test_mutable
{
    Class class = [FunkyNilStoringNSDictionary classForMutableCounterPart];
    XCTAssertEqualObjects(class, [FunkyNilStoringNSMutableDictionary class]);
    
    class = [FunkyNilStoringNSMutableDictionary classForMutableCounterPart];
    XCTAssertEqualObjects(class, [FunkyNilStoringNSMutableDictionary class]);
}

- (void)test_immutable
{
    Class class = [FunkyNilStoringNSDictionary classForImmutableCounterPart];
    XCTAssertEqualObjects(class, [FunkyNilStoringNSDictionary class]);
    
    class = [FunkyNilStoringNSMutableDictionary classForImmutableCounterPart];
    XCTAssertEqualObjects(class, [FunkyNilStoringNSDictionary class]);
}

- (void)test_flatten
{
    Class class = [FunkyNilStoringNSDictionary classToFlatten];
    XCTAssertEqualObjects(class, [NSDictionary class]);
    
    class = [FunkyNilStoringNSMutableDictionary classToFlatten];
    XCTAssertEqualObjects(class, [NSDictionary class]);
}

@end
