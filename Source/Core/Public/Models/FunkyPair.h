//
//  FunkyPair.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 26..
//
//

#import <Foundation/Foundation.h>

@interface FunkyPair<__covariant KeyType: id<NSCopying>, __covariant ObjectType> : NSObject

@property (nonatomic, strong) KeyType key;
@property (nonatomic, strong) ObjectType value;

+ (instancetype)pairWithKey:(KeyType)key value:(ObjectType)value;

- (FunkyPair*)pairByModifyingKey:(KeyType)key;
- (FunkyPair*)pairByModifyingValue:(ObjectType)value;

@end
