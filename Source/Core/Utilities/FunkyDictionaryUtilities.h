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

- (NSDictionary*)map:(FunkyPair*(^)(id key, id value))block;
- (NSDictionary*)merge:(NSDictionary*)other;
- (void)forEach:(void(^)(id key, id value))block;

- (NSDictionary*)filter:(BOOL(^)(id key, id value))block;
- (BOOL)all:(BOOL(^)(id key, id value))block;
- (BOOL)none:(BOOL(^)(id key, id value))block;
- (BOOL)contains:(BOOL(^)(id key, id value))block;
- (id)reduce:(id(^)(id previousValue, id key, id value))block withInitialValue:(id)start;

@end
