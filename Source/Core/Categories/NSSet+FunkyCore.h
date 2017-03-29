//
//  NSSet+FunkyCore.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 26..
//
//

#import <Foundation/Foundation.h>
#import "FunkyCollectionCounterpartProtocol.h"
#import "FunkyCollectionUtilities.h"

@interface NSSet (FunkyCore) <FunkyCollectionCounterpart>

- (FunkyCollectionUtilities*)utilities;

@end
