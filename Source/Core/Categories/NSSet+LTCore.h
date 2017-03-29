//
//  NSSet+LTCore.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 26..
//
//

#import <Foundation/Foundation.h>
#import "LTCollectionCounterpartProtocol.h"
#import "LTCollectionUtilities.h"

@interface NSSet (LTCore) <LTCollectionCounterpart>

- (LTCollectionUtilities*)utilities;

@end
