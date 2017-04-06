//
//  FunkySetUtilities.m
//  Pods
//
//  Created by László Teveli on 2017. 04. 04..
//
//

#import "FunkySetUtilities.h"

@implementation FunkySetUtilities

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

- (NSMutableSet *)takeUnion:(NSSet *)set
{
    return [self apply:^(NSMutableSet* current) {
        [current unionSet:set];
    }];
}

- (NSMutableSet *)takeMinus:(NSSet *)set
{
    return [self apply:^(NSMutableSet* current) {
        [current minusSet:set];
    }];
}

- (NSMutableSet *)takeIntersection:(NSSet *)set
{
    return [self apply:^(NSMutableSet* current) {
        [current intersectSet:set];
    }];
}

@end
