//
//  CollectionUtilities.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 21..
//
//

#import <Foundation/Foundation.h>
#import "Counterpart.h"

@interface CollectionUtilities : NSObject

+ (instancetype)utilitiesWithCollection:(id<Collection>)collection;

- (id)map:(id(^)(id item))block;

@end
