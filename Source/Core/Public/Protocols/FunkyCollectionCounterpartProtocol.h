//
//  Counterpart.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 22..
//
//

#import <Foundation/Foundation.h>

/**
 *  This is a protocol for generic collections to provide information about their mutable and immutable counterparts.
 */
@protocol FunkyCollectionCounterpart <NSObject>

/**
 *  This method returns the immutable counterpart of the collection, eg. NSMutalbeArray
 *
 *  @return The Class of the immutable counterpart
 */
+ (Class)classForImmutableCounterPart;

/**
 *  This method returns the mutable counterpart of the collection, eg. NSArray
 *
 *  @return The Class of the mutable counterpart
 */
+ (Class)classForMutableCounterPart;

/**
 *  This method returns the common type (usually class-cluster) to be processed when flattening the collection
 *
 *  @return The Class of the instances to flatten
 */
+ (Class)classToFlatten;

@end

