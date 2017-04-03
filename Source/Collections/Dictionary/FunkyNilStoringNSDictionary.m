//
//  FunkyNilStoringNSDictionary.m
//  Pods
//
//  Created by László Teveli on 2017. 04. 03..
//
//

#import "FunkyNilStoringNSDictionary.h"

@implementation FunkyNilStoringNSDictionary

- (id)objectForKey:(id)aKey
{
    id object = [super objectForKey:aKey ?: [NSNull null]];
    return [object isEqual:[NSNull null]] ? nil : object;
}

+ (instancetype)dictionaryWithObject:(id)object forKey:(id<NSCopying>)key
{
    return [super dictionaryWithObject:object ?: [NSNull null] forKey:key ?: [NSNull null]];
}

- (NSArray *)allKeysForObject:(id)anObject
{
    return [super allKeysForObject:anObject ?: [NSNull null]];
}

#pragma mark - Counterpart

+ (Class)classForImmutableCounterPart
{
    return [FunkyNilStoringNSDictionary class];
}

+ (Class)classForMutableCounterPart
{
    return [FunkyNilStoringNSMutableDictionary class];
}

+ (Class)classToFlatten
{
    return [NSDictionary class];
}

@end

@implementation FunkyNilStoringNSMutableDictionary

- (id)objectForKey:(id)aKey
{
    id object = [super objectForKey:aKey ?: [NSNull null]];
    return [object isEqual:[NSNull null]] ? nil : object;
}

+ (instancetype)dictionaryWithObject:(id)object forKey:(id<NSCopying>)key
{
    return [super dictionaryWithObject:object ?: [NSNull null] forKey:key ?: [NSNull null]];
}

- (NSArray *)allKeysForObject:(id)anObject
{
    return [super allKeysForObject:anObject ?: [NSNull null]];
}

#pragma mark -

- (void)setObject:(id)anObject forKey:(id<NSCopying>)aKey
{
    [super setObject:anObject ?: [NSNull null] forKey:aKey ?: [NSNull null]];
}

#pragma mark - Counterpart

+ (Class)classForImmutableCounterPart
{
    return [FunkyNilStoringNSDictionary class];
}

+ (Class)classForMutableCounterPart
{
    return [FunkyNilStoringNSMutableDictionary class];
}

+ (Class)classToFlatten
{
    return [NSDictionary class];
}

@end

#pragma mark - NSDictionary Categories

@implementation NSDictionary (FunkyNilStoring)

- (FunkyNilStoringNSDictionary *)nilStoring
{
    return [FunkyNilStoringNSDictionary dictionaryWithDictionary:self];
}

@end

@implementation NSMutableDictionary (FunkyNilStoring)

- (FunkyNilStoringNSMutableDictionary *)nilStoring
{
    return [FunkyNilStoringNSMutableDictionary dictionaryWithDictionary:self];
}

@end
