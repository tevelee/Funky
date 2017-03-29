//
//  NSDictionary+LTUtilities.m
//  Pods
//
//  Created by László Teveli on 2017. 03. 29..
//
//

#import "NSDictionary+LTUtilities.h"
#import "NSDictionary+LTCore.h"

@implementation NSDictionary (LTUtilities)

- (NSDictionary*)map:(LTPair*(^)(id key, id value))block
{
    return [self.utilities map:block];
}

- (NSDictionary*)merge:(NSDictionary*)other
{
    return [self.utilities merge:other];
}

- (void)forEach:(void(^)(id key, id value))block
{
    return [self.utilities forEach:block];
}

- (NSDictionary*)filter:(BOOL(^)(id key, id value))block
{
    return [self.utilities filter:block];
}

- (BOOL)all:(BOOL(^)(id key, id value))block
{
    return [self.utilities all:block];
}

- (BOOL)none:(BOOL(^)(id key, id value))block
{
    return [self.utilities none:block];
}

- (BOOL)contains:(BOOL(^)(id key, id value))block
{
    return [self.utilities contains:block];
}

- (id)reduce:(id(^)(id previousValue, id key, id value))block withInitialValue:(id)start
{
    return [self.utilities reduce:block withInitialValue:start];
}

@end
