//
//  NSDictionary+FunkyUtilities.m
//  Pods
//
//  Created by László Teveli on 2017. 03. 29..
//
//

#import "NSDictionary+FunkyUtilities.h"
#import "NSDictionary+FunkyCore.h"

@implementation NSDictionary (FunkyUtilities)

- (NSDictionary*)map:(FunkyPair*(^)(id key, id value))block
{
    return [self.utilities map:block];
}

- (NSDictionary*)nilTolerantMap:(FunkyPair *(^)(id, id))block
{
    return [self.utilities nilTolerantMap:block];
}

- (NSDictionary*)merged:(NSDictionary*)other
{
    return [self.utilities merged:other];
}

- (void)forEach:(void(^)(id key, id value))block
{
    return [self.utilities forEach:block];
}

- (NSDictionary*)invertedObjectsAndKeys
{
    return [self.utilities invertedObjectsAndKeys];
}

- (NSDictionary*)filtered:(BOOL(^)(id key, id value))block
{
    return [self.utilities filtered:block];
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

- (NSInteger)count:(BOOL(^)(id key, id value))block
{
    return [self.utilities count:block];
}

- (id)reduce:(id(^)(id previousValue, id key, id value))block withInitialValue:(id)start
{
    return [self.utilities reduce:block withInitialValue:start];
}

- (NSSet*)keys:(BOOL(^)(id key, id value))block
{
    return [self.utilities keys:block];
}

- (NSSet*)values:(BOOL(^)(id key, id value))block
{
    return [self.utilities values:block];
}

@end

@implementation NSMutableDictionary (FunkyUtilities)

#pragma mark - Utilities

- (void)merge:(NSDictionary *)dictionary
{
    [self.utilities merge:dictionary];
}

- (void)filter:(BOOL(^)(id key, id value))block
{
    [self.utilities filter:block];
}

@end
