//
//  FunkyPairTests.m
//  Funky
//
//  Created by László Teveli on 2017. 04. 19..
//  Copyright © 2017. tevelee. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Funky/FunkyPair.h>

@interface FunkyPairTests : XCTestCase

@end

@implementation FunkyPairTests

- (void)test_init {
    FunkyPair* pair = [FunkyPair pairWithKey:@"a" value:@"b"];
    XCTAssertNotNil(pair);
    XCTAssertEqualObjects(pair.key, @"a");
    XCTAssertEqualObjects(pair.value, @"b");
}

- (void)test_modifyingKey {
    FunkyPair* pair = [FunkyPair pairWithKey:@"a" value:@"b"];
    FunkyPair* newPair = [pair pairByModifyingKey:@"c"];
    XCTAssertEqualObjects(newPair.key, @"c");
    XCTAssertEqualObjects(pair.key, @"a");
}

- (void)test_modifyingValue {
    FunkyPair* pair = [FunkyPair pairWithKey:@"a" value:@"b"];
    FunkyPair* newPair = [pair pairByModifyingValue:@"c"];
    XCTAssertEqualObjects(newPair.value, @"c");
    XCTAssertEqualObjects(pair.value, @"b");
}

@end
