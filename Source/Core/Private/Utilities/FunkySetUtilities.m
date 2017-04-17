//
//  FunkySetUtilities.m
//  Pods
//
//  Created by László Teveli on 2017. 04. 04..
//
//

#import "FunkySetUtilities.h"

@implementation FunkySetUtilities

@synthesize object = _set;

- (NSDictionary *)groupBy:(id (^)(id))block
{
    NSMutableDictionary* dictionary = [NSMutableDictionary dictionaryWithCapacity:self.object.count];
    
    [self forEach:^(id item) {
        id key = block(item);
        if (dictionary[key] == nil) {
            dictionary[key] = item;
        }
    }];
    
    return dictionary.copy;
}

- (NSSet *)takingUnion:(NSSet *)set
{
    NSMutableSet* mutableSet = [self.object mutableCopy];
    [mutableSet unionSet:set];
    return mutableSet.copy;
}

- (NSSet *)takingMinus:(NSSet *)set
{
    NSMutableSet* mutableSet = [self.object mutableCopy];
    [mutableSet minusSet:set];
    return mutableSet.copy;
}

- (NSSet *)takingIntersection:(NSSet *)set
{
    NSMutableSet* mutableSet = [self.object mutableCopy];
    [mutableSet intersectSet:set];
    return mutableSet.copy;
}

@end

@implementation FunkyMutableSetUtilities

@synthesize object = _mutableSet;

- (void)takeUnion:(NSSet *)set
{
    [self.object unionSet:set];
}

- (void)takeMinus:(NSSet *)set
{
    [self.object minusSet:set];
}

- (void)takeIntersection:(NSSet *)set
{
    [self.object intersectSet:set];
}

- (void)filter:(BOOL (^)(id))block
{
    [self forEach:^(id item) {
        if (!block(item)) {
            [self.object removeObject:item];
        }
    }];
}

- (void)flatten
{
    [self forEach:^(id item) {
        if ([item isKindOfClass:[self.object.class classToFlatten]]) {
            FunkySetUtilities* utilsForItem = [FunkySetUtilities utilitiesWithObject:[[item reverseObjectEnumerator] allObjects]];
            [self.object removeObject:item];
            for (id current in [utilsForItem flattened]) {
                [self.object addObject:current];
            }
        }
    }];
}

@end
