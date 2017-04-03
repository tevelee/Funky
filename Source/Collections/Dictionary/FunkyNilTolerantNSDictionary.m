//
//  FunkyNilTolerantNSDictionary.m
//  Pods
//
//  Created by László Teveli on 2017. 04. 03..
//
//

#import "FunkyNilTolerantNSDictionary.h"

@implementation FunkyNilTolerantNSDictionary

- (id)objectForKey:(id)aKey
{
    if (aKey == nil)
        return nil;
    else
        return [super objectForKey:aKey];
}

+ (instancetype)dictionaryWithObject:(id)object forKey:(id<NSCopying>)key
{
    if (object == nil || key == nil)
        return [self dictionary];
    else
        return [super dictionaryWithObject:object forKey:key];
}

#pragma mark - Counterpart

+ (Class)classForImmutableCounterPart
{
    return [FunkyNilTolerantNSDictionary class];
}

+ (Class)classForMutableCounterPart
{
    return [FunkyNilTolerantNSMutableDictionary class];
}

+ (Class)classToFlatten
{
    return [NSDictionary class];
}

@end

@implementation FunkyNilTolerantNSMutableDictionary

+ (instancetype)dictionaryWithObject:(id)object forKey:(id<NSCopying>)key
{
    if (object == nil || key == nil)
        return [self dictionary];
    else
        return [super dictionaryWithObject:object forKey:key];
}

#pragma mark -

- (void)setObject:(id)anObject forKey:(id<NSCopying>)aKey
{
    if (anObject && aKey)
        [super setObject:anObject forKey:aKey];
}

- (void)addEntriesFromDictionary:(NSDictionary *)otherDictionary
{
    if (otherDictionary != nil)
        [super addEntriesFromDictionary:otherDictionary];
}

#pragma mark - Counterpart

+ (Class)classForImmutableCounterPart
{
    return [FunkyNilTolerantNSDictionary class];
}

+ (Class)classForMutableCounterPart
{
    return [FunkyNilTolerantNSMutableDictionary class];
}

+ (Class)classToFlatten
{
    return [NSDictionary class];
}

@end

#pragma mark - NSDictionary Categories

@implementation NSDictionary (FunkyNilTolerant)

- (FunkyNilTolerantNSDictionary *)nilTolerant
{
    return [FunkyNilTolerantNSDictionary dictionaryWithDictionary:self];
}

@end

@implementation NSMutableDictionary (FunkyNilTolerant)

- (FunkyNilTolerantNSMutableDictionary *)nilTolerant
{
    return [FunkyNilTolerantNSMutableDictionary dictionaryWithDictionary:self];
}

@end
