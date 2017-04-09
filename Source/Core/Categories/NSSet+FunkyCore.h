//
//  NSSet+FunkyCore.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 26..
//
//

#import <Foundation/Foundation.h>
#import "FunkyCollectionProtocol.h"
#import "FunkySetUtilities.h"
#import "FunkyMutableCollectionWithCapacityProtocol.h"

@interface NSSet (FunkyCore) <FunkyCollection>

- (FunkySetUtilities*)utilities;

@end

@interface NSMutableSet (FunkyCore) <FunkyMutableCollectionWithCapacity>

- (FunkyMutableSetUtilities*)utilities;

@end
