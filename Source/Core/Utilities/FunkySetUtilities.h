//
//  FunkySetUtilities.h
//  Pods
//
//  Created by László Teveli on 2017. 04. 04..
//
//

#import <Foundation/Foundation.h>
#import "FunkyCollectionUtilities.h"

@interface FunkySetUtilities : FunkyCollectionUtilities

- (NSDictionary*)groupBy:(id(^)(id item))block;

@end
