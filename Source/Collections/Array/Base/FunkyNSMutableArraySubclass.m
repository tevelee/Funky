//
//  NSMutableArraySubclass.m
//  Pods
//
//  Created by László Teveli on 2017. 03. 22..
//
//

#import "FunkyNSMutableArraySubclass.h"
#import "FunkyNSArraySubclass.h"
#import "FunkyCollectionCounterpartProtocol.h"

@interface FunkyNSMutableArraySubclass () <FunkyCollectionCounterpart>

@property (nonatomic, strong, readonly) NSMutableArray *backingArray;

@end

@implementation FunkyNSMutableArraySubclass

- (NSMutableArray *)NSMutableArray
{
    return [NSMutableArray arrayWithArray:self.backingArray];
}

#pragma mark - NSArray initializers

- (instancetype)initWithCapacity:(NSUInteger)numItems
{
    self = [super init];
    
    if (self) {
        _backingArray = [NSMutableArray arrayWithCapacity:numItems];
    }
    
    return self;
}

- (instancetype)initWithArray:(NSArray *)array
{
    self = [super init];
    
    if (self) {
        _backingArray = [NSMutableArray arrayWithArray:array];
    }
    
    return self;
}

#pragma mark - NSArray primitives

- (instancetype)initWithObjects:(const id [])objects count:(NSUInteger)count
{
    NSArray *array = [[NSArray alloc] initWithObjects: objects count: count];
    return [self initWithArray:array];
}

- (NSUInteger)count
{
    return self.backingArray.count;
}

- (id)objectAtIndex:(NSUInteger)index
{
    return [self.backingArray objectAtIndex: index];
}

#pragma mark - NSMutableArray primitives

- (void)insertObject:(id)anObject atIndex:(NSUInteger)index
{
    [self.backingArray insertObject:anObject atIndex:index];
}

- (void)removeObjectAtIndex:(NSUInteger)index
{
    [self.backingArray removeObjectAtIndex:index];
}

- (void)addObject:(id)anObject
{
    [self.backingArray addObject:anObject];
}

- (void)removeLastObject
{
    [self.backingArray removeLastObject];
}

- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject
{
    [self.backingArray replaceObjectAtIndex:index withObject:anObject];
}

#pragma mark - Counterpart

+ (Class)classForImmutableCounterPart
{
    return [FunkyNSArraySubclass class];
}

+ (Class)classForMutableCounterPart
{
    return [FunkyNSMutableArraySubclass class];
}

+ (Class)classToFlatten
{
    return [FunkyNSArraySubclass class];
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone
{
    return [[[self.class classForImmutableCounterPart] allocWithZone: zone] initWithArray:self];
}

#pragma mark - NSMutableCopying

- (id)mutableCopyWithZone:(NSZone *)zone
{
    return [[[self.class classForMutableCounterPart] allocWithZone: zone] initWithArray:self];
}

#pragma mark - NSCoding

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-designated-initializers"
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    NSArray *original = [[NSArray alloc] initWithCoder:aDecoder];
    return [self initWithArray:original];
}
#pragma clang diagnostic pop

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    // Cannot encode the mapper block so encode the mapped array as an NSArray instead
    NSArray *mapped = [[NSArray alloc] initWithArray:self];
    [mapped encodeWithCoder:aCoder];
}

@end
