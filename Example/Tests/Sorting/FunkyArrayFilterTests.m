//
//  FunkyArrayFilterTests.m
//  Funky
//
//  Created by László Teveli on 2017. 03. 27..
//  Copyright © 2017. tevelee. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Funky/FunkyFilter.h>
#import <Funky/NSArray+FunkyUtilities.h>

@interface FunkyArrayFilterTests : XCTestCase

@property (nonatomic, strong) NSArray* items;

@end

@implementation FunkyArrayFilterTests

- (void)setUp {
    [super setUp];
    self.items = @[@0, @8, @9, @1, @5, @4, @10];
}

- (void)test_classKind {
    NSArray* result = [self.items filtered:[FunkyFilter isKindOfClass:[NSValue class]]];
    XCTAssertEqualObjects(result, self.items);
}

- (void)test_classMember {
    NSArray* result = [@[@1, @"A", @YES, [UIView new], @"B", @[], @"C", @{}] filtered:[FunkyFilter isMemberOfClass:[UIView class]]];
    XCTAssertEqual(result.count, 1);
}

- (void)test_selector {
    NSArray* result = [self.items filtered:[FunkyFilter respondsToSelector:@selector(compare:)]];
    XCTAssertEqualObjects(result, self.items);
}

- (void)test_equal {
    NSArray* result = [self.items filtered:[FunkyFilter equalTo:@1]];
    XCTAssertEqualObjects(result, @[@1]);
}

- (void)test_over5 {
    NSArray* result = [self.items filtered:^BOOL(id item) {
        return [item intValue] > 5;
    }];
    NSArray* expected = @[@8, @9, @10];
    XCTAssertEqualObjects(result, expected);
}

@end
