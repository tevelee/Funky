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

@implementation NSMutableDictionary (FunkyUtilities)

#pragma mark - FunkyMutableCollectionWithCapacity

+ (id)newWithCapacity:(NSUInteger)capacity
{
    return [self dictionaryWithCapacity:capacity];
}

#pragma mark - Utilities

- (NSMutableDictionary*)merge:(NSDictionary *)dictionary
{
    return [self.utilities merge:dictionary];
}

@end
