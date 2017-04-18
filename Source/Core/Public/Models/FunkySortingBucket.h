//
//  FunkySortingBucket.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 26..
//
//

#import <Foundation/Foundation.h>
#import "FunkySortComparableProtocol.h"

/**
 *  This is a data structure representing a bucket of items when bucket-sorting 
 * 
 *  @see Sorting method `+[FunkySort comparatorWithBuckets:]`
 *  @see Sorting method with custom default comparator `+[FunkySort comparatorWithBuckets:defaultInnerBucketComparator:]`
 */
@interface FunkySortingBucket : NSObject

/**
 *  The filter to determine whether an item is belonging to the current bucket
 */
@property (nonatomic, copy) FunkySortingBucketFilterBlock filterBlock;

/**
 *  A comparator to use inside the elements in this bucket
 */
@property (nonatomic, copy) NSComparator innerBucketComparator;

/**
 *  Creates a new bucket by initialising the `filterBlock` with the given parameter to determine whether an item is belonging to the bucket
 *
 *  @return A new (specific) bucket
 */
+ (instancetype)bucketWithBlock:(FunkySortingBucketFilterBlock)block;

/**
 *  Creates a new bucket by leaving the `filterBlock` nil, to collect all the remaining items which did not fit into the specific buckets. You can only hold one collector bucket in one bucket-filtering operation
 *
 *  @return A new collector bucket, holding all the other items which did not fit into specific buckets.
 *  @see Getter for determining whether the current bucket is a collector `-[FunkySortingBucket isCollectorBucket]`
 */
+ (instancetype)bucketWithAllTheRest;

/**
 *  The filter to determine whether an item is belonging to the current bucket
 *
 *  @return YES of the bucket is initialised with nil `filterBlock` value, meaning that this is a special bucket used for storing the remaining elements
 */
- (BOOL)isCollectorBucket;

@end
