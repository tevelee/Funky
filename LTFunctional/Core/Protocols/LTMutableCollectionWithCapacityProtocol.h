//
//  LTMutableCollectionWithCapaticyProtocol.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 26..
//
//

#import <Foundation/Foundation.h>

@protocol LTMutableCollectionWithCapacity <NSObject>

+ (id)newWithCapacity:(NSUInteger)capacity;

@end
