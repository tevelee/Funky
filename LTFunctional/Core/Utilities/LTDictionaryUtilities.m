//
//  LTDictionaryUtilities.m
//  Pods
//
//  Created by László Teveli on 2017. 03. 26..
//
//

#import "LTDictionaryUtilities.h"

@interface LTDictionaryUtilities ()

@property (nonatomic, strong) NSDictionary* object;

@end

@implementation LTDictionaryUtilities

- (id)mapToAnother:(void(^)(id key, id value, NSMutableDictionary* mutableDictionary))block
{
    NSMutableDictionary* mutableDictionary = [NSMutableDictionary dictionaryWithCapacity:self.object.count];
    
    [self forEach:^(id key, id value) {
        block(key, value, mutableDictionary);
    }];
    
    return mutableDictionary.copy;
}

- (NSDictionary*)map:(LTPair*(^)(id key, id value))block
{
    return [self mapToAnother:^(id key, id value, NSMutableDictionary *mutableDictionary) {
        LTPair* pair = block(key, value);
        mutableDictionary[pair.key] = pair.value;
    }];
}

- (NSDictionary*)merge:(NSDictionary*)other
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

- (NSDictionary*)filter:(BOOL(^)(id key, id value))block
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

- (id)reduce:(id(^)(id previousValue, id key, id value))block withInitialValue:(id)start
{
    __block id mutatingValue = start;
    [self forEach:^(id key, id value) {
        mutatingValue = block(mutatingValue, key, value);
    }];
    return mutatingValue;
}

@end
