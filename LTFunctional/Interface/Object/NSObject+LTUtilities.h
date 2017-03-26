//
//  NSObject+LTUtilities.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 26..
//
//

#import <Foundation/Foundation.h>

@interface NSObject (LTUtilities)

- (instancetype)apply:(void (^)(id object))block;

@end
