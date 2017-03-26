//
//  LTCollection.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 26..
//
//

#import <Foundation/Foundation.h>
#import "LTMutableCollectionWithCapacityProtocol.h"

@protocol LTMutableCollection;

@protocol LTCollection <NSFastEnumeration, LTCollectionCounterpart>

- (NSInteger)count;
- (id<LTCollection>)copy;
- (id<LTMutableCollection>)mutableCopy;

@end

@protocol LTMutableCollection <LTCollection, LTMutableCollectionWithCapacity>

- (void)addObject:(id)object;
- (void)removeAllObjects;

@end
