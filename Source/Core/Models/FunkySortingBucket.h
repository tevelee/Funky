//
//  FunkySortingBucket.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 26..
//
//

#import <Foundation/Foundation.h>
#import "FunkySortComparableProtocol.h"

@interface FunkySortingBucket : NSObject

@property (nonatomic, copy) FunkySortingBucketFilterBlock filterBlock;
@property (nonatomic, copy) NSComparator innerBucketComparator;

+ (instancetype)bucketWithBlock:(FunkySortingBucketFilterBlock)block;
+ (instancetype)bucketWithAllTheRest;

- (BOOL)isCollectorBucket;

@end
