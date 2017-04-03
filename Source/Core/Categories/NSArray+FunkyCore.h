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

@interface NSArray (FunkyCore) <FunkyCollectionCounterpart>

- (FunkyArrayUtilities*)utilities;

@end

@interface NSMutableArray (FunkyCore)

- (FunkyMutableArrayUtilities*)utilities;

@end
