//
//  FunkyNilTolerantNSSet.h
//  Pods
//
//  Created by László Teveli on 2017. 04. 03..
//
//

#import "FunkyNSSetSubclass.h"
#import "FunkyNSMutableSetSubclass.h"

#pragma mark - NSSet Subclasses

@interface FunkyNilTolerantNSSet : FunkyNSSetSubclass

@end

@interface FunkyNilTolerantNSMutableSet : FunkyNSMutableSetSubclass

@end

#pragma mark - NSSet Categories

@interface NSSet (FunkyNilTolerant)

- (FunkyNilTolerantNSSet*)nilTolerant;

@end

@interface NSMutableSet (FunkyNilTolerant)

- (FunkyNilTolerantNSMutableSet*)nilTolerant;

@end
