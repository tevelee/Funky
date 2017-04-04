//
//  FunkySetUtilities.m
//  Pods
//
//  Created by László Teveli on 2017. 04. 04..
//
//

#import "FunkySetUtilities.h"

@interface FunkySetUtilities ()

@property (nonatomic, strong) NSSet* object;

@end

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

@end
