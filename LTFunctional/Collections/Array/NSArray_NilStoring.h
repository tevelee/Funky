//
//  NSArray_NilStoring.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 21..
//
//

#import "NSArraySubclass.h"
#import "NSMutableArraySubclass.h"

#pragma mark - NSArray Subclasses

@interface NSArray_NilStoring : NSArraySubclass

@end

@interface NSMutableArray_NilStoring : NSMutableArraySubclass

@end

#pragma mark - NSArray Categories

@interface NSArray (NilStoring)

- (NSArray_NilStoring*)nilStoring;

@end

@interface NSMutableArray (NilStoring)

- (NSMutableArray_NilStoring*)nilStoring;

@end
