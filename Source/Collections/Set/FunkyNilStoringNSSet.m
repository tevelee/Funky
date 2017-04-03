//
//  FunkyNilStoringNSSet.m
//  Pods
//
//  Created by László Teveli on 2017. 04. 03..
//
//

#import "FunkyNilStoringNSSet.h"

@implementation FunkyNilStoringNSSet

+ (instancetype)setWithObject:(id)object
{
    return [super setWithObject:object ?: [NSNull null]];
}

- (NSSet *)setByAddingObject:(id)anObject
{
    return [self.NSSet setByAddingObject:anObject ?: [NSNull null]].nilStoring;
}

- (id)member:(id)object
{
    id check = [super member:object];
    if ([check isEqual:[NSNull null]])
        return nil;
    else
        return object;
}

#pragma mark - Counterpart

+ (Class)classForImmutableCounterPart
{
    return [FunkyNilStoringNSSet class];
}

+ (Class)classForMutableCounterPart
{
    return [FunkyNilStoringNSMutableSet class];
}

+ (Class)classToFlatten
{
    return [NSSet class];
}

@end

@implementation FunkyNilStoringNSMutableSet

+ (instancetype)setWithObject:(id)object
{
    return [super setWithObject:object ?: [NSNull null]];
}

- (NSSet *)setByAddingObject:(id)anObject
{
    return [self.NSMutableSet setByAddingObject:anObject ?: [NSNull null]].nilStoring;
}

- (id)member:(id)object
{
    id check = [super member:object];
    if ([check isEqual:[NSNull null]])
        return nil;
    else
        return object;
}

#pragma mark -

- (void)addObject:(id)anObject
{
    return [super addObject:anObject ?: [NSNull null]];
}

- (void)removeObject:(id)object
{
    return [super removeObject:object ?: [NSNull null]];
}

#pragma mark - Counterpart

+ (Class)classForImmutableCounterPart
{
    return [FunkyNilStoringNSSet class];
}

+ (Class)classForMutableCounterPart
{
    return [FunkyNilStoringNSMutableSet class];
}

+ (Class)classToFlatten
{
    return [NSSet class];
}

@end

#pragma mark - NSSet Categories

@implementation NSSet (FunkyNilStoring)

- (FunkyNilStoringNSSet *)nilStoring
{
    return [FunkyNilStoringNSSet setWithSet:self];
}

@end

@implementation NSMutableSet (FunkyNilStoring)

- (FunkyNilStoringNSMutableSet *)nilStoring
{
    return [FunkyNilStoringNSMutableSet setWithSet:self];
}

@end
