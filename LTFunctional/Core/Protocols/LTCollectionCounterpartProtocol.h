//
//  Counterpart.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 22..
//
//

#import <Foundation/Foundation.h>

@protocol LTCollectionCounterpart <NSObject>

+ (Class)classForImmutableCounterPart;
+ (Class)classForMutableCounterPart;
+ (Class)classToFlatten;

@end

