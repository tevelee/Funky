//
//  LTPair.m
//  Pods
//
//  Created by László Teveli on 2017. 03. 26..
//
//

#import "LTPair.h"

@implementation LTPair

+ (instancetype)pairWithKey:(id)key value:(id)value
{
    LTPair* pair = [LTPair new];
    [pair setKey:key];
    [pair setValue:value];
    return pair;
}

- (LTPair*)pairByModifyingKey:(id)key
{
    return [LTPair pairWithKey:key value:self.value];
}

- (LTPair*)pairByModifyingValue:(id)value
{
    return [LTPair pairWithKey:self.key value:value];
}

@end
