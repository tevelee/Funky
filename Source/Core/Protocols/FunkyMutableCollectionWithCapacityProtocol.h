//
//  FunkyMutableCollectionWithCapaticyProtocol.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 26..
//
//

#import <Foundation/Foundation.h>

@protocol FunkyMutableCollectionWithCapacity <NSObject>

+ (id)newWithCapacity:(NSUInteger)capacity;

@end
