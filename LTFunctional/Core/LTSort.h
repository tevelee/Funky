//
//  LTSort.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 24..
//
//

#import <Foundation/Foundation.h>

@protocol Comparable <NSObject>

- (NSComparisonResult)compare:(id)object;

@end

typedef BOOL(^SortingBucketFilterBlock)(id value);
typedef id(^ComparablePropertyProviderBlock)(id item);

@interface LTSortingBucket : NSObject

@property (nonatomic, copy) SortingBucketFilterBlock filterBlock;
@property (nonatomic, copy) NSComparator innerBucketComparator;

+ (instancetype)bucketWithBlock:(SortingBucketFilterBlock)block;
+ (instancetype)bucketWithAllTheRest;

- (BOOL)isCollectorBucket;

@end

@interface NSArray (Buckets)

+ (NSComparator)lexicographicalComparator;
+ (NSComparator)propertyComparator:(ComparablePropertyProviderBlock)propertyBlock;
+ (NSComparator)prioritizedComparator:(NSArray<NSComparator>*)comparators;
+ (NSComparator)comparatorWithBuckets:(NSArray<LTSortingBucket*>*)buckets;
+ (NSComparator)comparatorWithBuckets:(NSArray<LTSortingBucket*>*)buckets defaultInnerBucketComparator:(NSComparator)defaultInnerBucketComparator;

@end
