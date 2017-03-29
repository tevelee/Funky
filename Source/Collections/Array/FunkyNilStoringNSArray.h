//
//  FunkyNilStoringNSArray.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 21..
//
//

#import "FunkyNSArraySubclass.h"
#import "FunkyNSMutableArraySubclass.h"

#pragma mark - NSArray Subclasses

@interface FunkyNilStoringNSArray : FunkyNSArraySubclass

@end

@interface FunkyNilStoringNSMutableArray : FunkyNSMutableArraySubclass

@end

#pragma mark - NSArray Categories

@interface NSArray (FunkyNilStoring)

- (FunkyNilStoringNSArray*)nilStoring;

@end

@interface NSMutableArray (FunkyNilStoring)

- (FunkyNilStoringNSMutableArray*)nilStoring;

@end
