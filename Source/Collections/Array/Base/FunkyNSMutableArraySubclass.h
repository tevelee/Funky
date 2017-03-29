//
//  NSMutableArraySubclass.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 22..
//
//

#import <Foundation/Foundation.h>
#import "FunkyCollectionCounterpartProtocol.h"

@interface FunkyNSMutableArraySubclass : NSMutableArray <FunkyCollectionCounterpart>

- (NSMutableArray*)NSMutableArray;

@end
