//
//  NSObject+FunkyUtilities.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 26..
//
//

#import <Foundation/Foundation.h>

@interface NSObject (FunkyPrefixedUtilities)

- (instancetype)funky_apply:(void (^)(id object))block;

@end
