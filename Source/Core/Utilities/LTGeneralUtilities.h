//
//  LTGeneralUtilities.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 26..
//
//

#import <Foundation/Foundation.h>
#import "LTCollectionCounterpartProtocol.h"

@interface LTGeneralUtilities : NSObject

+ (instancetype)utilitiesWithObject:(id<NSObject>)object;

- (id)apply:(void(^)(id item))block;

@end
