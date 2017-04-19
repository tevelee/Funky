//
//  FunkyDictionaryCoreTests.m
//  Funky
//
//  Created by László Teveli on 2017. 04. 19..
//  Copyright © 2017. tevelee. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Funky/NSDictionary+FunkyCore.h>

@interface FunkyDictionaryCoreTests : XCTestCase

@end

@implementation FunkyDictionaryCoreTests

- (void)test_utilities
{
    id utils = [@{@1: @"1", @2: @"2"} utilities];
    XCTAssertTrue([utils isKindOfClass:[FunkyDictionaryUtilities class]]);
}

- (void)test_classMutable
{
    Class class = [NSDictionary classForMutableCounterPart];
    XCTAssertEqualObjects(class, [NSMutableDictionary class]);
}

- (void)test_classImmutable
{
    Class class = [NSDictionary classForImmutableCounterPart];
    XCTAssertEqualObjects(class, [NSDictionary class]);
}

- (void)test_classFlatten
{
    Class class = [NSDictionary classToFlatten];
    XCTAssertEqual(class, [NSDictionary class]);
}

- (void)test_mutable_utilities
{
    id utils = [[@{@1: @"1", @2: @"2"} mutableCopy] utilities];
    XCTAssertTrue([utils isKindOfClass:[FunkyMutableDictionaryUtilities class]]);
}

- (void)test_mutable_new
{
    id instance = [NSMutableDictionary newWithCapacity:5];
    XCTAssertNotNil(instance);
}

@end
