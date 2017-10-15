//
//  NSDictionary+FunkyUtilities.m
//  Pods
//
//  Created by László Teveli on 2017. 03. 29..
//
//

#import "NSDictionary+FunkyPrefixedUtilities.h"
#import "NSDictionary+FunkyCore.h"

@implementation NSDictionary (FunkyPrefixedUtilities)

- (NSDictionary*)funky_map:(FunkyPair*(^)(id key, id value))block
{
    return [self.utilities map:block];
}

- (NSDictionary*)funky_nilTolerantMap:(FunkyPair *(^)(id, id))block
{
    return [self.utilities nilTolerantMap:block];
}

- (NSDictionary*)funky_merged:(NSDictionary*)other
{
    return [self.utilities merged:other];
}

- (void)funky_forEach:(void(^)(id key, id value))block
{
    return [self.utilities forEach:block];
}

- (NSDictionary*)funky_invertedObjectsAndKeys
{
    return [self.utilities invertedObjectsAndKeys];
}

- (NSDictionary*)funky_filtered:(BOOL(^)(id key, id value))block
{
    return [self.utilities filtered:block];
}

- (BOOL)funky_all:(BOOL(^)(id key, id value))block
{
    return [self.utilities all:block];
}

- (BOOL)funky_none:(BOOL(^)(id key, id value))block
{
    return [self.utilities none:block];
}

- (BOOL)funky_contains:(BOOL(^)(id key, id value))block
{
    return [self.utilities contains:block];
}

- (NSInteger)funky_count:(BOOL(^)(id key, id value))block
{
    return [self.utilities count:block];
}

- (id)funky_reduce:(id(^)(id previousValue, id key, id value))block withInitialValue:(id)start
{
    return [self.utilities reduce:block withInitialValue:start];
}

- (NSSet*)funky_keys:(BOOL(^)(id key, id value))block
{
    return [self.utilities keys:block];
}

- (NSSet*)funky_values:(BOOL(^)(id key, id value))block
{
    return [self.utilities values:block];
}

@end

@implementation NSMutableDictionary (FunkyPrefixedUtilities)

#pragma mark - Utilities

- (void)funky_merge:(NSDictionary *)dictionary
{
    [self.utilities merge:dictionary];
}

- (void)funky_filter:(BOOL(^)(id key, id value))block
{
    [self.utilities filter:block];
}

@end
