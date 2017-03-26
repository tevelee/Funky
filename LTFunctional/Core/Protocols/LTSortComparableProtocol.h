//
//  LTSortComparableProtocol.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 26..
//
//

#import <Foundation/Foundation.h>

@protocol LTSortComparable <NSObject>

- (NSComparisonResult)compare:(id)object;

@end

typedef BOOL(^LTSortingBucketFilterBlock)(id value);
typedef BOOL(^LTSortBoolComparableBlock)(id obj1, id obj2);
typedef id(^LTSortComparablePropertyProviderBlock)(id item);
