//
//  CollectionUtilities.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 21..
//
//

#import <Foundation/Foundation.h>
#import "Counterpart.h"

@interface GeneralUtilities : NSObject

+ (instancetype)utilitiesWithObject:(id<NSObject>)object;

- (id)apply:(void(^)(id item))block;

@end

@interface CollectionUtilities : GeneralUtilities

+ (instancetype)utilitiesWithObject:(id<Collection>)collection;

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

@interface ArrayUtilities : CollectionUtilities

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

@end

@interface Pair : NSObject

@property (nonatomic, strong) id<NSCopying> key;
@property (nonatomic, strong) id value;

@end

@interface DictionaryUtilities : GeneralUtilities

- (NSDictionary*)map:(Pair*(^)(id key, id value))block;
- (NSDictionary*)flatMap:(Pair*(^)(id key, id value))block;
- (NSDictionary*)flattened;
- (NSDictionary*)merge:(NSDictionary*)other;
- (void)forEach:(void(^)(id key, id value))block;

- (id)filter:(BOOL(^)(id key, id value))block;
- (BOOL)all:(BOOL(^)(id key, id value))block;
- (BOOL)none:(BOOL(^)(id key, id value))block;
- (BOOL)contains:(BOOL(^)(id key, id value))block;
- (id)reduce:(id(^)(id previousValue, id key, id value))block withInitialValue:(id)start;

@end
