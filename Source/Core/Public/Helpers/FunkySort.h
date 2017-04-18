//
//  FunkySort.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 26..
//
//

#import <Foundation/Foundation.h>
#import "FunkySortingBucket.h"

/**
 *  This is a collection of methods to provide comparator helpers
 */
@interface FunkySort : NSObject

/**
 *  Provides a lexicographical comparator, so if the collection is sorted using this method, all the elements should be comparable using the `-compare:` method
 *
 *  @return A comparator to use when sorting collections
 */
+ (NSComparator)lexicographicalComparator;

/**
 *  Provides a property comparator, mapping the current object into another comparable one which responds to the `-compare:` method. In case of a complex object you usually return a property of it which holds a primitive value, like NSString or NSNumber
 *
 *  @param propertyBlock The block to map the current element into a comparable one
 *  @return A comparator to use when sorting collections
 */
+ (NSComparator)propertyComparator:(FunkySortComparablePropertyProviderBlock)propertyBlock;

/**
 *  Provides a special comparator for comparing objects, but when only interested in their asending or descending information. It is usually used when comparing numbers in an array, like `return obj1 < obj2` to have an ascending collection
 *
 *  @param comparator The block to use when comparing two objects
 *  @return A comparator to use when sorting collections
 *  @see The type of block to can provide is `FunkySortBoolComparableBlock`
 */
+ (NSComparator)boolComparator:(FunkySortBoolComparableBlock)comparator;

/**
 *  A composite comparator, providing multiple comparators in it, so when based on one comparation the objects are equal, the next one is being used.
 *
 *  @param comparators The list of comparators to use in order
 *  @return A comparator to use when sorting collections
 */
+ (NSComparator)prioritizedComparator:(NSArray<NSComparator>*)comparators;

#pragma mark - Bucket sort

/**
 *  A composite comparator using buckets. It orders the list in a way, that it uses so called buckets which represent a subset of the elements. So the order is going to be made up of the order of these buckets. 
 *  There is a special bucket, called collector bucket (`-[FunkySortingBucket bucketWithAllTheRest]`) which hold all the remaining element which couldn't fit in any of the other concrete buckets. This collector bucket can be placed even in the middle of the list of buckets, so you can achieve to order a bucket at last. By default the collector is at the end.
 *  In this method the default inner bucket comparator is the lexicographical one.
 *
 *  @param buckets The list of buckets to use in order
 *  @return A comparator to use when sorting collections
 *  @see The buckets to provide are `FunkySortingBucket` instances
 *  @see Comparator with custom inner-bucket comparator `+[FunkySort comparatorWithBuckets:defaultInnerBucketComparator:]`
 */
+ (NSComparator)comparatorWithBuckets:(NSArray<FunkySortingBucket*>*)buckets;

/**
 *  Same as `+[FunkySort comparatorWithBuckets:]` but with an addition to set the default inner bucket comparator.
 *
 *  @param buckets The list of buckets to use in order
 *  @param defaultInnerBucketComparator The default comparator to use instead of the lexicographical one
 *  @return A comparator to use when sorting collections
 *  @see The buckets to provide are `FunkySortingBucket` instances
 *  @see Comparator with the default lexicographical inner-bucket comparator `+[FunkySort comparatorWithBuckets:]`
 */
+ (NSComparator)comparatorWithBuckets:(NSArray<FunkySortingBucket*>*)buckets defaultInnerBucketComparator:(NSComparator)defaultInnerBucketComparator;

@end
