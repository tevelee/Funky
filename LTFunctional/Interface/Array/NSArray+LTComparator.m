//
//  NSArray+LTComparator.m
//  Pods
//
//  Created by László Teveli on 2017. 03. 26..
//
//

#import "NSArray+LTComparator.h"
#import "LTArrayUtilities.h"

@implementation NSArray (LTComparator)

+ (NSComparator)lexicographicalComparator
{
    LTArrayUtilities* utils = [LTArrayUtilities utilitiesWithObject:self];
    return [utils lexicographicalComparator];
}

+ (NSComparator)propertyComparator:(LTSortComparablePropertyProviderBlock)propertyBlock
{
    LTArrayUtilities* utils = [LTArrayUtilities utilitiesWithObject:self];
    return [utils propertyComparator:propertyBlock];
}

+ (NSComparator)boolComparator:(LTSortBoolComparableBlock)comparator
{
    LTArrayUtilities* utils = [LTArrayUtilities utilitiesWithObject:self];
    return [utils boolComparator:comparator];
}

+ (NSComparator)prioritizedComparator:(NSArray<NSComparator>*)comparators
{
    LTArrayUtilities* utils = [LTArrayUtilities utilitiesWithObject:self];
    return [utils prioritizedComparator:comparators];
}

+ (NSComparator)comparatorWithBuckets:(NSArray<LTSortingBucket*>*)buckets
{
    LTArrayUtilities* utils = [LTArrayUtilities utilitiesWithObject:self];
    return [utils comparatorWithBuckets:buckets];
}

+ (NSComparator)comparatorWithBuckets:(NSArray<LTSortingBucket*>*)buckets defaultInnerBucketComparator:(NSComparator)defaultInnerBucketComparator
{
    LTArrayUtilities* utils = [LTArrayUtilities utilitiesWithObject:self];
    return [utils comparatorWithBuckets:buckets defaultInnerBucketComparator:defaultInnerBucketComparator];
}

@end
