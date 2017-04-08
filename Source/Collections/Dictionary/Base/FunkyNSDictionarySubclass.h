//
//  FunkyNSDictionarySubclass.h
//  Pods
//
//  Created by László Teveli on 2017. 04. 03..
//
//

#import <Foundation/Foundation.h>
#import "FunkyCollectionCounterpartProtocol.h"

@interface FunkyNSDictionarySubclass : NSDictionary <FunkyCollectionCounterpart>

- (NSDictionary*)NSDictionary;

@end
