//
//  FunkyDictionaryUtilities.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 26..
//
//

#import <Foundation/Foundation.h>
#import "FunkyGeneralUtilities.h"
#import "FunkyPair.h"

@interface FunkyDictionaryUtilities : FunkyGeneralUtilities

@property (nonatomic, strong) NSDictionary* object;

- (NSDictionary*)nilTolerantMap:(FunkyPair*(^)(id key, id value))block;
- (NSDictionary*)map:(FunkyPair*(^)(id key, id value))block;
- (NSDictionary*)merged:(NSDictionary*)other;
- (void)forEach:(void(^)(id key, id value))block;

- (NSDictionary*)invertedObjectsAndKeys;

- (NSDictionary*)filtered:(BOOL(^)(id key, id value))block;
- (BOOL)all:(BOOL(^)(id key, id value))block;
- (BOOL)none:(BOOL(^)(id key, id value))block;
- (BOOL)contains:(BOOL(^)(id key, id value))block;
- (NSInteger)count:(BOOL(^)(id key, id value))block;
- (id)reduce:(id(^)(id previousValue, id key, id value))block withInitialValue:(id)start;

- (NSArray*)keys:(BOOL(^)(id key, id value))block;
- (NSArray*)values:(BOOL(^)(id key, id value))block;

@end

@interface FunkyMutableDictionaryUtilities : FunkyDictionaryUtilities

@property (nonatomic, strong) NSMutableDictionary* object;

- (void)merge:(NSDictionary*)dictionary;
- (void)filter:(BOOL(^)(id key, id value))block;

@end
