//
//  NSArraySubclass.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 22..
//
//

#import <Foundation/Foundation.h>
#import "FunkyCollectionCounterpartProtocol.h"

@interface FunkyNSArraySubclass : NSArray <FunkyCollectionCounterpart>

- (NSArray*)NSArray;

@end
