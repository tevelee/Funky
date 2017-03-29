//
//  FunkySort.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 26..
//
//

#import <Foundation/Foundation.h>
#import "FunkySortingBucket.h"

@interface FunkySort : NSObject

+ (NSComparator)lexicographicalComparator;
+ (NSComparator)propertyComparator:(FunkySortComparablePropertyProviderBlock)propertyBlock;
+ (NSComparator)boolComparator:(FunkySortBoolComparableBlock)comparator;

+ (NSComparator)prioritizedComparator:(NSArray<NSComparator>*)comparators;

+ (NSComparator)comparatorWithBuckets:(NSArray<FunkySortingBucket*>*)buckets;
+ (NSComparator)comparatorWithBuckets:(NSArray<FunkySortingBucket*>*)buckets defaultInnerBucketComparator:(NSComparator)defaultInnerBucketComparator;

@end
