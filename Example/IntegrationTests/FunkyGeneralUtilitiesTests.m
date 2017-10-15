//
//  FunkyGeneralUtilitiesTests.m
//  IntegrationTests
//
//  Created by László Teveli on 2017. 10. 15..
//  Copyright © 2017. tevelee. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Funky/NSObject+FunkyUtilities.h>

@interface FunkyGeneralUtilitiesTests : XCTestCase

@end

@implementation FunkyGeneralUtilitiesTests

- (void)test_apply {
    NSMutableString* string = [NSMutableString stringWithString:@"test"];
    [string apply:^(NSMutableString* object) {
        [object appendString:@"_is_appended"];
    }];
    
    XCTAssertEqualObjects(string, @"test_is_appended");
}

@end
