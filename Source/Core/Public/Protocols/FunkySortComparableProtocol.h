//
//  FunkySortComparableProtocol.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 26..
//
//

#import <Foundation/Foundation.h>

/**
 *  This is a protocol for comparing objects
 */
@protocol FunkySortComparable <NSObject>

/**
 *  This method compares the content of two objects (the current and the one given in the parameter)
 *
 *  @param object The other object to compare with
 *  @return An NSComparisonResult (Ascending/Descending/Same) after comparing the two objects
 */
- (NSComparisonResult)compare:(id)object;

@end

/**
 *  This type is used when filtering collections with "bucket sort"
 */
typedef BOOL(^FunkySortingBucketFilterBlock)(id value);

/**
 *  This is a protocol for comparing objects, but we're only interested in their asending or descending information. It is usually used when comparing numbers in an array, like `return obj1 < obj2` to have an ascending collection
 */
typedef BOOL(^FunkySortBoolComparableBlock)(id obj1, id obj2);

/**
 *  This is a protocol for comparing objects via a mapped value. In case of complex objects you can return a sub-property which implements the `-compare:` method, so the collection will be sorted by that computed property.
 */
typedef id(^FunkySortComparablePropertyProviderBlock)(id item);
