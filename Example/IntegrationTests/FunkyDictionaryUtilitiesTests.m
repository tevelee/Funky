//
//  FunkyDictionaryUtilitiesTests.m
//  IntegrationTests
//
//  Created by László Teveli on 2017. 10. 15..
//  Copyright © 2017. tevelee. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Funky/NSDictionary+FunkyUtilities.h>
#import <Funky/NSDictionary+FunkyCore.h>

@interface FunkyDictionaryUtilitiesTests : XCTestCase

@end

@implementation FunkyDictionaryUtilitiesTests

- (void)test_filter {
    NSDictionary<NSString*, NSNumber*>* dictionary = @{@"a": @1, @"b": @2};
    NSDictionary<NSString*, NSNumber*>* result = [dictionary filtered:^BOOL(NSString* key, NSNumber* item) {
        return item.integerValue > 1;
    }];
    XCTAssertEqualObjects(result, @{@"b": @2});
}

- (void)test_mutable_filter {
    NSMutableDictionary<NSString*, NSNumber*>* dictionary = @{@"a": @1, @"b": @2}.mutableCopy;
    NSDictionary<NSString*, NSNumber*>* result = [dictionary filtered:^BOOL(NSString* key, NSNumber* item) {
        return item.integerValue > 1;
    }];
    XCTAssertEqualObjects(result, @{@"b": @2});
}

- (void)test_mutable_new
{
    id instance = [NSMutableDictionary newWithCapacity:5];
    XCTAssertNotNil(instance);
}

@end
