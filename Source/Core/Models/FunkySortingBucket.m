//
//  FunkySortingBucket.m
//  Pods
//
//  Created by László Teveli on 2017. 03. 26..
//
//

#import "FunkySortingBucket.h"

@implementation FunkySortingBucket

+ (instancetype)bucketWithBlock:(FunkySortingBucketFilterBlock)filterBlock
{
    FunkySortingBucket* bucket = [self new];
    bucket.filterBlock = [filterBlock copy];
    return bucket;
}

+ (instancetype)bucketWithAllTheRest
{
    FunkySortingBucket* bucket = [self new];
    return bucket;
}

- (BOOL)isCollectorBucket
{
    return self.filterBlock == nil;
}

@end
