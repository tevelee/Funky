//
//  NSArray_NilTolerant.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 21..
//
//

#import "NSArraySubclass.h"
#import "NSMutableArraySubclass.h"

#pragma mark - NSArray Subclasses

@interface NSArray_NilTolerant : NSArraySubclass

@end

@interface NSMutableArray_NilTolerant : NSMutableArraySubclass

@end

#pragma mark - NSArray Categories

@interface NSArray (NilTolerant)

- (NSArray_NilTolerant*)nilTolerant;

@end

@interface NSMutableArray (NilTolerant)

- (NSMutableArray_NilTolerant*)nilTolerant;

@end
