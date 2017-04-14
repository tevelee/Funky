//
//  FunkyCollection.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 26..
//
//

#import <Foundation/Foundation.h>
#import "FunkyMutableCollectionWithCapacityProtocol.h"
#import "FunkyCollectionCounterpartProtocol.h"

@protocol FunkyMutableCollection;

@protocol FunkyCollection <NSFastEnumeration, FunkyCollectionCounterpart>

- (NSInteger)count;
- (id)copy;
- (id)mutableCopy;

@end

@protocol FunkyMutableCollection <FunkyCollection, FunkyMutableCollectionWithCapacity>

- (void)addObject:(id)object;
- (void)removeAllObjects;

@end
