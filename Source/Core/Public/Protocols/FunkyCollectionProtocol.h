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

/**
 *  This is a protocol for generic collections.
 *
 *  @see Mutable counterpart `FunkyMutableCollection`
 */
@protocol FunkyCollection <NSFastEnumeration, FunkyCollectionCounterpart>

/**
 *  This method returns the number of elements in the collection.
 *
 *  @return The number of elements as an integer
 */
- (NSInteger)count;

/**
 *  This method returns an immutable version of the current collection
 *
 *  @return The same collection as an immutable type
 */
- (id)copy;

/**
 *  This method returns a mutable version of the current collection
 *
 *  @return The same collection as a mutable type
 */
- (id)mutableCopy;

@end

/**
 *  This is a protocol for generic collections.
 *
 *  @see Immutable counterpart `FunkyCollection`
 */
@protocol FunkyMutableCollection <FunkyCollection, FunkyMutableCollectionWithCapacity>

/**
 *  This method returns inserts an object into the collection
 *
 *  @param object The object to insert
 */
- (void)addObject:(id)object;

/**
 *  This method removes all the contents of the collection, providing an empty mutable collection
 */
- (void)removeAllObjects;

@end
