//
//  LTSortingBucket.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 26..
//
//

#import <Foundation/Foundation.h>
#import "LTSortComparableProtocol.h"

@interface LTSortingBucket : NSObject

@property (nonatomic, copy) LTSortingBucketFilterBlock filterBlock;
@property (nonatomic, copy) NSComparator innerBucketComparator;

+ (instancetype)bucketWithBlock:(LTSortingBucketFilterBlock)block;
+ (instancetype)bucketWithAllTheRest;

- (BOOL)isCollectorBucket;

@end
