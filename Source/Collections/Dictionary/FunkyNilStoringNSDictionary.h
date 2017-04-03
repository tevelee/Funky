//
//  FunkyNilStoringNSDictionary.h
//  Pods
//
//  Created by László Teveli on 2017. 04. 03..
//
//

#import "FunkyNSDictionarySubclass.h"
#import "FunkyNSMutableDictionarySubclass.h"

#pragma mark - NSDictionary Subclasses

@interface FunkyNilStoringNSDictionary : FunkyNSDictionarySubclass

@end

@interface FunkyNilStoringNSMutableDictionary : FunkyNSMutableDictionarySubclass

@end

#pragma mark - NSDictionary Categories

@interface NSDictionary (FunkyNilStoring)

- (FunkyNilStoringNSDictionary*)nilStoring;

@end

@interface NSMutableDictionary (FunkyNilStoring)

- (FunkyNilStoringNSMutableDictionary*)nilStoring;

@end
