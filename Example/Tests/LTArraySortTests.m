//
//  LTArraySortTests.m
//  LTFunctional
//
//  Created by László Teveli on 2017. 03. 25..
//  Copyright © 2017. tevelee. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <LTFunctional/LTSort.h>

@interface Person : NSObject

@property (nonatomic, strong) NSString* firstName;
@property (nonatomic, strong) NSString* lastName;
@property (nonatomic, assign) NSInteger age;

+ (instancetype)personWithFirstName:(NSString*)firstName lastName:(NSString*)lastName age:(NSInteger)age;

@end

@implementation Person

+ (instancetype)personWithFirstName:(NSString*)firstName lastName:(NSString*)lastName age:(NSInteger)age
{
    Person* person = [Person new];
    person.firstName = firstName;
    person.lastName = lastName;
    person.age = age;
    return person;
}

@end

@interface LTArraySortTests : XCTestCase

@property (nonatomic, strong) NSArray* items;

@end

@implementation LTArraySortTests

- (void)setUp {
    [super setUp];
    self.items = @[[Person personWithFirstName:@"L" lastName:@"T" age:26],
                   [Person personWithFirstName:@"C" lastName:@"T" age:34],
                   [Person personWithFirstName:@"I" lastName:@"T" age:58],
                   [Person personWithFirstName:@"Z" lastName:@"K" age:28],
                   [Person personWithFirstName:@"Z" lastName:@"E" age:59],
                   [Person personWithFirstName:@"K" lastName:@"E" age:38],
                   [Person personWithFirstName:@"L" lastName:@"E" age:28],
                   [Person personWithFirstName:@"L" lastName:@"T" age:29]];
}

- (void)tearDown {
    self.items = nil;
    [super tearDown];
}

- (void)testBucketComparator {
    LTSortingBucket* firstNameL = [LTSortingBucket bucketWithBlock:^BOOL(Person* person) {
        return [person.firstName isEqualToString:@"L"];
    }];
    LTSortingBucket* allTheRest = [LTSortingBucket bucketWithAllTheRest];
    
    NSArray* sorted = [self.items sortedArrayUsingComparator:[NSArray comparatorWithBuckets:@[allTheRest, firstNameL] defaultInnerBucketComparator:self.personComparator]];
    
    XCTAssertEqualObjects([sorted[5] firstName], @"L");
    XCTAssertEqualObjects([sorted[5] lastName], @"E");
    
    XCTAssertEqualObjects([sorted[6] firstName], @"L");
    XCTAssertEqualObjects([sorted[6] lastName], @"T");
    XCTAssertEqual([sorted[6] age], 26);
    
    XCTAssertEqualObjects([sorted[7] firstName], @"L");
    XCTAssertEqualObjects([sorted[7] lastName], @"T");
    XCTAssertEqual([sorted[7] age], 29);
}

- (void)testBucketComparatorWithCollector {
    LTSortingBucket* firstNameL = [LTSortingBucket bucketWithBlock:^BOOL(Person* person) {
        return [person.firstName isEqualToString:@"L"];
    }];
    LTSortingBucket* lastNameT = [LTSortingBucket bucketWithBlock:^BOOL(Person* person) {
        return [person.lastName isEqualToString:@"T"];
    }];
    LTSortingBucket* ageOver28 = [LTSortingBucket bucketWithBlock:^BOOL(Person* person) {
        return person.age > 28;
    }];
    LTSortingBucket* allTheRest = [LTSortingBucket bucketWithAllTheRest];
    
    NSArray* sorted = [self.items sortedArrayUsingComparator:[NSArray comparatorWithBuckets:@[firstNameL, lastNameT, allTheRest, ageOver28] defaultInnerBucketComparator:self.personComparator]];
    
    XCTAssertEqualObjects([sorted[0] firstName], @"L");
    XCTAssertEqualObjects([sorted[0] lastName], @"E");
    
    XCTAssertEqualObjects([sorted[1] firstName], @"L");
    XCTAssertEqualObjects([sorted[1] lastName], @"T");
    XCTAssertEqual([sorted[1] age], 26);
    
    XCTAssertEqualObjects([sorted[2] firstName], @"L");
    XCTAssertEqualObjects([sorted[2] lastName], @"T");
    XCTAssertEqual([sorted[2] age], 29);
    
    XCTAssertEqualObjects([sorted[3] firstName], @"C");
    XCTAssertEqualObjects([sorted[3] lastName], @"T");
    
    XCTAssertEqualObjects([sorted[4] firstName], @"I");
    XCTAssertEqualObjects([sorted[4] lastName], @"T");
    
    XCTAssertEqual([sorted[6] age], 38);
    XCTAssertEqual([sorted[7] age], 59);
}

- (void)testPrioritizedComparator {
    NSArray* sorted = [self.items sortedArrayUsingComparator:self.personComparator];
    
    XCTAssertEqualObjects([sorted[0] firstName], @"C");
    XCTAssertEqualObjects([sorted[1] firstName], @"I");
    XCTAssertEqualObjects([sorted[2] firstName], @"K");
    XCTAssertEqualObjects([sorted[3] firstName], @"L");
    XCTAssertEqualObjects([sorted[4] firstName], @"L");
    XCTAssertEqualObjects([sorted[5] firstName], @"L");
    XCTAssertEqualObjects([sorted[6] firstName], @"Z");
    XCTAssertEqualObjects([sorted[7] firstName], @"Z");
    
    XCTAssertEqualObjects([sorted[3] lastName], @"E");
    
    XCTAssertEqual([sorted[4] age], 26);
    XCTAssertEqual([sorted[5] age], 29);
}

- (NSComparator)personComparator
{
    NSComparator firstName = [NSArray propertyComparator:^id(Person* person) {
        return person.firstName;
    }];
    NSComparator lastName = [NSArray propertyComparator:^id(Person* person) {
        return person.lastName;
    }];
    NSComparator age = [NSArray propertyComparator:^id(Person* person) {
        return @(person.age);
    }];
    return [NSArray prioritizedComparator:@[firstName, lastName, age]];
}

@end
