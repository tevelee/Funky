//
//  FunkyNilTolerantNSArray.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 21..
//
//

#import "FunkyNSArraySubclass.h"
#import "FunkyNSMutableArraySubclass.h"

#pragma mark - NSArray Subclasses

@interface FunkyNilTolerantNSArray : FunkyNSArraySubclass

@end

@interface FunkyNilTolerantNSMutableArray : FunkyNSMutableArraySubclass

@end

#pragma mark - NSArray Categories

@interface NSArray (FunkyNilTolerant)

- (FunkyNilTolerantNSArray*)nilTolerant;

@end

@interface NSMutableArray (FunkyNilTolerant)

- (FunkyNilTolerantNSMutableArray*)nilTolerant;

@end
