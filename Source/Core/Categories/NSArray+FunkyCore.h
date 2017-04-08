//
//  NSArray+FunkyCore.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 26..
//
//

#import <Foundation/Foundation.h>
#import "FunkyCollectionCounterpartProtocol.h"
#import "FunkyArrayUtilities.h"
#import "FunkyMutableCollectionWithCapacityProtocol.h"

@interface NSArray (FunkyCore) <FunkyCollectionCounterpart>

- (FunkyArrayUtilities*)utilities;

@end

@interface NSMutableArray (FunkyCore) <FunkyMutableCollectionWithCapacity>

- (FunkyMutableArrayUtilities*)utilities;

@end
