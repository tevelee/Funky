//
//  FunkyNilStoringNSSet.m
//  Pods
//
//  Created by László Teveli on 2017. 04. 03..
//
//

#import "FunkyNilStoringNSSet.h"
#import "FunkyNull.h"

@implementation FunkyNilStoringNSSet

+ (instancetype)setWithObject:(id)object
{
    return [super setWithObject:object ?: [FunkyNull null]];
}

- (NSSet *)setByAddingObject:(id)anObject
{
    return [self.NSSet setByAddingObject:anObject ?: [FunkyNull null]].nilStoring;
}

- (id)anyObject
{
    id object = [super anyObject];
    if ([object isEqual:[FunkyNull null]])
        return nil;
    else
        return object;
}

- (BOOL)containsObject:(id)anObject
{
    return [super containsObject:anObject ?: [FunkyNull null]];
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
    return [super setWithObject:object ?: [FunkyNull null]];
}

- (NSSet *)setByAddingObject:(id)anObject
{
    return [self.NSMutableSet setByAddingObject:anObject ?: [FunkyNull null]].nilStoring;
}

- (id)anyObject
{
    id object = [super anyObject];
    if ([object isEqual:[FunkyNull null]])
        return nil;
    else
        return object;
}

- (BOOL)containsObject:(id)anObject
{
    return [super containsObject:anObject ?: [FunkyNull null]];
}

#pragma mark -

- (void)addObject:(id)anObject
{
    return [super addObject:anObject ?: [FunkyNull null]];
}

- (void)removeObject:(id)object
{
    return [super removeObject:object ?: [FunkyNull null]];
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

+ (FunkyNilStoringNSSet *)nilStoringSet
{
    return [FunkyNilStoringNSSet set];
}

@end

@implementation NSMutableSet (FunkyNilStoring)

- (FunkyNilStoringNSMutableSet *)nilStoring
{
    return [FunkyNilStoringNSMutableSet setWithSet:self];
}

+ (FunkyNilStoringNSMutableSet *)nilStoringSet
{
    return [FunkyNilStoringNSMutableSet set];
}

+ (FunkyNilStoringNSMutableSet *)nilStoringSetWithCapacity:(NSUInteger)capacity
{
    return [FunkyNilStoringNSMutableSet setWithCapacity:capacity];
}

@end
