//
//  FunkyNSMutableDictionarySubclass.h
//  Pods
//
//  Created by László Teveli on 2017. 04. 03..
//
//

#import <Foundation/Foundation.h>
#import "FunkyCollectionCounterpartProtocol.h"

@interface FunkyNSMutableDictionarySubclass : NSMutableDictionary <FunkyCollectionCounterpart>

- (NSMutableDictionary*)NSMutableDictionary;

@end
