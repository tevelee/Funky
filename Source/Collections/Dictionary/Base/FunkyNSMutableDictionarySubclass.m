//
//  FunkyNSMutableDictionarySubclass.m
//  Pods
//
//  Created by László Teveli on 2017. 04. 03..
//
//

#import "FunkyNSMutableDictionarySubclass.h"
#import "FunkyNSDictionarySubclass.h"
#import "FunkyCollectionCounterpartProtocol.h"

@interface FunkyNSMutableDictionarySubclass () <FunkyCollectionCounterpart>

@property (nonatomic, strong, readonly) NSMutableDictionary *backingDictionary;

@end

@implementation FunkyNSMutableDictionarySubclass

- (NSMutableDictionary *)NSMutableDictionary
{
    return [NSMutableDictionary dictionaryWithDictionary:self.backingDictionary];
}

#pragma mark - NSDictionary initializers

- (instancetype)initWithCapacity:(NSUInteger)numItems
{
    self = [super init];
    
    if (self) {
        _backingDictionary = [NSMutableDictionary dictionaryWithCapacity:numItems];
    }
    
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    
    if (self) {
        _backingDictionary = [NSMutableDictionary dictionaryWithDictionary:dictionary];
    }
    
    return self;
}

#pragma mark - NSDictionary primitives

- (instancetype)initWithObjects:(const id [])objects forKeys:(id<NSCopying>  _Nonnull const __unsafe_unretained *)keys count:(NSUInteger)count
{
    NSDictionary *dictionary = [[NSDictionary alloc] initWithObjects: objects forKeys:keys count:count];
    return [self initWithDictionary:dictionary];
}

- (NSUInteger)count
{
    return self.backingDictionary.count;
}

- (id)objectForKey:(id)aKey
{
    return [self.backingDictionary objectForKey:aKey];
}

- (NSEnumerator *)keyEnumerator
{
    return self.backingDictionary.keyEnumerator;
}

#pragma mark - NSMutableDictionary primitives

- (void)setObject:(id)anObject forKey:(id<NSCopying>)aKey
{
    [self.backingDictionary setObject:anObject forKey:aKey];
}

- (void)removeObjectForKey:(id)aKey
{
    [self.backingDictionary removeObjectForKey:aKey];
}

#pragma mark - Counterpart

+ (Class)classForImmutableCounterPart
{
    return [FunkyNSDictionarySubclass class];
}

+ (Class)classForMutableCounterPart
{
    return [FunkyNSMutableDictionarySubclass class];
}

+ (Class)classToFlatten
{
    return [FunkyNSDictionarySubclass class];
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone
{
    return [[[self.class classForImmutableCounterPart] allocWithZone: zone] initWithDictionary:self];
}

#pragma mark - NSMutableCopying

- (id)mutableCopyWithZone:(NSZone *)zone
{
    return [[[self.class classForMutableCounterPart] allocWithZone: zone] initWithDictionary:self];
}

#pragma mark - NSCoding

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-designated-initializers"
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    NSDictionary *original = [[NSDictionary alloc] initWithCoder:aDecoder];
    return [self initWithDictionary:original];
}
#pragma clang diagnostic pop

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    // Cannot encode the mapper block so encode the mapped dictionary as an NSDictionary instead
    NSDictionary *mapped = [[NSDictionary alloc] initWithDictionary:self];
    [mapped encodeWithCoder:aCoder];
}

@end
