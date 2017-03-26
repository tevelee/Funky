//
//  LTSort.m
//  Pods
//
//  Created by László Teveli on 2017. 03. 26..
//
//

#import "LTSort.h"
#import "LTArrayUtilities.h"

@implementation LTSort

+ (LTArrayUtilities*)utilities
{
    return [LTArrayUtilities utilitiesWithObject:self];
}

+ (NSComparator)lexicographicalComparator
{
    return [self.utilities lexicographicalComparator];
}

+ (NSComparator)propertyComparator:(LTSortComparablePropertyProviderBlock)propertyBlock
{
    return [self.utilities propertyComparator:propertyBlock];
}

+ (NSComparator)boolComparator:(LTSortBoolComparableBlock)comparator
{
    return [self.utilities boolComparator:comparator];
}

+ (NSComparator)prioritizedComparator:(NSArray<NSComparator>*)comparators
{
    return [self.utilities prioritizedComparator:comparators];
}

+ (NSComparator)comparatorWithBuckets:(NSArray<LTSortingBucket*>*)buckets
{
    return [self.utilities comparatorWithBuckets:buckets];
}

+ (NSComparator)comparatorWithBuckets:(NSArray<LTSortingBucket*>*)buckets defaultInnerBucketComparator:(NSComparator)defaultInnerBucketComparator
{
    return [self.utilities comparatorWithBuckets:buckets defaultInnerBucketComparator:defaultInnerBucketComparator];
}

@end
