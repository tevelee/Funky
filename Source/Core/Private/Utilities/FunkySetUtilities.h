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

@property (nonatomic, strong) NSSet* object;

- (NSDictionary*)groupBy:(id(^)(id item))block;
- (NSSet*)takingUnion:(NSSet*)set;
- (NSSet*)takingMinus:(NSSet*)set;
- (NSSet*)takingIntersection:(NSSet*)set;

@end

@interface FunkyMutableSetUtilities : FunkySetUtilities

@property (nonatomic, strong) NSMutableSet* object;

- (void)takeUnion:(NSSet*)set;
- (void)takeMinus:(NSSet*)set;
- (void)takeIntersection:(NSSet*)set;

- (void)filter:(BOOL (^)(id))block;
- (void)flatten;

@end
