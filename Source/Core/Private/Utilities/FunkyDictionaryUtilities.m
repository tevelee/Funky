//
//  FunkyDictionaryUtilities.m
//  Pods
//
//  Created by László Teveli on 2017. 03. 26..
//
//

#import "FunkyDictionaryUtilities.h"

@implementation FunkyDictionaryUtilities

@synthesize object = _dictionary;

- (id)mapToAnother:(void(^)(id key, id value, NSMutableDictionary* mutableDictionary))block
{
    NSMutableDictionary* mutableDictionary = [NSMutableDictionary dictionaryWithCapacity:self.object.count];
    
    [self forEach:^(id key, id value) {
        block(key, value, mutableDictionary);
    }];
    
    return mutableDictionary.copy;
}

- (NSDictionary*)nilTolerantMap:(FunkyPair*(^)(id key, id value))block
{
    return [self mapToAnother:^(id key, id value, NSMutableDictionary *mutableDictionary) {
        FunkyPair* pair = block(key, value);
        if (pair.key && pair.value) {
            mutableDictionary[pair.key] = pair.value;
        }
    }];
}

- (NSDictionary*)map:(FunkyPair*(^)(id key, id value))block
{
    return [self mapToAnother:^(id key, id value, NSMutableDictionary *mutableDictionary) {
        FunkyPair* pair = block(key, value);
        mutableDictionary[pair.key] = pair.value;
    }];
}

- (NSDictionary*)merged:(NSDictionary*)other
{
    NSMutableDictionary* mutableDictionary = [self.object mutableCopy];
    [mutableDictionary addEntriesFromDictionary:other];
    return mutableDictionary.copy;
}

- (void)forEach:(void(^)(id key, id value))block
{
    for (id key in self.object) {
        block(key, self.object[key]);
    }
}

- (NSDictionary*)invertedObjectsAndKeys
{
    return [self map:^FunkyPair *(id key, id value) {
        return [FunkyPair pairWithKey:value value:key];
    }];
}

- (NSDictionary*)filtered:(BOOL(^)(id key, id value))block
{
    return [self mapToAnother:^(id key, id value, NSMutableDictionary *mutableDictionary) {
        if (block(key, value)) {
            mutableDictionary[key] = value;
        }
    }];
}

- (BOOL)contains:(BOOL (^)(id key, id value))block
{
    for (id key in self.object) {
        id item = self.object[key];
        if (block(key, item)) {
            return YES;
        }
    }
    return NO;
}

- (BOOL)all:(BOOL (^)(id key, id value))block
{
    for (id key in self.object) {
        id item = self.object[key];
        if (!block(key, item)) {
            return NO;
        }
    }
    return YES;
}

- (BOOL)none:(BOOL (^)(id key, id value))block
{
    for (id key in self.object) {
        id item = self.object[key];
        if (block(key, item)) {
            return NO;
        }
    }
    return YES;
}

- (NSInteger)count:(BOOL (^)(id key, id value))block
{
    NSInteger count = 0;
    for (id key in self.object) {
        id item = self.object[key];
        if (block(key, item)) {
            count++;
        }
    }
    return count;
}

- (id)reduce:(id(^)(id previousValue, id key, id value))block withInitialValue:(id)start
{
    __block id mutatingValue = start;
    [self forEach:^(id key, id value) {
        mutatingValue = block(mutatingValue, key, value);
    }];
    return mutatingValue;
}

- (NSSet*)keys:(BOOL(^)(id key, id value))block
{
    NSMutableSet* keys = [NSMutableSet setWithCapacity:self.object.count];
    for (id key in self.object) {
        id value = self.object[key];
        if (block(key, value)) {
            [keys addObject:key];
        }
    }
    return keys.copy;
}

- (NSSet*)values:(BOOL(^)(id key, id value))block
{
    NSMutableSet* values = [NSMutableSet setWithCapacity:self.object.count];
    for (id key in self.object) {
        id value = self.object[key];
        if (block(key, value)) {
            [values addObject:value];
        }
    }
    return values.copy;
}

@end

@implementation FunkyMutableDictionaryUtilities

@synthesize object = _mutableDictionary;

- (void)merge:(NSDictionary*)dictionary
{
    [self.object addEntriesFromDictionary:dictionary];
}

- (void)filter:(BOOL(^)(id key, id value))block
{
    NSSet* keys = [self keys:block];
    [self.object removeObjectsForKeys:keys.allObjects];
}

@end
