//
//  FunkyNilStoringNSSet.h
//  Pods
//
//  Created by László Teveli on 2017. 04. 03..
//
//

#import "FunkyNSSetSubclass.h"
#import "FunkyNSMutableSetSubclass.h"

#pragma mark - NSSet Subclasses

@interface FunkyNilStoringNSSet : FunkyNSSetSubclass

@end

@interface FunkyNilStoringNSMutableSet : FunkyNSMutableSetSubclass

@end

#pragma mark - NSSet Categories

@interface NSSet (FunkyNilStoring)

- (FunkyNilStoringNSSet*)nilStoring;

@end

@interface NSMutableSet (FunkyNilStoring)

- (FunkyNilStoringNSMutableSet*)nilStoring;

@end
