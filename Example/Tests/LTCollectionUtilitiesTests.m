//
//  LTArrayUtilitiesTests.m
//  LTFunctional
//
//  Created by László Teveli on 2017. 03. 21..
//  Copyright © 2017. tevelee. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <LTFunctional/LTCollectionUtilities.h>
#import <LTFunctional/NSSet+LTUtilities.h>
#import <LTFunctional/NSArray+LTUtilities.h>
#import <LTFunctional/LTNilTolerantNSArray.h>

@interface LTArrayUtilitiesTests : XCTestCase

@end

@implementation LTArrayUtilitiesTests

- (void)setUp {
    [super setUp];
    
}

- (void)tearDown {
    [super tearDown];
}

- (void)testExample {
    NSString* nilValue = nil;
    
    NSArray* a = @[@0, @1, @2].nilTolerant;
    a = [a arrayByAddingObject:nilValue];
    [a map:^id(id item) {
        return nil;
    }];
    
    NSMutableArray* b = [NSMutableArray_NilTolerant arrayWithObject:@0];
    [b addObject:nilValue];
    
    [a map:^id(id item) {
        return item;
    }];
    
    NSSet<NSNumber*>* set = [NSSet setWithArray:a];
    NSSet* result = [set map:^id(NSNumber *item) {
        return @"yo";
    }];
}

@end
