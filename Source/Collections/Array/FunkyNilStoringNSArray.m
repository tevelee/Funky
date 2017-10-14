//
//  FunkyNilStoringNSArray.m
//  Pods
//
//  Created by László Teveli on 2017. 03. 21..
//
//

#import "FunkyNilStoringNSArray.h"
#import "FunkyNull.h"

#pragma mark - NSArray Subclasses

@implementation FunkyNilStoringNSArray

+ (instancetype)arrayWithObject:(id)anObject
{
    return [super arrayWithObject:anObject ?: [FunkyNull null]];
}

- (NSArray *)arrayByAddingObject:(id)anObject
{
    return [self.NSArray arrayByAddingObject:anObject ?: [FunkyNull null]].nilStoring;
}

- (id)objectAtIndex:(NSUInteger)index
{
    id object = [super objectAtIndex:index];
    if ([object isEqual:[FunkyNull null]])
        return nil;
    else
        return object;
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
    return [super arrayWithObject:anObject ?: [FunkyNull null]];
}

- (NSArray *)arrayByAddingObject:(id)anObject
{
    return [self.NSMutableArray arrayByAddingObject:anObject ?: [FunkyNull null]].nilStoring;
}

- (id)objectAtIndex:(NSUInteger)index
{
    id object = [super objectAtIndex:index];
    if ([object isEqual:[FunkyNull null]])
        return nil;
    else
        return object;
}

- (id)mutableCopy
{
    return [FunkyNilStoringNSMutableArray arrayWithArray:self];
}

#pragma mark - 

- (void)addObject:(id)anObject
{
    return [super addObject:anObject ?: [FunkyNull null]];
}

- (void)insertObject:(id)anObject atIndex:(NSUInteger)index
{
    [super insertObject:anObject ?: [FunkyNull null] atIndex:index];
}

- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject
{
    [super replaceObjectAtIndex:index withObject:anObject ?: [FunkyNull null]];
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

+ (FunkyNilStoringNSArray *)nilStoringArray
{
    return [FunkyNilStoringNSArray array];
}

@end

@implementation NSMutableArray (FunkyNilStoring)

- (FunkyNilStoringNSMutableArray *)nilStoring
{
    return [FunkyNilStoringNSMutableArray arrayWithArray:self];
}

+ (FunkyNilStoringNSMutableArray *)nilStoringArray
{
    return [FunkyNilStoringNSMutableArray array];
}

+ (FunkyNilStoringNSMutableArray *)nilStoringArrayWithCapacity:(NSUInteger)capacity
{
    return [FunkyNilStoringNSMutableArray arrayWithCapacity:capacity];
}

@end
