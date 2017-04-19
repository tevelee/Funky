//
//  FunkySetCoreTests.m
//  Funky
//
//  Created by László Teveli on 2017. 04. 19..
//  Copyright © 2017. tevelee. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Funky/NSSet+FunkyCore.h>

@interface FunkySetCoreTests : XCTestCase

@end

@implementation FunkySetCoreTests

- (void)test_utilities
{
    id utils = [[NSSet set] utilities];
    XCTAssertTrue([utils isKindOfClass:[FunkySetUtilities class]]);
}

- (void)test_classMutable
{
    Class class = [NSSet classForMutableCounterPart];
    XCTAssertEqualObjects(class, [NSMutableSet class]);
}

- (void)test_classImmutable
{
    Class class = [NSSet classForImmutableCounterPart];
    XCTAssertEqualObjects(class, [NSSet class]);
}

- (void)test_classFlatten
{
    Class class = [NSSet classToFlatten];
    XCTAssertEqual(class, [NSSet class]);
}

- (void)test_mutable_utilities
{
    id utils = [[NSMutableSet set] utilities];
    XCTAssertTrue([utils isKindOfClass:[FunkyMutableSetUtilities class]]);
}

- (void)test_mutable_new
{
    id instance = [NSMutableSet newWithCapacity:5];
    XCTAssertNotNil(instance);
}

@end
