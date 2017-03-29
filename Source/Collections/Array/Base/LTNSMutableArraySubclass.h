//
//  NSMutableArraySubclass.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 22..
//
//

#import <Foundation/Foundation.h>
#import "LTCollectionCounterpartProtocol.h"

@interface LTNSMutableArraySubclass : NSMutableArray <LTCollectionCounterpart>

- (NSMutableArray*)NSMutableArray;

@end
