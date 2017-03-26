//
//  LTArrayFilterTests.m
//  LTFunctional
//
//  Created by László Teveli on 2017. 03. 27..
//  Copyright © 2017. tevelee. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <LTFunctional/LTFilter.h>
#import <LTFunctional/NSArray+LTUtilities.h>

@interface LTArrayFilterTests : XCTestCase

@property (nonatomic, strong) NSArray* items;

@end

@implementation LTArrayFilterTests

- (void)setUp {
    [super setUp];
    self.items = @[@0, @8, @9, @1, @5, @4, @10];
}

- (void)test_classKind {
    NSArray* result = [self.items filter:[LTFilter isKindOfClass:[NSValue class]]];
    XCTAssertEqualObjects(result, self.items);
}

- (void)test_classMember {
    NSArray* result = [@[@1, @"A", @YES, [UIView new], @"B", @[], @"C", @{}] filter:[LTFilter isMemberOfClass:[UIView class]]];
    XCTAssertEqual(result.count, 1);
}

- (void)test_selector {
    NSArray* result = [self.items filter:[LTFilter respondsToSelector:@selector(compare:)]];
    XCTAssertEqualObjects(result, self.items);
}

- (void)test_equal {
    NSArray* result = [self.items filter:[LTFilter equalTo:@1]];
    XCTAssertEqualObjects(result, @[@1]);
}

- (void)test_over5 {
    NSArray* result = [self.items filter:^BOOL(id item) {
        return [item intValue] > 5;
    }];
    NSArray* expected = @[@8, @9, @10];
    XCTAssertEqualObjects(result, expected);
}

@end
