//
//  FunkyNSMutableSetSubclass.m
//  Pods
//
//  Created by László Teveli on 2017. 04. 03..
//
//

#import "FunkyNSMutableSetSubclass.h"
#import "FunkyNSSetSubclass.h"
#import "FunkyCollectionCounterpartProtocol.h"

@interface FunkyNSMutableSetSubclass () <FunkyCollectionCounterpart>

@property (nonatomic, strong, readonly) NSMutableSet *backingSet;

@end

@implementation FunkyNSMutableSetSubclass

- (NSMutableSet *)NSMutableSet
{
    return [NSMutableSet setWithSet:self.backingSet];
}

#pragma mark - NSSet initializers

- (instancetype)initWithCapacity:(NSUInteger)numItems
{
    self = [super init];
    
    if (self == nil) {
        return nil;
    }
    
    _backingSet = [NSMutableSet setWithCapacity:numItems];
    
    return self;
}

- (instancetype)initWithSet:(NSSet *)set
{
    self = [super init];
    
    if (self == nil) {
        return nil;
    }
    
    _backingSet = [NSMutableSet setWithSet:set];
    
    return self;
}

#pragma mark - NSSet primitives

- (instancetype)initWithObjects:(const id [])objects count:(NSUInteger)count
{
    NSSet *set = [[NSSet alloc] initWithObjects: objects count: count];
    return [self initWithSet:set];
}

- (NSUInteger)count
{
    return self.backingSet.count;
}

- (id)member:(id)object
{
    return [self.backingSet member:object];
}

- (NSEnumerator *)objectEnumerator
{
    return self.backingSet.objectEnumerator;
}

#pragma mark - NSMutableSet primitives

- (void)addObject:(id)object
{
    [self.backingSet addObject:object];
}

- (void)removeObject:(id)object
{
    [self.backingSet removeObject:object];
}

#pragma mark - Counterpart

+ (Class)classForImmutableCounterPart
{
    return [FunkyNSSetSubclass class];
}

+ (Class)classForMutableCounterPart
{
    return [FunkyNSMutableSetSubclass class];
}

+ (Class)classToFlatten
{
    return [FunkyNSSetSubclass class];
}

#pragma mark - <NSCopying>

- (id)copyWithZone:(NSZone *)zone
{
    return [[[self.class classForImmutableCounterPart] allocWithZone: zone] initWithSet:self];
}

#pragma mark - <NSMutableCopying>

- (id)mutableCopyWithZone:(NSZone *)zone
{
    return [[[self.class classForMutableCounterPart] allocWithZone: zone] initWithSet:self];
}

#pragma mark - <NSCoding>

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    NSSet *original = [[NSSet alloc] initWithCoder:aDecoder];
    return [self initWithSet:original];
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    // Cannot encode the mapper block so encode the mapped set as an NSSet instead
    NSSet *mapped = [[NSSet alloc] initWithSet:self];
    [mapped encodeWithCoder:aCoder];
}

@end
