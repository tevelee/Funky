//
//  NSArray+Utilities.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 21..
//
//

#import <Foundation/Foundation.h>
#import "Counterpart.h"

@interface NSArray <__covariant ObjectType> (Utilities) <Counterpart>

- (NSArray*)map:(id(^)(ObjectType item))block;

@end

@interface NSMutableArray (Utilities) <Capacity>

@end
