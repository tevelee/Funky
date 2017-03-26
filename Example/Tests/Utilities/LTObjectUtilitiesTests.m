//
//  LTArrayUtilitiesTests.m
//  LTFunctional
//
//  Created by László Teveli on 2017. 03. 21..
//  Copyright © 2017. tevelee. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <LTFunctional/NSObject+LTUtilities.h>

@interface LTObjectUtilitiesTests : XCTestCase

@end

@implementation LTObjectUtilitiesTests

- (void)setUp {
    [super setUp];
    
}

- (void)tearDown {
    [super tearDown];
}

- (void)test_apply_returnsTheSameObject {
    NSMutableString* string = [NSMutableString stringWithString:@"Test"];
    id result = [string apply:^(NSMutableString* string) {
        [string appendString:@" that it works"];
    }];
    XCTAssertEqual(string, result);
}

- (void)test_apply_performsTheOperation {
    NSMutableString* string = [NSMutableString stringWithString:@"Test"];
    id result = [string apply:^(NSMutableString* string) {
        [string appendString:@" that it works"];
    }];
    XCTAssertEqualObjects(result, @"Test that it works");
}

@end
