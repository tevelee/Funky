//
//  CollectionUtilities.m
//  Pods
//
//  Created by László Teveli on 2017. 03. 21..
//
//

#import "CollectionUtilities.h"

@interface CollectionUtilities ()

@property (nonatomic, strong) id<Collection> collection;

@end

@implementation CollectionUtilities

+ (instancetype)utilitiesWithCollection:(id<Collection>)collection
{
    return [[self alloc] initWithCollection:collection];
}

- (instancetype)initWithCollection:(id<Collection>)collection
{
    self = [super init];
    if (self) {
        self.collection = collection;
    }
    return self;
}

- (id)map:(id(^)(id item))block
{
    id<MutableCollection> mutableCollection = [[self.collection.class classForMutableCounterPart] new];
    
    for (id item in self.collection) {
        id mapped = block(item);
        [mutableCollection addObject:mapped];
    }
    
    return mutableCollection.copy;
}

@end
