//
//  FunkySortComparableProtocol.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 26..
//
//

#import <Foundation/Foundation.h>

@protocol FunkySortComparable <NSObject>

- (NSComparisonResult)compare:(id)object;

@end

typedef BOOL(^FunkySortingBucketFilterBlock)(id value);
typedef BOOL(^FunkySortBoolComparableBlock)(id obj1, id obj2);
typedef id(^FunkySortComparablePropertyProviderBlock)(id item);
