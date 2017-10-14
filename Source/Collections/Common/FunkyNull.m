//
//  FunkyNull.m
//  Pods
//
//  Created by László Teveli on 2017. 10. 15..
//

#import "FunkyNull.h"

@implementation FunkyNull

+ (instancetype)null
{
    static FunkyNull* sharedNullInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedNullInstance = [[self alloc] init];
    });
    
    return sharedNullInstance;
}

#pragma mark - NSObject

- (BOOL)isEqual:(id)other
{
    return other == self;
}

- (NSUInteger)hash
{
    return 0;
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone
{
    return [FunkyNull null];
}

@end
