//
//  NSDictionary+LTCore.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 29..
//
//

#import <Foundation/Foundation.h>
#import "LTCollectionCounterpartProtocol.h"
#import "LTDictionaryUtilities.h"

@interface NSDictionary (LTCore) <LTCollectionCounterpart>

- (LTDictionaryUtilities*)utilities;

@end
