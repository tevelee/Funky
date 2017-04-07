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

- (NSDictionary*)funky_map:(FunkyPair*(^)(id key, id value))block
{
    return [self.utilities map:block];
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

- (NSDictionary*)funky_filter:(BOOL(^)(id key, id value))block
{
    return [self.utilities filter:block];
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

@end

@implementation NSMutableDictionary (FunkyUtilities)

#pragma mark - FunkyMutableCollectionWithCapacity

+ (id)funky_newWithCapacity:(NSUInteger)capacity
{
    return [self dictionaryWithCapacity:capacity];
}

#pragma mark - Utilities

- (NSMutableDictionary*)funky_merge:(NSDictionary *)dictionary
{
    return [self.utilities merge:dictionary];
}

@end
