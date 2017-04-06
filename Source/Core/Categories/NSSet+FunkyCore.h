//
//  NSSet+FunkyCore.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 26..
//
//

#import <Foundation/Foundation.h>
#import "FunkyCollectionCounterpartProtocol.h"
#import "FunkySetUtilities.h"

@interface NSSet (FunkyCore) <FunkyCollectionCounterpart>

- (FunkySetUtilities*)utilities;

@end

@interface NSMutableSet (FunkyCore)

- (FunkyMutableSetUtilities*)utilities;

@end
