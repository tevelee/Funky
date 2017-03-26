//
//  LTNSArray+UtilitiesTests.m
//  LTFunctional
//
//  Created by László Teveli on 2017. 03. 26..
//  Copyright © 2017. tevelee. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <LTFunctional/LTArrayUtilities.h>
#import <LTFunctional/NSArray+LTUtilities.h>
#import <LTFunctional/NSArray+LTCore.h>
#import <OCMock/OCMock.h>

@interface LTNSArray_UtilitiesTests : XCTestCase

//@property (nonatomic, strong)

@end

@implementation LTNSArray_UtilitiesTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)test_map_callsUtilitiyClass {
    NSArray* array = @[@0, @1, @2, @3];
    id utils = OCMPartialMock(array.utilities);
    
    [array map:^id(id item) {
        return item;
    }];
    
    OCMVerify([utils map:[OCMArg any]]);
}

@end
