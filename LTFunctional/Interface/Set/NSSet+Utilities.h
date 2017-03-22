//
//  NSSet+Utilities.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 21..
//
//

#import <Foundation/Foundation.h>
#import "Counterpart.h"

@interface NSSet <__covariant ObjectType> (Utilities) <Counterpart>

- (NSSet*)map:(id(^)(ObjectType item))block;

@end
