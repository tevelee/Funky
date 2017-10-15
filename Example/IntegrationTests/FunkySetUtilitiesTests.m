//
//  FunkySetUtilitiesTests.m
//  IntegrationTests
//
//  Created by László Teveli on 2017. 10. 15..
//  Copyright © 2017. tevelee. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Funky/NSSet+FunkyUtilities.h>
#import <Funky/NSSet+FunkyCore.h>

@interface FunkySetUtilitiesTests : XCTestCase

@end

@implementation FunkySetUtilitiesTests

- (void)test_filter {
    NSSet<NSNumber*>* set = [NSSet setWithArray:@[@1, @2, @3]];
    NSSet<NSNumber*>* result = [set filtered:^BOOL(NSNumber* item) {
        return item.integerValue > 2;
    }];
    XCTAssertEqual(result.count, 1);
    XCTAssertEqualObjects(result.anyObject, @3);
}

- (void)test_mutable_filter {
    NSMutableSet<NSNumber*>* set = [NSSet setWithArray:@[@1, @2, @3]].mutableCopy;
    NSSet<NSNumber*>* result = [set filtered:^BOOL(NSNumber* item) {
        return item.integerValue > 2;
    }];
    XCTAssertEqual(result.count, 1);
    XCTAssertEqualObjects(result.anyObject, @3);
}

- (void)test_mutable_new
{
    id instance = [NSMutableSet newWithCapacity:5];
    XCTAssertNotNil(instance);
}

- (void)test_flatten
{
    NSSet* set = [NSSet setWithObject:[NSSet setWithObject:@1]];
    NSSet* result = [set flattened];
    
    XCTAssertEqualObjects(result, [NSSet setWithObject:@1]);
}

- (void)test_mutable_flatten
{
    NSMutableSet* set = [NSMutableSet setWithObject:[NSSet setWithObject:@1]];
    [set flatten];
    
    XCTAssertEqualObjects(set, [NSSet setWithObject:@1]);
}


@end
