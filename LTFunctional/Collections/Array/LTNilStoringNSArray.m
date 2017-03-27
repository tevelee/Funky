//
//  LTNilStoringNSArray.m
//  Pods
//
//  Created by László Teveli on 2017. 03. 21..
//
//

#import "LTNilStoringNSArray.h"

#pragma mark - NSArray Subclasses

@implementation LTNilStoringNSArray

+ (instancetype)arrayWithObject:(id)anObject
{
    return [super arrayWithObject:anObject ?: [NSNull null]];
}

- (NSArray *)arrayByAddingObject:(id)anObject
{
    return [super arrayByAddingObject:anObject ?: [NSNull null]];
}

- (NSArray *)arrayByAddingObjectsFromArray:(NSArray *)otherArray
{
    if (otherArray == nil)
        return self;
    else
        return [super arrayByAddingObjectsFromArray:otherArray];
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
    return [LTNilStoringNSArray class];
}

+ (Class)classForMutableCounterPart
{
    return [LTNilStoringNSMutableArray class];
}

+ (Class)classToFlatten
{
    return [NSArray class];
}

@end

@implementation LTNilStoringNSMutableArray

+ (instancetype)arrayWithObject:(id)anObject
{
    return [super arrayWithObject:anObject ?: [NSNull null]];
}

- (NSArray *)arrayByAddingObject:(id)anObject
{
    return [super arrayByAddingObject:anObject ?: [NSNull null]];
}

- (NSArray *)arrayByAddingObjectsFromArray:(NSArray *)otherArray
{
    if (otherArray == nil)
        return self;
    else
        return [super arrayByAddingObjectsFromArray:otherArray];
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
    return [LTNilStoringNSMutableArray arrayWithArray:self];
}

#pragma mark - 

- (void)addObject:(id)anObject
{
    return [super addObject:anObject ?: [NSNull null]];
}

- (void)addObjectsFromArray:(NSArray *)otherArray
{
    if (otherArray != nil)
        [super addObjectsFromArray:otherArray];
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
    return [LTNilStoringNSArray class];
}

+ (Class)classForMutableCounterPart
{
    return [LTNilStoringNSMutableArray class];
}

+ (Class)classToFlatten
{
    return [NSArray class];
}

@end

#pragma mark - NSArray Categories

@implementation NSArray (LTNilStoring)

- (LTNilStoringNSArray *)nilStoring
{
    return [LTNilStoringNSArray arrayWithArray:self];
}

@end

@implementation NSMutableArray (LTNilStoring)

- (LTNilStoringNSMutableArray *)nilStoring
{
    return [LTNilStoringNSMutableArray arrayWithArray:self];
}

@end
