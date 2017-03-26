//
//  LTSortingBucket.m
//  Pods
//
//  Created by László Teveli on 2017. 03. 26..
//
//

#import "LTSortingBucket.h"

@implementation LTSortingBucket

+ (instancetype)bucketWithBlock:(LTSortingBucketFilterBlock)filterBlock
{
    LTSortingBucket* bucket = [self new];
    bucket.filterBlock = [filterBlock copy];
    return bucket;
}

+ (instancetype)bucketWithAllTheRest
{
    LTSortingBucket* bucket = [self new];
    return bucket;
}

- (BOOL)isCollectorBucket
{
    return self.filterBlock == nil;
}

@end
