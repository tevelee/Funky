//
//  LTSort.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 26..
//
//

#import <Foundation/Foundation.h>
#import "LTSortingBucket.h"

@interface LTSort : NSObject

+ (NSComparator)lexicographicalComparator;
+ (NSComparator)propertyComparator:(LTSortComparablePropertyProviderBlock)propertyBlock;
+ (NSComparator)boolComparator:(LTSortBoolComparableBlock)comparator;

+ (NSComparator)prioritizedComparator:(NSArray<NSComparator>*)comparators;

+ (NSComparator)comparatorWithBuckets:(NSArray<LTSortingBucket*>*)buckets;
+ (NSComparator)comparatorWithBuckets:(NSArray<LTSortingBucket*>*)buckets defaultInnerBucketComparator:(NSComparator)defaultInnerBucketComparator;

@end
