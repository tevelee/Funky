//
//  FunkyNilTolerantNSDictionary.h
//  Pods
//
//  Created by László Teveli on 2017. 04. 03..
//
//

#import "FunkyNSDictionarySubclass.h"
#import "FunkyNSMutableDictionarySubclass.h"

#pragma mark - NSDictionary Subclasses

@interface FunkyNilTolerantNSDictionary : FunkyNSDictionarySubclass

@end

@interface FunkyNilTolerantNSMutableDictionary : FunkyNSMutableDictionarySubclass

@end

#pragma mark - NSDictionary Categories

@interface NSDictionary (FunkyNilTolerant)

- (FunkyNilTolerantNSDictionary*)nilTolerant;

@end

@interface NSMutableDictionary (FunkyNilTolerant)

- (FunkyNilTolerantNSMutableDictionary*)nilTolerant;

@end
