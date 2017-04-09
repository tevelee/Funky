//
//  NSArray+FunkyCore.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 26..
//
//

#import <Foundation/Foundation.h>
#import "FunkyCollectionProtocol.h"
#import "FunkyArrayUtilities.h"
#import "FunkyMutableCollectionWithCapacityProtocol.h"

@interface NSArray (FunkyCore) <FunkyCollection>

- (FunkyArrayUtilities*)utilities;

@end

@interface NSMutableArray (FunkyCore) <FunkyMutableCollectionWithCapacity>

- (FunkyMutableArrayUtilities*)utilities;

@end
