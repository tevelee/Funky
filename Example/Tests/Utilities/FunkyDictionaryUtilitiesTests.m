//
//  FunkyArrayUtilitiesTests.m
//  Funky
//
//  Created by László Teveli on 2017. 03. 21..
//  Copyright © 2017. tevelee. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Funky/NSDictionary+FunkyUtilities.h>

@interface FunkyDictionaryUtilitiesTests : XCTestCase

@property (nonatomic, strong) NSDictionary<NSString*, NSNumber*>* items;

@end

@implementation FunkyDictionaryUtilitiesTests

- (void)setUp {
    [super setUp];
    self.items = @{@"a": @0, @"b": @1, @"c": @2};
}

- (void)tearDown {
    [super tearDown];
}

- (void)test_map {
    NSDictionary* mapped = [self.items map:^FunkyPair*(NSString* key, NSNumber* value) {
        return [FunkyPair pairWithKey:key value:key];
    }];
    NSDictionary* expected = @{@"a": @"a", @"b": @"b", @"c": @"c"};
    XCTAssertEqualObjects(mapped, expected);
    
    mapped = [self.items map:^FunkyPair*(NSString* key, NSNumber* value) {
        return [FunkyPair pairWithKey:@"a" value:value];
    }];
    XCTAssertEqual(mapped.count, 1);
}

- (void)test_merge {
    NSDictionary* merged = [self.items merge:@{@"d": @"d"}];
    NSDictionary* expected = @{@"a": @0, @"b": @1, @"c": @2, @"d": @"d"};
    XCTAssertEqualObjects(merged, expected);
}

- (void)test_forEach {
    NSMutableSet* items = [NSMutableSet setWithCapacity:self.items.count];
    [self.items forEach:^(NSString *key, NSNumber *value) {
        [items addObject:key];
    }];
    NSSet* expected = [NSSet setWithArray:self.items.allKeys];
    XCTAssertEqualObjects(items, expected);
}

- (void)test_filter {
    NSDictionary* filtered = [self.items filter:^BOOL(NSString *key, NSNumber *value) {
        return [key isEqualToString:@"a"];
    }];
    NSDictionary* expected = @{@"a": @0};
    XCTAssertEqualObjects(filtered, expected);
}

- (void)test_all {
    BOOL result = [self.items all:^BOOL(NSString *key, NSNumber *value) {
        return key.length == 1;
    }];
    XCTAssertTrue(result);
    
    result = [self.items all:^BOOL(NSString *key, NSNumber *value) {
        return [key isEqualToString:@"d"];
    }];
    XCTAssertFalse(result);
}

- (void)test_none {
    BOOL result = [self.items none:^BOOL(NSString *key, NSNumber *value) {
        return [key length] == 2;
    }];
    XCTAssertTrue(result);
    
    result = [self.items none:^BOOL(NSString *key, NSNumber *value) {
        return [key isEqualToString:@"a"];
    }];
    XCTAssertFalse(result);
}

- (void)test_contains {
    BOOL result = [self.items contains:^BOOL(NSString *key, NSNumber *value) {
        return [key length] == 1;
    }];
    XCTAssertTrue(result);
    
    result = [self.items contains:^BOOL(NSString *key, NSNumber *value) {
        return [key isEqualToString:@"e"];
    }];
    XCTAssertFalse(result);
}

- (void)test_reduce {
    id result = [self.items reduce:^id(id previousValue, NSString *key, NSNumber *value) {
        return [previousValue stringByAppendingString:[value stringValue]];
    } withInitialValue:@""];
    XCTAssertEqualObjects(result, @"012");
}

@end
