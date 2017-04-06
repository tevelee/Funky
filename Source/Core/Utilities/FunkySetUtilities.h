//
//  FunkySetUtilities.h
//  Pods
//
//  Created by László Teveli on 2017. 04. 04..
//
//

#import <Foundation/Foundation.h>
#import "FunkyCollectionUtilities.h"

@interface FunkySetUtilities : FunkyCollectionUtilities

- (NSDictionary*)groupBy:(id(^)(id item))block;
- (NSSet*)takingUnion:(NSSet*)set;
- (NSSet*)takingMinus:(NSSet*)set;
- (NSSet*)takingIntersection:(NSSet*)set;

@end

@interface FunkyMutableSetUtilities : FunkySetUtilities

- (NSMutableSet*)takeUnion:(NSSet*)set;
- (NSMutableSet*)takeMinus:(NSSet*)set;
- (NSMutableSet*)takeIntersection:(NSSet*)set;

@end
