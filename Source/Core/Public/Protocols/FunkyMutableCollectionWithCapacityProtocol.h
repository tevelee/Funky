//
//  FunkyMutableCollectionWithCapaticyProtocol.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 26..
//
//

#import <Foundation/Foundation.h>

/**
 *  This is a protocol for generic mutable collections to be initialised with capacity
 */
@protocol FunkyMutableCollectionWithCapacity <NSObject>

/**
 *  This method initialises a new instance with a given capacity
 *
 *  @param capacity The capacity-limit of the collection
 *  @return A new collection instance initialised with `capacity`
 */
+ (id)newWithCapacity:(NSUInteger)capacity;

@end
