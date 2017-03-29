//
//  FunkyArraySortTests.m
//  Funky
//
//  Created by László Teveli on 2017. 03. 25..
//  Copyright © 2017. tevelee. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Funky/NSArray+FunkyUtilities.h>
#import <Funky/FunkySort.h>

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

@interface FunkyArraySortTests : XCTestCase

@property (nonatomic, strong) NSArray* items;

@end

@implementation FunkyArraySortTests

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
    FunkySortingBucket* firstNameL = [FunkySortingBucket bucketWithBlock:^BOOL(Person* person) {
        return [person.firstName isEqualToString:@"L"];
    }];
    FunkySortingBucket* allTheRest = [FunkySortingBucket bucketWithAllTheRest];
    
    NSArray* sorted = [self.items sortedArrayUsingComparator:[FunkySort comparatorWithBuckets:@[allTheRest, firstNameL] defaultInnerBucketComparator:self.personComparator]];
    
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
    FunkySortingBucket* firstNameL = [FunkySortingBucket bucketWithBlock:^BOOL(Person* person) {
        return [person.firstName isEqualToString:@"L"];
    }];
    FunkySortingBucket* lastNameT = [FunkySortingBucket bucketWithBlock:^BOOL(Person* person) {
        return [person.lastName isEqualToString:@"T"];
    }];
    FunkySortingBucket* ageOver28 = [FunkySortingBucket bucketWithBlock:^BOOL(Person* person) {
        return person.age > 28;
    }];
    FunkySortingBucket* allTheRest = [FunkySortingBucket bucketWithAllTheRest];
    
    NSArray* sorted = [self.items sortedArrayUsingComparator:[FunkySort comparatorWithBuckets:@[firstNameL, lastNameT, allTheRest, ageOver28] defaultInnerBucketComparator:self.personComparator]];
    
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

- (void)testBucketComparatorWithoutCollector {
    FunkySortingBucket* even = [FunkySortingBucket bucketWithBlock:^BOOL(NSNumber* value) {
        return value.integerValue % 2 == 0;
    }];
    NSArray* result = [@[@0, @1, @0, @3, @10, @6, @7] sorted:[FunkySort comparatorWithBuckets:@[even]]];
    NSArray* expected = @[@0, @0, @6, @10, @1, @3, @7];
    XCTAssertEqualObjects(result, expected);
}

- (void)testPrioritizedComparatorEqual {
    NSArray* result = [@[@0, @0, @0, @0] sorted:[FunkySort prioritizedComparator:@[^NSComparisonResult(id obj1, id obj2) { return NSOrderedSame; },
                                                                                [FunkySort lexicographicalComparator]]]];
    NSArray* expected = @[@0, @0, @0, @0];
    XCTAssertEqualObjects(result, expected);
}

- (void)testPrioritizedComparatorNotEqual {
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
    NSComparator firstName = [FunkySort propertyComparator:^id(Person* person) {
        return person.firstName;
    }];
    NSComparator lastName = [FunkySort propertyComparator:^id(Person* person) {
        return person.lastName;
    }];
    NSComparator age = [FunkySort propertyComparator:^id(Person* person) {
        return @(person.age);
    }];
    return [FunkySort prioritizedComparator:@[firstName, lastName, age]];
}

- (void)testBoolComparator
{
    NSArray* numbers = @[@10, @9, @1, @2, @7, @6, @8, @3, @5, @4, @0, @5];
    
    NSArray* sortedAsc = @[@0, @1, @2, @3, @4, @5, @5, @6, @7, @8, @9, @10];
    XCTAssertEqualObjects(sortedAsc, [numbers sortedArrayUsingComparator:[FunkySort boolComparator:^BOOL(NSNumber* obj1, NSNumber* obj2) {
        return obj1.intValue < obj2.intValue;
    }]]);
    
    NSArray* sortedDesc = @[@10, @9, @8, @7, @6, @5, @5, @4, @3, @2, @1, @0];
    XCTAssertEqualObjects(sortedDesc, [numbers sortedArrayUsingComparator:[FunkySort boolComparator:^BOOL(NSNumber* obj1, NSNumber* obj2) {
        return obj1.intValue > obj2.intValue;
    }]]);
}

@end
