//
//  FunkyNSDictionarySubclass.m
//  Pods
//
//  Created by László Teveli on 2017. 04. 03..
//
//

#import "FunkyNSDictionarySubclass.h"
#import "FunkyNSMutableDictionarySubclass.h"

@interface FunkyNSDictionarySubclass ()

@property (nonatomic, strong, readonly) NSDictionary *backingDictionary;

@end

@implementation FunkyNSDictionarySubclass

- (NSDictionary *)NSDictionary
{
    return [NSDictionary dictionaryWithDictionary:self.backingDictionary];
}

#pragma mark - NSDictionary initializers

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    
    if (self == nil) {
        return nil;
    }
    
    _backingDictionary = [NSDictionary dictionaryWithDictionary:dictionary];
    
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

#pragma mark - Counterpart

+ (Class)classForImmutableCounterPart
{
    return [FunkyNSDictionarySubclass class];
}

+ (Class)classForMutableCounterPart
{
    return [FunkyNSMutableDictionarySubclass class];
}

#pragma mark - <NSCopying>

- (id)copyWithZone:(NSZone *)zone
{
    return [[[self.class classForImmutableCounterPart] allocWithZone: zone] initWithDictionary:self];
}

#pragma mark - <NSMutableCopying>

- (id)mutableCopyWithZone:(NSZone *)zone
{
    return [[[self.class classForMutableCounterPart] allocWithZone: zone] initWithDictionary:self];
}

#pragma mark - <NSCoding>

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    NSDictionary *original = [[NSDictionary alloc] initWithCoder:aDecoder];
    return [self initWithDictionary:original];
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    // Cannot encode the mapper block so encode the mapped dictionary as an NSDictionary instead
    NSDictionary *mapped = [[NSDictionary alloc] initWithDictionary:self];
    [mapped encodeWithCoder:aCoder];
}

@end
