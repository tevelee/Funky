//
//  NSSet+Utilities.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 21..
//
//

#import <Foundation/Foundation.h>

/**
 *  This extension provides simple and easy to use functional and general utilities for NSSet.
 *  If you need to prefix the extension methods in this category, you should import `NSSet+FunkyPrefixedUtilities.h`, where every utility method is prefixed with the `funky_` keyword for compatiblitiy reasons.
 *
 *  @see Prefixed counterpart `NSSet(FunkyPrefixedUtilities)`
 *  @see Mutable counterpart `NSMutableSet(FunkyUtilities)`
 */
@interface NSSet <__covariant ObjectType> (FunkyUtilities)

#pragma mark - Check

/**
 *  Returns whether the condition matches all elements in the set
 *
 *  @param block The condition given as a BOOL expression
 *  @return YES if condition matches all elements, NO otherwise
 *  @see Prefixed counterpart `-[NSSet(FunkyPrefixedUtilities) funky_all:]`
 */
- (BOOL)all:(BOOL(^)(ObjectType item))block;

/**
 *  Returns whether the condition matches no elements in the set
 *
 *  @param block The condition given as a BOOL expression
 *  @return NO if condition matches any of the elements, YES otherwise
 *  @see Prefixed counterpart `-[NSSet(FunkyPrefixedUtilities) funky_none:]`
 */
- (BOOL)none:(BOOL(^)(ObjectType item))block;

/**
 *  Returns whether the condition matches at least one element in the set
 *
 *  @param block The condition given as a BOOL expression
 *  @return YES if condition matches any of the elements, NO otherwise
 *  @see Prefixed counterpart `-[NSSet(FunkyPrefixedUtilities) funky_contains:]`
 */
- (BOOL)contains:(BOOL(^)(ObjectType item))block;

#pragma mark - Count

/**
 *  Returns the number of elements the given condition matches in the set, like if you would filter the set.
 *
 *  @param block The condition given as a BOOL expression
 *  @return Number of occasions where the condition matches in the set
 *  @see Prefixed counterpart `-[NSSet(FunkyPrefixedUtilities) funky_count:]`
 */
- (NSUInteger)count:(BOOL(^)(ObjectType item))block;

#pragma mark - Map

/**
 *  Returns a new NSSet instance with the same amount of elements, where each element is transformed to another by returning a new object in the block parameter.
 *
 *  @param block The transformator code which should return a new value based on the existing one.
 *  @return A new NSSet instance where each element is formed by the result of the block calls
 *  @see Prefixed counterpart `-[NSSet(FunkyPrefixedUtilities) funky_map:]`
 */
- (NSSet*)map:(id(^)(ObjectType item))block;

/**
 *  Returns a new NSSet instance with the same amount of elements, where each element is transformed to another by returning a new object in the block parameter. Same as map, but the result is going to be flattened, so if you return an NSSet any iteration, it is going to be converted into a flat structure, not an set of sets.
 *
 *  @param block The transformator code which should return a new value based on the existing one.
 *  @return A new NSSet instance where each element is formed by the result of the flattened block calls
 *  @see Prefixed counterpart `-[NSSet(FunkyPrefixedUtilities) funky_flatMap:]`
 */
- (NSSet*)flatMap:(id(^)(ObjectType item))block;

#pragma mark - Filter

/**
 *  Returns a new NSSet instance with the element, that are passing the returned expression in the original set.
 *
 *  @param block The filtering predicate given as a BOOL expression
 *  @return A new NSSet instance where each element is selected from the original one where the block returned YES
 *  @see Mutable counterpart `-[NSMutableSet(FunkyPrefixedUtilities) funky_filter:]`
 *  @see Prefixed counterpart `-[NSSet(FunkyPrefixedUtilities) funky_filtered:]`
 */
- (NSSet<ObjectType>*)filtered:(BOOL(^)(ObjectType item))block;

#pragma mark - Flatten

/**
 *  Flattens the set, meaning that if it consisted of Set items, they are going to be flattened into one flat structure of elements. An set of sets will transform to an set of elements from each of the previous sets. This computation is performed deeply, meaning that it contontued flattening elements, until they produce a flat structure.
 *
 *  @return A new NSSet instance where the elements don't contain NSSets
 *  @see Mutable counterpart `-[NSMutableSet(FunkyPrefixedUtilities) funky_flattened]`
 *  @see Prefixed counterpart `-[NSSet(FunkyPrefixedUtilities) funky_flattened]`
 */
- (NSSet<ObjectType>*)flattened;

#pragma mark - Set operations

/**
 *  Takes the union of the two sets.
 *
 *  @param set The other collection to union with
 *  @return A new NSSet which is the union of the two sets
 *  @see Immutable counterpart `-[NSSet(FunkyPrefixedUtilities) funky_takeUnion:]`
 *  @see Prefixed counterpart `-[NSMutableSet(FunkyPrefixedUtilities) funky_takingUnion:]`
 */
- (NSSet*)takingUnion:(NSSet*)set;

/**
 *  Takes a set which is the current minus the provided one.
 *
 *  @param set The other collection to minus with
 *  @return A new NSSet which is the minus of the two sets
 *  @see Immutable counterpart `-[NSSet(FunkyPrefixedUtilities) funky_takeMinus:]`
 *  @see Prefixed counterpart `-[NSMutableSet(FunkyPrefixedUtilities) funky_takingMinus:]`
 */
- (NSSet<ObjectType>*)takingMinus:(NSSet<ObjectType>*)set;

/**
 *  Takes the intersection of the two sets.
 *
 *  @param set The other collection to intersect with
 *  @return A new NSSet which is the intersection of the two sets
 *  @see Immutable counterpart `-[NSSet(FunkyPrefixedUtilities) funky_takeIntersection:]`
 *  @see Prefixed counterpart `-[NSMutableSet(FunkyPrefixedUtilities) funky_takingIntersection:]`
 */
- (NSSet<ObjectType>*)takingIntersection:(NSSet<ObjectType>*)set;

#pragma mark - For each

/**
 *  Calls every element of the set once.
 *
 *  @param block A block, giving the current item in each iteration.
 *  @see Prefixed counterpart `-[NSSet(FunkyPrefixedUtilities) funky_forEach:]`
 */
- (void)forEach:(void(^)(ObjectType item))block;

#pragma mark - Grouping

/**
 *  Groups elements to an NSDictionary, where the returned element serves as a key, and the objects as the value. If multiple elements are returned with the same key, the result (of which is going to get included) is unpredicatble.
 *
 *  @param block A block which returns a key (based on the passed element) used as the key in the dictionary for that element.
 *  @return An NSDictionary where keys are produced by the result of the block call, and the values are the original elements
 *  @see Prefixed counterpart `-[NSSet(FunkyPrefixedUtilities) funky_groupByUsingFirst:]`
 */
- (NSDictionary<id, ObjectType>*)groupBy:(id(^)(ObjectType item))block;

/**
 *  Groups elements to an NSDictionary, where the returned element serves as a key, and the objects as the value. The elements in the resulting Dictionary are sets, so if multiple elements return the same keys, all of them are going to be included in the value.
 *
 *  @param block A block which returns a key (based on the passed element) used as the key in the dictionary.
 *  @return An NSDictionary where keys are produced by the result of the blocks, and the values are an set of original elements
 *  @see Prefixed counterpart `-[NSSet(FunkyPrefixedUtilities) funky_associateBy:]`
 */
- (NSDictionary<id, NSSet<ObjectType>*>*)associateBy:(id(^)(ObjectType item))block;

#pragma mark - Compute

/**
 *  Produces an aggregated value based on the elements of the set.
 *
 *  @param start The value to start with. At first this is going to be the rolling value.
 *  @param block The computation logic, which takes the rolling value and the current item and aggregates them using some custom logic.
 *  @return A custom value which is produced by computing all the elements with a custom logic, returned in `block`
 *  @see Prefixed counterpart `-[NSSet(FunkyPrefixedUtilities) funky_reduce:withInitialValue:]`
 */
- (id)reduce:(id(^)(id value, ObjectType item))block withInitialValue:(id)start;

/**
 *  A special use-case of reduce, which summarises the returned double values for each element in the set.
 *
 *  @param block A block which returns double value, based on the current element.
 *  @return The sum of all elements, where the numbers are computed are transformed based on the original elements
 *  @see Prefixed counterpart `-[NSSet(FunkyPrefixedUtilities) funky_sum:]`
 */
- (double)sum:(double(^)(ObjectType item))block;

/**
 *  A special use-case of reduce, which takes the average value of the returned double values for each element in the set.
 *
 *  @param block A block which returns double value, based on the current element.
 *  @return The average of all elements, where the numbers are computed are transformed based on the original elements
 *  @see Prefixed counterpart `-[NSSet(FunkyPrefixedUtilities) funky_average:]`
 */
- (double)average:(double(^)(ObjectType item))block;

#pragma mark - Min/Max

/**
 *  A special use-case of reduce, which takes the minimum of the returned double values for each element in the set.
 *
 *  @param block A block which returns double value, based on the current element.
 *  @return The minimum of all elements, where the numbers are computed are transformed based on the original elements
 *  @see Prefixed counterpart `-[NSSet(FunkyPrefixedUtilities) funky_minValue:]`
 */
- (double)minValue:(double(^)(ObjectType item))block;

/**
 *  A special use-case of reduce, which takes the maximum of the returned double values for each element in the set.
 *
 *  @param block A block which returns double value, based on the current element.
 *  @return The maximum of all elements, where the numbers are computed are transformed based on the original elements
 *  @see Prefixed counterpart `-[NSSet(FunkyPrefixedUtilities) funky_maxValue:]`
 */
- (double)maxValue:(double(^)(ObjectType item))block;

/**
 *  Returns an set with all the minimal value elements in the set, where the minimum was computed by the returned double value for each element in the set.
 *
 *  @param block A block which returns double value, based on the current element.
 *  @return The set of elements with the minimal value, where the numbers are computed are transformed based on the original elements
 *  @see Prefixed counterpart `-[NSSet(FunkyPrefixedUtilities) funky_minItems:]`
 */
- (NSSet<ObjectType>*)minItems:(double(^)(ObjectType item))block;

/**
 *  Returns an set with all the maximal value elements in the set, where the maximum was computed by the returned double value for each element in the set.
 *
 *  @param block A block which returns double value, based on the current element.
 *  @return The set of elements with the maximal value, where the numbers are computed are transformed based on the original elements
 *  @see Prefixed counterpart `-[NSSet(FunkyPrefixedUtilities) funky_maxItems:]`
 */
- (NSSet<ObjectType>*)maxItems:(double(^)(ObjectType item))block;

@end

/**
 *  This extension provides simple and easy to use functional and general utilities for NSMutableSet.
 *  If you need to prefix the extension methods in this category, you should import `NSSet+FunkyPrefixedUtilities.h`, where every utility method is prefixed with the `funky_` keyword for compatiblitiy reasons.
 *
 *  @see Prefixed counterpart `NSMutableSet(FunkyPrefixedUtilities)`
 *  @see Immutable counterpart `NSSet(FunkyUtilities)`
 */
@interface NSMutableSet <ObjectType> (FunkyUtilities)

#pragma mark - Set operations

/**
 *  Takes the union of the two sets
 *
 *  @param set The other collection to union with
 *  @see Immutable counterpart `-[NSSet(FunkyPrefixedUtilities) funky_takingUnion:]`
 *  @see Prefixed counterpart `-[NSMutableSet(FunkyPrefixedUtilities) funky_takeUnion:]`
 */
- (void)takeUnion:(NSSet*)set;

/**
 *  Takes the minus of the two sets by taking the current minus the provided one.
 *
 *  @param set The other collection to minus with
 *  @see Immutable counterpart `-[NSSet(FunkyPrefixedUtilities) funky_takingMinus:]`
 *  @see Prefixed counterpart `-[NSMutableSet(FunkyPrefixedUtilities) funky_takeMinus:]`
 */
- (void)takeMinus:(NSSet<ObjectType>*)set;

/**
 *  Takes the intersection of the two sets.
 *
 *  @param set The other collection to intersect with
 *  @see Immutable counterpart `-[NSSet(FunkyPrefixedUtilities) funky_takingIntersection:]`
 *  @see Prefixed counterpart `-[NSMutableSet(FunkyPrefixedUtilities) funky_takeIntersection:]`
 */
- (void)takeIntersection:(NSSet<ObjectType>*)set;

#pragma mark - Filter

/**
 *  Filters the set using the given predicate, keeping the elements that are passing the test.
 *
 *  @param block The predicate used to filter the results.
 *  @see Immutable counterpart `-[NSSet(FunkyPrefixedUtilities) funky_filtered:]`
 *  @see Prefixed counterpart `-[NSMutableSet(FunkyPrefixedUtilities) funky_filter:]`
 */
- (void)filter:(BOOL(^)(ObjectType item))block;

#pragma mark - Flatten

/**
 *  Makes the set structure a squence with flat elements, containing no NSSets
 *
 *  @see Immutable counterpart `-[NSSet(FunkyPrefixedUtilities) funky_flattened]`
 *  @see Prefixed counterpart `-[NSMutableSet(FunkyPrefixedUtilities) funky_flatten]`
 */
- (void)flatten;

@end
