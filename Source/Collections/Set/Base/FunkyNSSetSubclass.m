//
//  FunkyNSSetSubclass.m
//  Pods
//
//  Created by László Teveli on 2017. 04. 03..
//
//

#import "FunkyNSSetSubclass.h"
#import "FunkyNSMutableSetSubclass.h"
#import "FunkyCollectionCounterpartProtocol.h"

@interface FunkyNSSetSubclass () <FunkyCollectionCounterpart>

@property (nonatomic, strong, readonly) NSSet *backingSet;

@end

@implementation FunkyNSSetSubclass

- (NSSet *)NSSet
{
    return [NSSet setWithSet:self.backingSet];
}

#pragma mark - NSSet initializers

- (instancetype)initWithSet:(NSSet *)set
{
    self = [super init];
    
    if (self == nil) {
        return nil;
    }
    
    _backingSet = [NSSet setWithSet:set];
    
    return self;
}

#pragma mark - NSSet primitives

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-designated-initializers"
- (instancetype)initWithObjects:(const id [])objects count:(NSUInteger)count
{
    NSSet *set = [[NSSet alloc] initWithObjects: objects count: count];
    return [self initWithSet:set];
}
#pragma clang diagnostic pop

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

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-designated-initializers"
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    NSSet *original = [[NSSet alloc] initWithCoder:aDecoder];
    return [self initWithSet:original];
}
#pragma clang diagnostic pop

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    // Cannot encode the mapper block so encode the mapped set as an NSSet instead
    NSSet *mapped = [[NSSet alloc] initWithSet:self];
    [mapped encodeWithCoder:aCoder];
}

@end
