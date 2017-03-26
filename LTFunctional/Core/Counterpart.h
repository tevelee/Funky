//
//  Counterpart.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 22..
//
//

#import <Foundation/Foundation.h>

@protocol Capacity <NSObject>

+ (id)newWithCapacity:(NSUInteger)capacity;

@end

@protocol Counterpart <NSObject>

+ (Class)classForImmutableCounterPart;
+ (Class)classForMutableCounterPart;
+ (Class)classToFlatten;

@end

@protocol MutableCollection;

@protocol Collection <NSFastEnumeration, Counterpart>

- (NSInteger)count;
- (id<Collection>)copy;
- (id<MutableCollection>)mutableCopy;

@end

@protocol MutableCollection <Collection, Capacity>

- (void)addObject:(id)object;
- (void)removeAllObjects;

@end
