//
//  FunkyArrayUtilitiesTests.m
//  Funky
//
//  Created by László Teveli on 2017. 03. 21..
//  Copyright © 2017. tevelee. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Funky/FunkyGeneralUtilities.h>

@interface FunkyObjectUtilitiesTests : XCTestCase

@property (nonatomic, strong) FunkyGeneralUtilities* utils;

@end

@implementation FunkyObjectUtilitiesTests

- (void)setUp {
    [super setUp];
    NSMutableString* string = [NSMutableString stringWithString:@"Test"];
    self.utils = [FunkyGeneralUtilities utilitiesWithObject:string];
}

- (void)tearDown {
    [super tearDown];
}

- (void)test_apply_returnsTheSameObject {
    id result = [self.utils apply:^(NSMutableString* string) {
        [string appendString:@" that it works"];
    }];
    XCTAssertEqual(self.utils.object, result);
}

- (void)test_apply_performsTheOperation {
    id result = [self.utils apply:^(NSMutableString* string) {
        [string appendString:@" that it works"];
    }];
    XCTAssertEqualObjects(result, @"Test that it works");
}

@end
