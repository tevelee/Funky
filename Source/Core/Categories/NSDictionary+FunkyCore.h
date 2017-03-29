//
//  NSDictionary+FunkyCore.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 29..
//
//

#import <Foundation/Foundation.h>
#import "FunkyCollectionCounterpartProtocol.h"
#import "FunkyDictionaryUtilities.h"

@interface NSDictionary (FunkyCore) <FunkyCollectionCounterpart>

- (FunkyDictionaryUtilities*)utilities;

@end
