//
//  NSArraySubclass.m
//  Pods
//
//  Created by László Teveli on 2017. 03. 22..
//
//

#import "FunkyNSArraySubclass.h"
#import "FunkyNSMutableArraySubclass.h"
#import "FunkyCollectionCounterpartProtocol.h"

@interface FunkyNSArraySubclass () <FunkyCollectionCounterpart>

@property (nonatomic, strong, readonly) NSArray *backingArray;

@end

@implementation FunkyNSArraySubclass

- (NSArray *)NSArray
{
    return [NSArray arrayWithArray:self.backingArray];
}

#pragma mark - NSArray initializers

- (instancetype)initWithArray:(NSArray *)array
{
    self = [super init];
    
    if (self == nil) {
        return nil;
    }
    
    _backingArray = [NSArray arrayWithArray:array];
    
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

#pragma mark - Counterpart

+ (Class)classForImmutableCounterPart
{
    return [FunkyNSArraySubclass class];
}

+ (Class)classForMutableCounterPart
{
    return [FunkyNSMutableArraySubclass class];
}

#pragma mark - <NSCopying>

- (id)copyWithZone:(NSZone *)zone
{
    return [[[self.class classForImmutableCounterPart] allocWithZone: zone] initWithArray:self];
}

#pragma mark - <NSMutableCopying>

- (id)mutableCopyWithZone:(NSZone *)zone
{
    return [[[self.class classForMutableCounterPart] allocWithZone: zone] initWithArray:self];
}

#pragma mark - <NSCoding>

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    NSArray *original = [[NSArray alloc] initWithCoder:aDecoder];
    return [self initWithArray:original];
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    // Cannot encode the mapper block so encode the mapped array as an NSArray instead
    NSArray *mapped = [[NSArray alloc] initWithArray:self];
    [mapped encodeWithCoder:aCoder];
}

@end
