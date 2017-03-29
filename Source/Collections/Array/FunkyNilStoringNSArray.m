//
//  FunkyNilStoringNSArray.m
//  Pods
//
//  Created by László Teveli on 2017. 03. 21..
//
//

#import "FunkyNilStoringNSArray.h"

#pragma mark - NSArray Subclasses

@implementation FunkyNilStoringNSArray

+ (instancetype)arrayWithObject:(id)anObject
{
    return [super arrayWithObject:anObject ?: [NSNull null]];
}

- (NSArray *)arrayByAddingObject:(id)anObject
{
    return [self.NSArray arrayByAddingObject:anObject ?: [NSNull null]].nilStoring;
}

- (id)objectAtIndex:(NSUInteger)index
{
    id object = [super objectAtIndex:index];
    if ([object isEqual:[NSNull null]])
        return nil;
    else
        return object;
}

- (NSUInteger)indexOfObject:(id)anObject inRange:(NSRange)range
{
    return [super indexOfObject:anObject ?: [NSNull null] inRange:range];
}

- (NSUInteger)indexOfObjectIdenticalTo:(id)anObject inRange:(NSRange)range
{
    return [super indexOfObjectIdenticalTo:anObject ?: [NSNull null] inRange:range];
}

#pragma mark - Counterpart

+ (Class)classForImmutableCounterPart
{
    return [FunkyNilStoringNSArray class];
}

+ (Class)classForMutableCounterPart
{
    return [FunkyNilStoringNSMutableArray class];
}

+ (Class)classToFlatten
{
    return [NSArray class];
}

@end

@implementation FunkyNilStoringNSMutableArray

+ (instancetype)arrayWithObject:(id)anObject
{
    return [super arrayWithObject:anObject ?: [NSNull null]];
}

- (NSArray *)arrayByAddingObject:(id)anObject
{
    return [self.NSMutableArray arrayByAddingObject:anObject ?: [NSNull null]].nilStoring;
}

- (id)objectAtIndex:(NSUInteger)index
{
    id object = [super objectAtIndex:index];
    if ([object isEqual:[NSNull null]])
        return nil;
    else
        return object;
}

- (NSUInteger)indexOfObject:(id)anObject inRange:(NSRange)range
{
    return [super indexOfObject:anObject ?: [NSNull null] inRange:range];
}

- (NSUInteger)indexOfObjectIdenticalTo:(id)anObject inRange:(NSRange)range
{
    return [super indexOfObjectIdenticalTo:anObject ?: [NSNull null] inRange:range];
}

- (id)mutableCopy
{
    return [FunkyNilStoringNSMutableArray arrayWithArray:self];
}

#pragma mark - 

- (void)addObject:(id)anObject
{
    return [super addObject:anObject ?: [NSNull null]];
}

- (void)insertObject:(id)anObject atIndex:(NSUInteger)index
{
    [super insertObject:anObject ?: [NSNull null] atIndex:index];
}

- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject
{
    [super replaceObjectAtIndex:index withObject:anObject ?: [NSNull null]];
}

#pragma mark - Counterpart

+ (Class)classForImmutableCounterPart
{
    return [FunkyNilStoringNSArray class];
}

+ (Class)classForMutableCounterPart
{
    return [FunkyNilStoringNSMutableArray class];
}

+ (Class)classToFlatten
{
    return [NSArray class];
}

@end

#pragma mark - NSArray Categories

@implementation NSArray (FunkyNilStoring)

- (FunkyNilStoringNSArray *)nilStoring
{
    return [FunkyNilStoringNSArray arrayWithArray:self];
}

@end

@implementation NSMutableArray (FunkyNilStoring)

- (FunkyNilStoringNSMutableArray *)nilStoring
{
    return [FunkyNilStoringNSMutableArray arrayWithArray:self];
}

@end
