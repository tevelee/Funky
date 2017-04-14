//
//  FunkyPair.m
//  Pods
//
//  Created by László Teveli on 2017. 03. 26..
//
//

#import "FunkyPair.h"

@implementation FunkyPair

+ (instancetype)pairWithKey:(id)key value:(id)value
{
    FunkyPair* pair = [FunkyPair new];
    [pair setKey:key];
    [pair setValue:value];
    return pair;
}

- (FunkyPair*)pairByModifyingKey:(id)key
{
    return [FunkyPair pairWithKey:key value:self.value];
}

- (FunkyPair*)pairByModifyingValue:(id)value
{
    return [FunkyPair pairWithKey:self.key value:value];
}

@end
