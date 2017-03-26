//
//  NSArray+LTCore.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 26..
//
//

#import <Foundation/Foundation.h>
#import "LTCollectionCounterpartProtocol.h"
#import "LTArrayUtilities.h"

@interface NSArray (LTCore) <LTCollectionCounterpart>

- (LTArrayUtilities*)utilities;

@end
