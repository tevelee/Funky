//
//  FunkyGeneralUtilities.m
//  Pods
//
//  Created by László Teveli on 2017. 03. 26..
//
//

#import "FunkyGeneralUtilities.h"

@implementation FunkyGeneralUtilities

+ (instancetype)utilitiesWithObject:(id<NSObject>)object
{
    return [[self alloc] initWithObject:object];
}

- (instancetype)initWithObject:(id<NSObject>)object
{
    self = [super init];
    if (self) {
        self.object = object;
    }
    return self;
}

- (id)apply:(void (^)(id))block
{
    id object = self.object;
    block(object);
    return object;
}

@end
