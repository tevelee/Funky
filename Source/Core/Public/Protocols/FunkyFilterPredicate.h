//
//  FunkyFilterPredicate.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 26..
//
//

#import <Foundation/Foundation.h>

/**
 *  This type if being used when we need a boolean information of the elements of a collection, eg. filter or contains 
 */
typedef BOOL(^FunkyFilterPredicate)(id object);
