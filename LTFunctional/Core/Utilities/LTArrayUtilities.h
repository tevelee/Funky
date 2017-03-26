//
//  LTArrayUtilities.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 26..
//
//

#import <Foundation/Foundation.h>
#import "LTCollectionUtilities.h"
#import "LTSortingBucket.h"
#import "LTFilterPredicateProtocol.h"

@interface LTArrayUtilities : LTCollectionUtilities

- (NSInteger)minIndex;
- (NSInteger)maxIndex;

- (id)first:(BOOL(^)(id item))block;
- (id)last:(BOOL(^)(id item))block;

- (id)take:(BOOL(^)(id item))block;
- (id)takeLast:(BOOL(^)(id item))block;

- (id)untilValue:(id)value;
- (id)untilIndex:(NSInteger)index;

- (id)fromValue:(id)value;
- (id)fromIndex:(NSInteger)index;

- (id)fromValue:(id)from untilValue:(id)until;
- (id)fromIndex:(NSInteger)from untilIndex:(NSInteger)until;

- (void)forEachWithIndex:(void(^)(NSUInteger index, id item))block;

- (id)unique;
- (id)reversed;
- (id)shuffled;

- (NSComparator)lexicographicalComparator;
- (NSComparator)propertyComparator:(LTSortComparablePropertyProviderBlock)propertyBlock;
- (NSComparator)prioritizedComparator:(NSArray<NSComparator>*)comparators;
- (NSComparator)comparatorWithBuckets:(NSArray<LTSortingBucket*>*)buckets;
- (NSComparator)comparatorWithBuckets:(NSArray<LTSortingBucket*>*)buckets defaultInnerBucketComparator:(NSComparator)defaultInnerBucketComparator;
- (NSComparator)boolComparator:(BOOL(^)(id obj1, id obj2))comparator;

- (LTFilterPredicate)predicateForEquality:(id)object;
- (LTFilterPredicate)predicateForSubclass:(Class)objectClass;
- (LTFilterPredicate)predicateForClass:(Class)objectClass;
- (LTFilterPredicate)predicateForSelector:(SEL)selector;


@end
