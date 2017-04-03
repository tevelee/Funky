//
//  FunkyNilTolerantNSSet.m
//  Pods
//
//  Created by László Teveli on 2017. 04. 03..
//
//

#import "FunkyNilTolerantNSSet.h"

@implementation FunkyNilTolerantNSSet

- (NSSet *)setByAddingObject:(id)anObject
{
    if (anObject == nil)
        return self;
    else
        return [super setByAddingObject:anObject];
}

+ (instancetype)setWithObject:(id)object
{
    if (object == nil)
        return [super set];
    else
        return [super setWithObject:object];
}

#pragma mark - Counterpart

+ (Class)classForImmutableCounterPart
{
    return [FunkyNilTolerantNSSet class];
}

+ (Class)classForMutableCounterPart
{
    return [FunkyNilTolerantNSMutableSet class];
}

+ (Class)classToFlatten
{
    return [NSSet class];
}

@end

@implementation FunkyNilTolerantNSMutableSet

- (NSSet *)setByAddingObject:(id)anObject
{
    if (anObject == nil)
        return self;
    else
        return [super setByAddingObject:anObject];
}

+ (instancetype)setWithObject:(id)object
{
    if (object == nil)
        return [super set];
    else
        return [super setWithObject:object];
}

#pragma mark -

- (void)addObject:(id)object
{
    if (object != nil)
        return [super addObject:object];
}

- (void)removeObject:(id)object
{
    if (object != nil)
        return [super removeObject:object];
}

#pragma mark - Counterpart

+ (Class)classForImmutableCounterPart
{
    return [FunkyNilTolerantNSSet class];
}

+ (Class)classForMutableCounterPart
{
    return [FunkyNilTolerantNSMutableSet class];
}

+ (Class)classToFlatten
{
    return [NSSet class];
}

@end

#pragma mark - NSSet Categories

@implementation NSSet (FunkyNilTolerant)

- (FunkyNilTolerantNSSet *)nilTolerant
{
    return [FunkyNilTolerantNSSet setWithSet:self];
}

@end

@implementation NSMutableSet (FunkyNilTolerant)

- (FunkyNilTolerantNSMutableSet *)nilTolerant
{
    return [FunkyNilTolerantNSMutableSet setWithSet:self];
}

@end
