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

- (NSDictionary*)map:(FunkyPair*(^)(id key, id value))block;
- (NSDictionary*)merged:(NSDictionary*)other;
- (void)forEach:(void(^)(id key, id value))block;

- (NSDictionary*)invertedObjectsAndKeys;

- (NSDictionary*)filter:(BOOL(^)(id key, id value))block;
- (BOOL)all:(BOOL(^)(id key, id value))block;
- (BOOL)none:(BOOL(^)(id key, id value))block;
- (BOOL)contains:(BOOL(^)(id key, id value))block;
- (id)reduce:(id(^)(id previousValue, id key, id value))block withInitialValue:(id)start;

@end

@interface FunkyMutableDictionaryUtilities : FunkyDictionaryUtilities

@property (nonatomic, strong) NSMutableDictionary* object;

- (NSMutableDictionary*)merge:(NSDictionary*)dictionary;

@end
