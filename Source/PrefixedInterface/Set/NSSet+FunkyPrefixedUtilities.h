//
//  NSSet+Utilities.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 21..
//
//

#import <Foundation/Foundation.h>
#import "FunkyMutableCollectionWithCapacityProtocol.h"

/**
 *  This extension provides simple and easy to use functional and general utilities for NSSet.
 *  All the methods in this category are prefixed with the `funky_` keyword for compatibility reasons. If you prefer unprefixed utilities, you should import `NSSet+FunkyUtilities.h`.
 *
 *  @see Unprefixed counterpart `NSSet(FunkyUtilities)`
 *  @see Mutable counterpart `NSMutableSet(FunkyPrefixedUtilities)`
 */
@interface NSSet <__covariant ObjectType> (FunkyPrefixedUtilities)

#pragma mark - Check

/**
 *  Returns whether the condition matches all elements in the set
 *
 *  @param block The condition given as a BOOL expression
 *  @return YES if condition matches all elements, NO otherwise
 *  @see Unprefixed counterpart `-[NSSet(FunkyUtilities) all:]`
 */
- (BOOL)funky_all:(BOOL(^)(ObjectType item))block;

/**
 *  Returns whether the condition matches no elements in the set
 *
 *  @param block The condition given as a BOOL expression
 *  @return NO if condition matches any of the elements, YES otherwise
 *  @see Unprefixed counterpart `-[NSSet(FunkyUtilities) none:]`
 */
- (BOOL)funky_none:(BOOL(^)(ObjectType item))block;

/**
 *  Returns whether the condition matches at least one element in the set
 *
 *  @param block The condition given as a BOOL expression
 *  @return YES if condition matches any of the elements, NO otherwise
 *  @see Unprefixed counterpart `-[NSSet(FunkyUtilities) contains:]`
 */
- (BOOL)funky_contains:(BOOL(^)(ObjectType item))block;

#pragma mark - Count

/**
 *  Returns the number of elements the given condition matches in the set, like if you would filter the set.
 *
 *  @param block The condition given as a BOOL expression
 *  @return Number of occasions where the condition matches in the set
 *  @see Unprefixed counterpart `-[NSSet(FunkyUtilities) count:]`
 */
- (NSUInteger)funky_count:(BOOL(^)(ObjectType item))block;

#pragma mark - Map

/**
 *  Returns a new NSSet instance with the same amount of elements, where each element is transformed to another by returning a new object in the block parameter.
 *
 *  @param block The transformator code which should return a new value based on the existing one.
 *  @return A new NSSet instance where each element is formed by the result of the block calls
 *  @see Unprefixed counterpart `-[NSSet(FunkyUtilities) map:]`
 */
- (NSSet*)funky_map:(id(^)(ObjectType item))block;

/**
 *  Returns a new NSSet instance where each element is transformed to another by returning a new object in the block parameter. It ignores the nil parameters returned from the block.
 *
 *  @param block The transformator code which should return a new value based on the existing one.
 *  @return A new NSSet instance where each element is formed by the result of the block calls
 *  @see Unprefixed counterpart `-[NSSet(FunkyUtilities) nilTolerantMap:]`
 */
- (NSSet*)funky_nilTolerantMap:(id(^)(ObjectType item))block;

/**
 *  Returns a new NSSet instance with the same amount of elements, where each element is transformed to another by returning a new object in the block parameter. Same as map, but the result is going to be flattened, so if you return an NSSet any iteration, it is going to be converted into a flat structure, not an set of sets.
 *
 *  @param block The transformator code which should return a new value based on the existing one.
 *  @return A new NSSet instance where each element is formed by the result of the flattened block calls
 *  @see Unprefixed counterpart `-[NSSet(FunkyUtilities) flatMap:]`
 */
- (NSSet*)funky_flatMap:(id(^)(ObjectType item))block;

#pragma mark - Filter

/**
 *  Returns a new NSSet instance with the element, that are passing the returned expression in the original set.
 *
 *  @param block The filtering predicate given as a BOOL expression
 *  @return A new NSSet instance where each element is selected from the original one where the block returned YES
 *  @see Mutable counterpart `-[NSMutableSet(FunkyPrefixedUtilities) funky_filter:]`
 *  @see Unprefixed counterpart `-[NSSet(FunkyUtilities) filtered:]`
 */
- (NSSet<ObjectType>*)funky_filtered:(BOOL(^)(ObjectType item))block;

#pragma mark - Flatten

/**
 *  Flattens the set, meaning that if it consisted of Set items, they are going to be flattened into one flat structure of elements. An set of sets will transform to an set of elements from each of the previous sets. This computation is performed deeply, meaning that it contontued flattening elements, until they produce a flat structure.
 *
 *  @return A new NSSet instance where the elements don't contain NSSets
 *  @see Mutable counterpart `-[NSMutableSet(FunkyPrefixedUtilities) funky_flattened]`
 *  @see Unprefixed counterpart `-[NSSet(FunkyUtilities) flattened]`
 */
- (NSSet<ObjectType>*)funky_flattened;

#pragma mark - Set operations

/**
 *  Takes the union of the two sets.
 *
 *  @param set The other collection to union with
 *  @return A new NSSet which is the union of the two sets
 *  @see Mutable counterpart `-[NSMutableSet(FunkyPrefixedUtilities) funky_merge:]`
 *  @see Unprefixed counterpart `-[NSSet(FunkyUtilities) merged:]`
 */
- (NSSet*)funky_takingUnion:(NSSet*)set;

/**
 *  Takes a set which is the current minus the provided one.
 *
 *  @param set The other collection to minus with
 *  @return A new NSSet which is the minus of the two sets
 *  @see Mutable counterpart `-[NSMutableSet(FunkyPrefixedUtilities) funky_merge:]`
 *  @see Unprefixed counterpart `-[NSSet(FunkyUtilities) merged:]`
 */
- (NSSet<ObjectType>*)funky_takingMinus:(NSSet<ObjectType>*)set;

/**
 *  Takes the intersection of the two sets.
 *
 *  @param set The other collection to intersect with
 *  @return A new NSSet which is the intersection of the two sets
 *  @see Mutable counterpart `-[NSMutableSet(FunkyPrefixedUtilities) funky_merge:]`
 *  @see Unprefixed counterpart `-[NSSet(FunkyUtilities) merged:]`
 */
- (NSSet<ObjectType>*)funky_takingIntersection:(NSSet<ObjectType>*)set;

#pragma mark - For each

/**
 *  Calls every element of the set once.
 *
 *  @param block A block, giving the current item in each iteration.
 *  @see Unprefixed counterpart `-[NSSet(FunkyUtilities) forEach:]`
 */
- (void)funky_forEach:(void(^)(ObjectType item))block;

#pragma mark - Grouping

/**
 *  Groups elements to an NSDictionary, where the returned element serves as a key, and the objects as the value. If multiple elements are returned with the same key, the result (of which is going to get included) is unpredicatble.
 *
 *  @param block A block which returns a key (based on the passed element) used as the key in the dictionary for that element.
 *  @return An NSDictionary where keys are produced by the result of the block call, and the values are the original elements
 *  @see Unprefixed counterpart `-[NSSet(FunkyUtilities) groupByUsingFirst:]`
 */
- (NSDictionary<id, ObjectType>*)funky_groupBy:(id(^)(ObjectType item))block;

/**
 *  Groups elements to an NSDictionary, where the returned element serves as a key, and the objects as the value. The elements in the resulting Dictionary are sets, so if multiple elements return the same keys, all of them are going to be included in the value.
 *
 *  @param block A block which returns a key (based on the passed element) used as the key in the dictionary.
 *  @return An NSDictionary where keys are produced by the result of the blocks, and the values are an set of original elements
 *  @see Unprefixed counterpart `-[NSSet(FunkyUtilities) associateBy:]`
 */
- (NSDictionary<id, NSSet<ObjectType>*>*)funky_associateBy:(id(^)(ObjectType item))block;

#pragma mark - Compute

/**
 *  Produces an aggregated value based on the elements of the set.
 *
 *  @param start The value to start with. At first this is going to be the rolling value.
 *  @param block The computation logic, which takes the rolling value and the current item and aggregates them using some custom logic.
 *  @return A custom value which is produced by computing all the elements with a custom logic, returned in `block`
 *  @see Unprefixed counterpart `-[NSSet(FunkyUtilities) reduce:withInitialValue:]`
 */
- (id)funky_reduce:(id(^)(id value, ObjectType item))block withInitialValue:(id)start;

/**
 *  A special use-case of reduce, which summarises the returned double values for each element in the set.
 *
 *  @param block A block which returns double value, based on the current element.
 *  @return The sum of all elements, where the numbers are computed are transformed based on the original elements
 *  @see Unprefixed counterpart `-[NSSet(FunkyUtilities) sum:]`
 */
- (double)funky_sum:(double(^)(ObjectType item))block;

/**
 *  A special use-case of reduce, which takes the average value of the returned double values for each element in the set.
 *
 *  @param block A block which returns double value, based on the current element.
 *  @return The average of all elements, where the numbers are computed are transformed based on the original elements
 *  @see Unprefixed counterpart `-[NSSet(FunkyUtilities) average:]`
 */
- (double)funky_average:(double(^)(ObjectType item))block;

#pragma mark - Min/Max

/**
 *  A special use-case of reduce, which takes the minimum of the returned double values for each element in the set.
 *
 *  @param block A block which returns double value, based on the current element.
 *  @return The minimum of all elements, where the numbers are computed are transformed based on the original elements
 *  @see Unprefixed counterpart `-[NSSet(FunkyUtilities) minValue:]`
 */
- (double)funky_minValue:(double(^)(ObjectType item))block;

/**
 *  A special use-case of reduce, which takes the maximum of the returned double values for each element in the set.
 *
 *  @param block A block which returns double value, based on the current element.
 *  @return The maximum of all elements, where the numbers are computed are transformed based on the original elements
 *  @see Unprefixed counterpart `-[NSSet(FunkyUtilities) maxValue:]`
 */
- (double)funky_maxValue:(double(^)(ObjectType item))block;

/**
 *  Returns an set with all the minimal value elements in the set, where the minimum was computed by the returned double value for each element in the set.
 *
 *  @param block A block which returns double value, based on the current element.
 *  @return The set of elements with the minimal value, where the numbers are computed are transformed based on the original elements
 *  @see Unprefixed counterpart `-[NSSet(FunkyUtilities) minItems:]`
 */
- (NSSet<ObjectType>*)funky_minItems:(double(^)(ObjectType item))block;

/**
 *  Returns an set with all the maximal value elements in the set, where the maximum was computed by the returned double value for each element in the set.
 *
 *  @param block A block which returns double value, based on the current element.
 *  @return The set of elements with the maximal value, where the numbers are computed are transformed based on the original elements
 *  @see Unprefixed counterpart `-[NSSet(FunkyUtilities) maxItems:]`
 */
- (NSSet<ObjectType>*)funky_maxItems:(double(^)(ObjectType item))block;

@end

/**
 *  This extension provides simple and easy to use functional and general utilities for NSMutableSet.
 *  All the methods in this category are prefixed with the `funky_` keyword for compatibility reasons. If you prefer unprefixed utilities, you should import `NSSet+FunkyUtilities.h`.
 *
 *  @see Unprefixed counterpart `NSMutableSet(FunkyUtilities)`
 *  @see Immutable counterpart `NSSet(FunkyPrefixedUtilities)`
 */
@interface NSMutableSet <ObjectType> (FunkyPrefixedUtilities)

#pragma mark - Set operations

/**
 *  Takes the union of the two sets
 *
 *  @param set The other collection to union with
 *  @see Immutable counterpart `-[NSSet(FunkyPrefixedUtilities) funky_takingUnion:]`
 *  @see Unprefixed counterpart `-[NSMutableSet(FunkyUtilities) takeUnion:]`
 */
- (void)funky_takeUnion:(NSSet*)set;

/**
 *  Takes the minus of the two sets by taking the current minus the provided one.
 *
 *  @param set The other collection to minus with
 *  @see Immutable counterpart `-[NSSet(FunkyPrefixedUtilities) funky_takingMinus:]`
 *  @see Unprefixed counterpart `-[NSMutableSet(FunkyUtilities) takeMinus:]`
 */
- (void)funky_takeMinus:(NSSet<ObjectType>*)set;

/**
 *  Takes the intersection of the two sets.
 *
 *  @param set The other collection to intersect with
 *  @see Immutable counterpart `-[NSSet(FunkyPrefixedUtilities) funky_takingIntersection:]`
 *  @see Unprefixed counterpart `-[NSMutableSet(FunkyUtilities) takeIntersection:]`
 */
- (void)funky_takeIntersection:(NSSet<ObjectType>*)set;

#pragma mark - Filter

/**
 *  Filters the set using the given predicate, keeping the elements that are passing the test.
 *
 *  @param block The predicate used to filter the results.
 *  @see Immutable counterpart `-[NSSet(FunkyPrefixedUtilities) funky_filtered:]`
 *  @see Unprefixed counterpart `-[NSMutableSet(FunkyUtilities) filter:]`
 */
- (void)funky_filter:(BOOL(^)(ObjectType item))block;

#pragma mark - Flatten

/**
 *  Makes the set structure a squence with flat elements, containing no NSSets
 *
 *  @see Immutable counterpart `-[NSSet(FunkyPrefixedUtilities) funky_flattened]`
 *  @see Unprefixed counterpart `-[NSMutableSet(FunkyUtilities) flatten]`
 */
- (void)funky_flatten;

@end
