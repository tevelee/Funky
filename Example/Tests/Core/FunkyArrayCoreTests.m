//
//  FunkyArrayCoreTests.m
//  Funky
//
//  Created by László Teveli on 2017. 04. 19..
//  Copyright © 2017. tevelee. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Funky/NSArray+FunkyCore.h>

@interface FunkyArrayCoreTests : XCTestCase

@end

@implementation FunkyArrayCoreTests

- (void)test_utilities
{
    id utils = [@[@1, @2, @3] utilities];
    XCTAssertTrue([utils isKindOfClass:[FunkyArrayUtilities class]]);
}

- (void)test_classMutable
{
    Class class = [NSArray classForMutableCounterPart];
    XCTAssertEqualObjects(class, [NSMutableArray class]);
}

- (void)test_classImmutable
{
    Class class = [NSArray classForImmutableCounterPart];
    XCTAssertEqualObjects(class, [NSArray class]);
}

- (void)test_classFlatten
{
    Class class = [NSArray classToFlatten];
    XCTAssertEqual(class, [NSArray class]);
}

- (void)test_mutable_utilities
{
    id utils = [[@[@1, @2, @3] mutableCopy] utilities];
    XCTAssertTrue([utils isKindOfClass:[FunkyMutableArrayUtilities class]]);
}

- (void)test_mutable_new
{
    id instance = [NSMutableArray newWithCapacity:5];
    XCTAssertNotNil(instance);
}

@end
