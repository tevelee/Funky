//
//  FunkyNilStoringNSDictionary.m
//  Pods
//
//  Created by László Teveli on 2017. 04. 03..
//
//

#import "FunkyNilStoringNSDictionary.h"
#import "FunkyNull.h"

@implementation FunkyNilStoringNSDictionary

- (id)objectForKey:(id)aKey
{
    id object = [super objectForKey:aKey ?: [FunkyNull null]];
    return [object isEqual:[FunkyNull null]] ? nil : object;
}

+ (instancetype)dictionaryWithObject:(id)object forKey:(id<NSCopying>)key
{
    return [super dictionaryWithObject:object ?: [FunkyNull null] forKey:key ?: [FunkyNull null]];
}

- (NSArray *)allKeysForObject:(id)anObject
{
    return [super allKeysForObject:anObject ?: [FunkyNull null]];
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
    id object = [super objectForKey:aKey ?: [FunkyNull null]];
    return [object isEqual:[FunkyNull null]] ? nil : object;
}

+ (instancetype)dictionaryWithObject:(id)object forKey:(id<NSCopying>)key
{
    return [super dictionaryWithObject:object ?: [FunkyNull null] forKey:key ?: [FunkyNull null]];
}

- (NSArray *)allKeysForObject:(id)anObject
{
    return [super allKeysForObject:anObject ?: [FunkyNull null]];
}

#pragma mark -

- (void)setObject:(id)anObject forKey:(id<NSCopying>)aKey
{
    [super setObject:anObject ?: [FunkyNull null] forKey:aKey ?: [FunkyNull null]];
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

+ (FunkyNilStoringNSDictionary *)nilStoringDictionary
{
    return [FunkyNilStoringNSDictionary dictionary];
}

+ (FunkyNilStoringNSDictionary *)nilStoringDictionaryWithObject:(id)object forKey:(id<NSCopying>)key
{
    return [FunkyNilStoringNSDictionary dictionaryWithObject:object forKey:key];
}

+ (FunkyNilStoringNSDictionary *)nilStoringDictionaryWithDictionary:(NSDictionary *)dictionary
{
    return [FunkyNilStoringNSDictionary dictionaryWithDictionary:dictionary];
}

@end

@implementation NSMutableDictionary (FunkyNilStoring)

- (FunkyNilStoringNSMutableDictionary *)nilStoring
{
    return [FunkyNilStoringNSMutableDictionary dictionaryWithDictionary:self];
}

+ (FunkyNilStoringNSMutableDictionary *)nilStoringDictionary
{
    return [FunkyNilStoringNSMutableDictionary dictionary];
}

+ (FunkyNilStoringNSMutableDictionary *)nilStoringDictionaryWithCapacity:(NSUInteger)capacity
{
    return [FunkyNilStoringNSMutableDictionary dictionaryWithCapacity:capacity];
}

+ (FunkyNilStoringNSMutableDictionary *)nilStoringDictionaryWithObject:(id)object forKey:(id<NSCopying>)key
{
    return [FunkyNilStoringNSMutableDictionary dictionaryWithObject:object forKey:key];
}

+ (FunkyNilStoringNSMutableDictionary *)nilStoringDictionaryWithDictionary:(NSDictionary *)dictionary
{
    return [FunkyNilStoringNSMutableDictionary dictionaryWithDictionary:dictionary];
}

@end
