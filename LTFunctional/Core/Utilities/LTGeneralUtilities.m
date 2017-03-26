//
//  LTGeneralUtilities.m
//  Pods
//
//  Created by László Teveli on 2017. 03. 26..
//
//

#import "LTGeneralUtilities.h"

@interface LTGeneralUtilities ()

@property (nonatomic, strong) id<NSObject> object;

@end

@implementation LTGeneralUtilities

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
