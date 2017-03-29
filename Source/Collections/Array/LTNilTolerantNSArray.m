//
//  LTNilTolerantNSArray.m
//  Pods
//
//  Created by László Teveli on 2017. 03. 21..
//
//

#import "LTNilTolerantNSArray.h"

#pragma mark - NSArray Subclasses

@implementation LTNilTolerantNSArray

- (NSArray *)arrayByAddingObject:(id)anObject
{
    if (anObject == nil)
        return self;
    else
        return [super arrayByAddingObject:anObject];
}

+ (instancetype)arrayWithObject:(id)anObject
{
    if (anObject == nil)
        return [super array];
    else
        return [super arrayWithObject:anObject];
}

#pragma mark - Counterpart

+ (Class)classForImmutableCounterPart
{
    return [LTNilTolerantNSArray class];
}

+ (Class)classForMutableCounterPart
{
    return [LTNilTolerantNSMutableArray class];
}

+ (Class)classToFlatten
{
    return [NSArray class];
}

@end

@implementation LTNilTolerantNSMutableArray

- (NSArray *)arrayByAddingObject:(id)anObject
{
    if (anObject == nil)
        return self;
    else
        return [super arrayByAddingObject:anObject];
}

+ (instancetype)arrayWithObject:(id)anObject
{
    if (anObject == nil)
        return [super array];
    else
        return [super arrayWithObject:anObject];
}

#pragma mark -

- (void)addObject:(id)anObject
{
    if (anObject != nil)
        [super addObject:anObject];
}

- (void)insertObject:(id)anObject atIndex:(NSUInteger)index
{
    if (anObject != nil)
        [super insertObject:anObject atIndex:index];
}

- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject
{
    if (anObject != nil)
        [super replaceObjectAtIndex:index withObject:anObject];
}

#pragma mark - Counterpart

+ (Class)classForImmutableCounterPart
{
    return [LTNilTolerantNSArray class];
}

+ (Class)classForMutableCounterPart
{
    return [LTNilTolerantNSMutableArray class];
}

+ (Class)classToFlatten
{
    return [NSArray class];
}

@end

#pragma mark - NSArray Categories

@implementation NSArray (LTNilTolerant)

- (LTNilTolerantNSArray *)nilTolerant
{
    return [LTNilTolerantNSArray arrayWithArray:self];
}

@end

@implementation NSMutableArray (LTNilTolerant)

- (LTNilTolerantNSMutableArray *)nilTolerant
{
    return [LTNilTolerantNSMutableArray arrayWithArray:self];
}

@end
