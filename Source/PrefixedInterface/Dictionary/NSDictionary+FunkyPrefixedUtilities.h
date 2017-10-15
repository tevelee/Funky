//
//  NSDictionary+FunkyUtilities.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 29..
//
//

#import <Foundation/Foundation.h>
#import "FunkyMutableCollectionWithCapacityProtocol.h"
#import "FunkyPair.h"

/**
 *  This extension provides simple and easy to use functional and general utilities for NSDictionary.
 *  All the methods in this category are prefixed with the `funky_` keyword for compatibility reasons. If you prefer unprefixed utilities, you should import `NSDictionary+FunkyUtilities.h`.
 *
 *  @see Unprefixed counterpart `NSDictionary(FunkyUtilities)`
 *  @see Mutable counterpart `NSMutableDictionary(FunkyPrefixedUtilities)`
 */
@interface NSDictionary<__covariant KeyType, __covariant ObjectType> (FunkyPrefixedUtilities)

#pragma mark - Map

/**
 *  Returns a new NSDictionary instance with the same amount of elements, where each element is transformed to another by returning a new object in the block parameter.
 *
 *  @param block The transformator code which should return a new value based on the existing one.
 *  @return A new NSDictionary instance where each element is formed by the result of the block calls
 *  @see Unprefixed counterpart `-[NSDictionary(FunkyUtilities) map:]`
 */
- (NSDictionary*)funky_map:(FunkyPair*(^)(KeyType key, ObjectType value))block;

/**
 *  Returns a new NSDictionary instance where each element is transformed to another by returning a new object in the block parameter. It ignores the nil parameters returned from the block.
 *
 *  @param block The transformator code which should return a new value based on the existing one.
 *  @return A new NSDictionary instance where each element is formed by the result of the block calls
 *  @see Unprefixed counterpart `-[NSDictionary(FunkyUtilities) nilTolerantMap:]`
 */
- (NSDictionary*)funky_nilTolerantMap:(FunkyPair*(^)(KeyType key, ObjectType value))block;

#pragma mark - Merge

/**
 *  Returns a new NSDictionary instance, in which concatenates the two dictionaries by putting the existing elements first, and the elements in the provided dictionary after them.
 *
 *  @param other The other dictionary to merge with
 *  @return A new NSDictionary which contains the elements of both dictionaries (self and the `other` parameter)
 *  @see Mutable counterpart `-[NSMutableDictionary(FunkyPrefixedUtilities) funky_merge:]`
 *  @see Unprefixed counterpart `-[NSDictionary(FunkyUtilities) merged:]`
 */
- (NSDictionary*)funky_merged:(NSDictionary*)other;

#pragma mark - For each

/**
 *  Calls every element of the dictionary once.
 *
 *  @param block A block, giving the current item and its key in each iteration.
 *  @see Unprefixed counterpart `-[NSDictionary(FunkyUtilities) forEach:]`
 */
- (void)funky_forEach:(void(^)(KeyType key, ObjectType value))block;

#pragma mark - Invert

/**
 *  Returns a new NSDictionary instance, in which uses the current values as the dictionary and keys and vice-versa. If multiple values are holding the same key, the result (which key is used) is unpredictable.
 *
 *  @return A new NSDictionary with the inverted values and keys
 *  @see Unprefixed counterpart `-[NSDictionary(FunkyUtilities) invertedObjectsAndKeys:]`
 */
- (NSDictionary<ObjectType, KeyType>*)funky_invertedObjectsAndKeys;

#pragma mark - Filter

/**
 *  Filters the dictionary using the given predicate, keeping the elements that are passing the test.
 *
 *  @param block The predicate used to filter the results.
 *  @see Mutable counterpart `-[NSMutableDictionary(FunkyPrefixedUtilities) funky_filter:]`
 *  @see Unprefixed counterpart `-[NSDictionary(FunkyUtilities) filtered:]`
 */
- (NSDictionary<KeyType, ObjectType>*)funky_filtered:(BOOL(^)(KeyType key, ObjectType value))block;

#pragma mark - Check

/**
 *  Returns whether the condition matches all elements in the dictionary
 *
 *  @param block The condition given as a BOOL expression
 *  @return YES if condition matches all elements, NO otherwise
 *  @see Unprefixed counterpart `-[NSDictionary(FunkyUtilities) all:]`
 */
- (BOOL)funky_all:(BOOL(^)(KeyType key, ObjectType value))block;

/**
 *  Returns whether the condition matches no elements in the dictionary
 *
 *  @param block The condition given as a BOOL expression
 *  @return NO if condition matches any of the elements, YES otherwise
 *  @see Unprefixed counterpart `-[NSDictionary(FunkyUtilities) none:]`
 */
- (BOOL)funky_none:(BOOL(^)(KeyType key, ObjectType value))block;

/**
 *  Returns whether the condition matches at least one element in the dictionary
 *
 *  @param block The condition given as a BOOL expression
 *  @return YES if condition matches any of the elements, NO otherwise
 *  @see Unprefixed counterpart `-[NSDictionary(FunkyUtilities) contains:]`
 */
- (BOOL)funky_contains:(BOOL(^)(KeyType key, ObjectType value))block;

#pragma mark - Count

/**
 *  Returns the number of elements the given condition matches in the dictionary, like if you would filter the dictionary.
 *
 *  @param block The condition given as a BOOL expression
 *  @return Number of occasions where the condition matches in the dictionary
 *  @see Unprefixed counterpart `-[NSDictionary(FunkyUtilities) count:]`
 */
- (NSInteger)funky_count:(BOOL(^)(KeyType key, ObjectType value))block;

#pragma mark - Compute

/**
 *  Produces an aggregated value based on the elements of the dictionary.
 *
 *  @param start The value to start with. At first this is going to be the rolling value.
 *  @param block The computation logic, which takes the rolling value and the current item with its index and aggregates them using some custom logic.
 *  @return A custom value which is produced by computing all the elements with a custom logic, returned in `block`
 *  @see Unprefixed counterpart `-[NSDictionary(FunkyUtilities) reduce:withInitialValue:]`
 */
- (id)funky_reduce:(id(^)(id previousValue, KeyType key, ObjectType value))block withInitialValue:(id)start;

#pragma mark - Collect

/**
 *  Returns all the keys where the given predicate matches the elements of the dictionary.
 *
 *  @param block The condition given as a BOOL expression
 *  @return A list of keys where the condition matches
 *  @see Unprefixed counterpart `-[NSDictionary(FunkyUtilities) keys:]`
 */
- (NSSet<KeyType>*)funky_keys:(BOOL(^)(id key, id value))block;

/**
 *  Returns all the values where the given predicate matches the elements of the dictionary.
 *
 *  @param block The condition given as a BOOL expression
 *  @return A list of values where the condition matches
 *  @see Unprefixed counterpart `-[NSDictionary(FunkyUtilities) values:]`
 */
- (NSSet<ObjectType>*)funky_values:(BOOL(^)(id key, id value))block;

@end

/**
 *  This extension provides simple and easy to use functional and general utilities for NSMutableDictionary.
 *  All the methods in this category are prefixed with the `funky_` keyword for compatibility reasons. If you prefer unprefixed utilities, you should import `NSDictionary+FunkyUtilities.h`.
 *
 *  @see Unprefixed counterpart `NSMutableDictionary(FunkyUtilities)`
 *  @see Immutable counterpart `NSDictionary(FunkyPrefixedUtilities)`
 */
@interface NSMutableDictionary<KeyType, ObjectType> (FunkyPrefixedUtilities)

#pragma mark - Merge

/**
 *  Concatenates the current dictionary (in place) with the one given in the parameter. It does this by putting the existing elements first, and the elements in the provided dictionary afterwards.
 *
 *  @param dictionary The other dictionary to merge with
 *  @see Immutable counterpart `-[NSDictionary(FunkyPrefixedUtilities) funky_merged:]`
 *  @see Unprefixed counterpart `-[NSMutableDictionary(FunkyUtilities) merge:]`
 */
- (void)funky_merge:(NSDictionary<KeyType, ObjectType>*)dictionary;

#pragma mark - Filter

/**
 *  Filters the dictionary (in palce) using the given predicate, keeping the elements that are passing the test.
 *
 *  @param block The predicate used to filter the results.
 *  @see Immutable counterpart `-[NSDictionary(FunkyPrefixedUtilities) funky_filtered:]`
 *  @see Unprefixed counterpart `-[NSMutableDictionary(FunkyUtilities) filter:]`
 */
- (void)funky_filter:(BOOL(^)(KeyType key, ObjectType value))block;

@end
