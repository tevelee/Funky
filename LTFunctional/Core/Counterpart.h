//
//  Counterpart.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 22..
//
//

#import <Foundation/Foundation.h>

@protocol Counterpart <NSObject>

+ (Class)classForImmutableCounterPart;
+ (Class)classForMutableCounterPart;

@end

@protocol MutableCollection;

@protocol Collection <NSFastEnumeration, Counterpart>

- (id<Collection>)copy;
- (id<MutableCollection>)mutableCopy;

@end

@protocol MutableCollection <Collection>

- (void)addObject:(id)object;

@end
