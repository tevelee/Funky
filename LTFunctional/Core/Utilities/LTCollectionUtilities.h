//
//  LTCollectionUtilities.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 21..
//
//

#import <Foundation/Foundation.h>
#import "LTGeneralUtilities.h"
#import "LTCollectionProtocol.h"

@interface LTCollectionUtilities : LTGeneralUtilities

+ (instancetype)utilitiesWithObject:(id<LTCollection>)collection;

- (id)mapToAnother:(void(^)(id item, id<LTMutableCollection> collection))block;

- (id)map:(id(^)(id item))block;
- (id)flatMap:(id(^)(id item))block;
- (id)filter:(BOOL(^)(id item))block;
- (BOOL)all:(BOOL(^)(id item))block;
- (BOOL)none:(BOOL(^)(id item))block;
- (BOOL)contains:(BOOL(^)(id item))block;
- (id)reduce:(id(^)(id value, id item))block withInitialValue:(id)start;
- (id)flattened;
- (id)merge:(id)collection;
- (void)forEach:(void(^)(id item))block;

- (NSDictionary*)groupByUsingFirst:(id(^)(id item))block;
- (NSDictionary*)groupByUsingLast:(id(^)(id item))block;
- (NSDictionary<id, NSArray*>*)associateBy:(id(^)(id item))block;

- (double)sum:(double(^)(id item))block;
- (double)minValue:(double(^)(id item))block;
- (double)maxValue:(double(^)(id item))block;
- (id)minItems:(double(^)(id item))block;
- (id)maxItems:(double(^)(id item))block;

@end
