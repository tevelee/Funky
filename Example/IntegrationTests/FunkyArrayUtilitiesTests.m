//
//  FunkyArrayUtilitiesTests.m
//  IntegrationTests
//
//  Created by László Teveli on 2017. 10. 15..
//  Copyright © 2017. tevelee. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Funky/NSArray+FunkyUtilities.h>
#import <Funky/NSArray+FunkyCore.h>

@interface FunkyArrayUtilitiesTests : XCTestCase

@end

@implementation FunkyArrayUtilitiesTests

- (void)test_filter {
    NSArray<NSNumber*>* array = @[@1, @2, @3];
    NSArray<NSNumber*>* result = [array filtered:^BOOL(NSNumber* item) {
        return item.integerValue > 2;
    }];
    XCTAssertEqual(result.count, 1);
    XCTAssertEqualObjects(result.firstObject, @3);
}

- (void)test_mutable_filter {
    NSMutableArray<NSNumber*>* array = @[@1, @2, @3].mutableCopy;
    NSArray<NSNumber*>* result = [array filtered:^BOOL(NSNumber* item) {
        return item.integerValue > 2;
    }];
    XCTAssertEqual(result.count, 1);
    XCTAssertEqualObjects(result.firstObject, @3);
}

- (void)test_mutable_new
{
    id instance = [NSMutableArray newWithCapacity:5];
    XCTAssertNotNil(instance);
}

@end
