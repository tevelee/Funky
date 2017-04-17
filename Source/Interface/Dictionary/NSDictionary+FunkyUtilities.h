//
//  NSDictionary+FunkyUtilities.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 29..
//
//

#import <Foundation/Foundation.h>
#import "FunkyPair.h"

/**
 *  This extension provides simple and easy to use functional and general utilities for NSDictionary.
 *  If you need to prefix the extension methods in this category, you should import `NSDictionary+FunkyPrefixedUtilities.h`, where every utility method is prefixed with the `funky_` keyword for compatiblitiy reasons.
 *
 *  @see Prefixed counterpart `NSDictionary(FunkyPrefixedUtilities)`
 *  @see Mutable counterpart `NSMutableDictionary(FunkyUtilities)`
 */
@interface NSDictionary<__covariant KeyType, __covariant ObjectType> (FunkyUtilities)

#pragma mark - Map

/**
 *  Returns a new NSDictionary instance with the same amount of elements, where each element is transformed to another by returning a new object in the block parameter.
 *
 *  @param block The transformator code which should return a new value based on the existing one.
 *  @return A new NSDictionary instance where each element is formed by the result of the block calls
 *  @see Prefixed counterpart `-[NSDictionary(FunkyPrefixedUtilities) funky_map:]`
 */
- (NSDictionary*)map:(FunkyPair*(^)(KeyType key, ObjectType value))block;

#pragma mark - Merge

/**
 *  Returns a new NSDictionary instance, in which concatenates the two dictionaries by putting the existing elements first, and the elements in the provided dictionary after them.
 *
 *  @param other The other dictionary to merge with
 *  @return A new NSDictionary which contains the elements of both dictionaries (self and the `other` parameter)
 *  @see Mutable counterpart `-[NSMutableDictionary(FunkyUtilities) merge:]`
 *  @see Prefixed counterpart `-[NSDictionary(FunkyPrefixedUtilities) funky_merged:]`
 */
- (NSDictionary*)merged:(NSDictionary*)other;

#pragma mark - For each

/**
 *  Calls every element of the dictionary once.
 *
 *  @param block A block, giving the current item and its key in each iteration.
 *  @see Prefixed counterpart `-[NSDictionary(FunkyPrefixedUtilities) funky_forEach:]`
 */
- (void)forEach:(void(^)(KeyType key, ObjectType value))block;

#pragma mark - Invert

/**
 *  Returns a new NSDictionary instance, in which uses the current values as the dictionary and keys and vice-versa. If multiple values are holding the same key, the result (which key is used) is unpredictable.
 *
 *  @return A new NSDictionary with the inverted values and keys
 *  @see Prefixed counterpart `-[NSDictionary(FunkyPrefixedUtilities) funky_invertedObjectsAndKeys:]`
 */
- (NSDictionary<ObjectType, KeyType>*)invertedObjectsAndKeys;

#pragma mark - Filter

/**
 *  Filters the dictionary using the given predicate, keeping the elements that are passing the test.
 *
 *  @param block The predicate used to filter the results.
 *  @see Mutable counterpart `-[NSMutableDictionary(FunkyUtilities) filter:]`
 *  @see Prefixed counterpart `-[NSDictionary(FunkyPrefixedUtilities) funky_filtered:]`
 */
- (NSDictionary<KeyType, ObjectType>*)filtered:(BOOL(^)(KeyType key, ObjectType value))block;

#pragma mark - Check

/**
 *  Returns whether the condition matches all elements in the dictionary
 *
 *  @param block The condition given as a BOOL expression
 *  @return YES if condition matches all elements, NO otherwise
 *  @see Prefixed counterpart `-[NSDictionary(FunkyPrefixedUtilities) funky_all:]`
 */
- (BOOL)all:(BOOL(^)(KeyType key, ObjectType value))block;

/**
 *  Returns whether the condition matches no elements in the dictionary
 *
 *  @param block The condition given as a BOOL expression
 *  @return NO if condition matches any of the elements, YES otherwise
 *  @see Prefixed counterpart `-[NSDictionary(FunkyPrefixedUtilities) funky_none:]`
 */
- (BOOL)none:(BOOL(^)(KeyType key, ObjectType value))block;

/**
 *  Returns whether the condition matches at least one element in the dictionary
 *
 *  @param block The condition given as a BOOL expression
 *  @return YES if condition matches any of the elements, NO otherwise
 *  @see Prefixed counterpart `-[NSDictionary(FunkyPrefixedUtilities) funky_contains:]`
 */
- (BOOL)contains:(BOOL(^)(KeyType key, ObjectType value))block;

#pragma mark - Count

/**
 *  Returns the number of elements the given condition matches in the dictionary, like if you would filter the dictionary.
 *
 *  @param block The condition given as a BOOL expression
 *  @return Number of occasions where the condition matches in the dictionary
 *  @see Prefixed counterpart `-[NSDictionary(FunkyPrefixedUtilities) funky_count:]`
 */
- (NSInteger)count:(BOOL(^)(KeyType key, ObjectType value))block;

#pragma mark - Compute

/**
 *  Produces an aggregated value based on the elements of the dictionary.
 *
 *  @param start The value to start with. At first this is going to be the rolling value.
 *  @param block The computation logic, which takes the rolling value and the current item with its index and aggregates them using some custom logic.
 *  @return A custom value which is produced by computing all the elements with a custom logic, returned in `block`
 *  @see Prefixed counterpart `-[NSDictionary(FunkyPrefixedUtilities) funky_reduce:withInitialValue:]`
 */
- (id)reduce:(id(^)(id previousValue, KeyType key, ObjectType value))block withInitialValue:(id)start;

#pragma mark - Collect

/**
 *  Returns all the keys where the given predicate matches the elements of the dictionary.
 *
 *  @param block The condition given as a BOOL expression
 *  @return A list of keys where the condition matches
 *  @see Prefixed counterpart `-[NSDictionary(FunkyPrefixedUtilities) funky_keys:]`
 */
- (NSArray<KeyType>*)keys:(BOOL(^)(id key, id value))block;

/**
 *  Returns all the values where the given predicate matches the elements of the dictionary.
 *
 *  @param block The condition given as a BOOL expression
 *  @return A list of values where the condition matches
 *  @see Prefixed counterpart `-[NSDictionary(FunkyPrefixedUtilities) funky_values:]`
 */
- (NSArray<ObjectType>*)values:(BOOL(^)(id key, id value))block;

@end

/**
 *  This extension provides simple and easy to use functional and general utilities for NSMutableDictionary.
 *  If you need to prefix the extension methods in this category, you should import `NSDictionary+FunkyPrefixedUtilities.h`, where every utility method is prefixed with the `funky_` keyword for compatiblitiy reasons.
 *
 *  @see Prefixed counterpart `NSMutableDictionary(FunkyPrefixedUtilities)`
 *  @see Immutable counterpart `NSDictionary(FunkyUtilities)`
 */
@interface NSMutableDictionary<KeyType, ObjectType> (FunkyUtilities)

#pragma mark - Merge

/**
 *  Concatenates the current dictinoary (in place) with the one given in the parameter. It does this by putting the existing elements first, and the elements in the provided dictionary afterwards.
 *
 *  @param dictionary The other dictionary to merge with
 *  @see Immutable counterpart `-[NSDictionary(FunkyPrefixedUtilities) funky_merged:]`
 *  @see Unprefixed counterpart `-[NSMutableDictionary(FunkyUtilities) merge:]`
 */
- (void)merge:(NSDictionary<KeyType, ObjectType>*)dictionary;

#pragma mark - Filter

/**
 *  Filters the dictionary (in palce) using the given predicate, keeping the elements that are passing the test.
 *
 *  @param block The predicate used to filter the results.
 *  @see Immutable counterpart `-[NSDictionary(FunkyUtilities) filtered:]`
 *  @see Prefixed counterpart `-[NSMutableDictionary(FunkyPrefixedUtilities) funky_filter:]`
 */
- (void)filter:(BOOL(^)(KeyType key, ObjectType value))block;

@end
