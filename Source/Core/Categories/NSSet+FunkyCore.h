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
#import "FunkyMutableCollectionWithCapacityProtocol.h"

@interface NSSet (FunkyCore) <FunkyCollectionCounterpart>

- (FunkySetUtilities*)utilities;

@end

@interface NSMutableSet (FunkyCore) <FunkyMutableCollectionWithCapacity>

- (FunkyMutableSetUtilities*)utilities;

@end
