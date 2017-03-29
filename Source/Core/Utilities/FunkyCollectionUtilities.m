//
//  FunkyCollectionUtilities.m
//  Pods
//
//  Created by László Teveli on 2017. 03. 21..
//
//

#import "FunkyCollectionUtilities.h"

@interface FunkyCollectionUtilities ()

@property (nonatomic, strong) id<FunkyCollection> object;

@end

@implementation FunkyCollectionUtilities

- (id)mapToAnother:(void(^)(id item, id<FunkyMutableCollection> collection))block
{
    id<FunkyMutableCollection> mutableCollection = [[self.object.class classForMutableCounterPart] newWithCapacity:self.object.count];
    
    [self forEach:^(id item) {
        block(item, mutableCollection);
    }];
    
    return mutableCollection.copy;
}

- (id)map:(id(^)(id item))block
{
    return [self mapToAnother:^(id item, id<FunkyMutableCollection> collection) {
        id mapped = block(item);
        [collection addObject:mapped];
    }];
}

- (id)filter:(BOOL (^)(id))block
{
    return [self mapToAnother:^(id item, id<FunkyMutableCollection> collection) {
        BOOL isMatching = block(item);
        if (isMatching) {
            [collection addObject:item];
        }
    }];
}

- (BOOL)contains:(BOOL (^)(id))block
{
    for (id item in self.object) {
        if (block(item)) {
            return YES;
        }
    }
    return NO;
}

- (NSUInteger)count:(BOOL(^)(id item))block
{
    NSInteger count = 0;
    for (id item in self.object) {
        if (block(item)) {
            count++;
        }
    }
    return count;
}

- (BOOL)all:(BOOL (^)(id))block
{
    for (id item in self.object) {
        if (!block(item)) {
            return NO;
        }
    }
    return YES;
}

- (BOOL)none:(BOOL (^)(id))block
{
    for (id item in self.object) {
        if (block(item)) {
            return NO;
        }
    }
    return YES;
}

- (id)reduce:(id(^)(id, id))block withInitialValue:(id)start
{
    __block id mutatingValue = start;
    [self forEach:^(id item) {
        mutatingValue = block(mutatingValue, item);
    }];
    return mutatingValue;
}

- (id)flattened
{
    return [self mapToAnother:^(id item, id<FunkyMutableCollection> collection) {
        if ([item isKindOfClass:[collection.class classToFlatten]]) {
            FunkyCollectionUtilities* utilsForItem = [FunkyCollectionUtilities utilitiesWithObject:item];
            for (id current in [utilsForItem flattened]) {
                [collection addObject:current];
            }
        } else {
            [collection addObject:item];
        }
    }];
}

- (id)merge:(id)collection
{
    id<FunkyMutableCollection> mutableCollection = [self.object mutableCopy];
    
    for (id item in collection) {
        [mutableCollection addObject:item];
    }
    
    return mutableCollection.copy;
}

- (NSDictionary *)groupByUsingFirst:(id (^)(id))block
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

- (NSDictionary*)groupByUsingLast:(id (^)(id))block
{
    NSMutableDictionary* dictionary = [NSMutableDictionary dictionaryWithCapacity:self.object.count];
    
    [self forEach:^(id item) {
        id key = block(item);
        dictionary[key] = item;
    }];
    
    return dictionary.copy;
}

- (NSDictionary<id,NSArray *> *)associateBy:(id (^)(id))block
{
    NSMutableDictionary* dictionary = [NSMutableDictionary dictionaryWithCapacity:self.object.count];
    
    [self forEach:^(id item) {
        id key = block(item);
        id<FunkyCollection> items = dictionary[key] ?: [[self.object.class classForImmutableCounterPart] new];
        
        id<FunkyMutableCollection> mutableItems = [items mutableCopy];
        [mutableItems addObject:item];
        
        dictionary[key] = [mutableItems copy];
    }];
    
    return dictionary.copy;
}

- (void)forEach:(void (^)(id))block
{
    for (id item in self.object) {
        block(item);
    }
}

- (double)minValue:(double (^)(id))block
{
    return [[self reduce:^id(NSNumber* min, id item) {
        double value = block(item);
        return min == nil || value < min.doubleValue ? @(value) : min;
    } withInitialValue:nil] doubleValue];
}

- (double)maxValue:(double (^)(id))block
{
    return [[self reduce:^id(NSNumber* max, id item) {
        double value = block(item);
        return max == nil || value > max.doubleValue ? @(value) : max;
    } withInitialValue:nil] doubleValue];
}

- (double)sum:(double (^)(id))block
{
    return [[self reduce:^id(NSNumber* sum, id item) {
        double value = block(item);
        return @(sum.doubleValue + value);
    } withInitialValue:@0] doubleValue];
}

- (double)average:(double (^)(id))block
{
    return [self sum:block] / [self.object count];
}

- (id)minItems:(double (^)(id))block
{
    __block NSNumber* minValue = nil;
    return [self mapToAnother:^(id item, id<FunkyMutableCollection> collection) {
        double value = block(item);
        if (minValue == nil) {
            minValue = @(value);
        }
        if (value == minValue.doubleValue) {
            [collection addObject:item];
        } else if (value < minValue.doubleValue) {
            minValue = @(value);
            [collection removeAllObjects];
            [collection addObject:item];
        }
    }];
}

- (id)maxItems:(double (^)(id))block
{
    __block NSNumber* maxValue = nil;
    return [self mapToAnother:^(id item, id<FunkyMutableCollection> collection) {
        double value = block(item);
        if (maxValue == nil) {
            maxValue = @(value);
        }
        if (value == maxValue.doubleValue) {
            [collection addObject:item];
        } else if (value > maxValue.doubleValue) {
            maxValue = @(value);
            [collection removeAllObjects];
            [collection addObject:item];
        }
    }];
}

- (id)flatMap:(id (^)(id))block
{
    return [self mapToAnother:^(id item, id<FunkyMutableCollection> collection) {
        id mapped = block(item);
        if ([mapped isKindOfClass:[collection.class classToFlatten]]) {
            for (id current in mapped) {
                [collection addObject:current];
            }
        } else {
            [collection addObject:mapped];
        }
    }];
}

@end
