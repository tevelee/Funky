//
//  NSArray+Utilities.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 21..
//
//

#import <Foundation/Foundation.h>

/**
 *  This extension provides simple and easy to use functional and general utilities for NSArray.
 *  If you need to prefix the extension methods in this category, you should import `NSArray+FunkyPrefixedUtilities.h`, where every utility method is prefixed with the `funky_` keyword for compatiblitiy reasons.
 *
 *  @see Prefixed counterpart `NSArray(FunkyPrefixedUtilities)`
 *  @see Mutable counterpart `NSMutableArray(FunkyUtilities)`
 */
@interface NSArray <__covariant ObjectType> (FunkyUtilities)

#pragma mark - Check

/**
 *  Returns whether the condition matches all elements in the array
 *
 *  @param block The condition given as a BOOL expression
 *  @return YES if condition matches all elements, NO otherwise
 *  @see Prefixed counterpart `-[NSArray(FunkyPrefixedUtilities) funky_all:]`
 */
- (BOOL)all:(BOOL(^)(ObjectType item))block;

/**
 *  Returns whether the condition matches no elements in the array
 *
 *  @param block The condition given as a BOOL expression
 *  @return NO if condition matches any of the elements, YES otherwise
 *  @see Prefixed counterpart `-[NSArray(FunkyPrefixedUtilities) funky_none:]`
 */
- (BOOL)none:(BOOL(^)(ObjectType item))block;

/**
 *  Returns whether the condition matches at least one element in the array
 *
 *  @param block The condition given as a BOOL expression
 *  @return YES if condition matches any of the elements, NO otherwise
 *  @see Prefixed counterpart `-[NSArray(FunkyPrefixedUtilities) funky_contains:]`
 */
- (BOOL)contains:(BOOL(^)(ObjectType item))block;

#pragma mark - Count

/**
 *  Returns the number of elements the given condition matches in the array, like if you would filter the array.
 *
 *  @param block The condition given as a BOOL expression
 *  @return Number of occasions where the condition matches in the array
 *  @see Prefixed counterpart `-[NSArray(FunkyPrefixedUtilities) funky_count:]`
 */
- (NSUInteger)count:(BOOL(^)(ObjectType item))block;

#pragma mark - Map

/**
 *  Returns a new NSArray instance with the same amount of elements, where each element is transformed to another by returning a new object in the block parameter.
 *
 *  @param block The transformator code which should return a new value based on the existing one.
 *  @return A new NSArray instance where each element is formed by the result of the block calls
 *  @see Prefixed counterpart `-[NSArray(FunkyPrefixedUtilities) funky_map:]`
 */
- (NSArray*)map:(id(^)(ObjectType item))block;

/**
 *  Returns a new NSArray instance where each element is transformed to another by returning a new object in the block parameter. It ignores the nil parameters returned from the block.
 *
 *  @param block The transformator code which should return a new value based on the existing one.
 *  @return A new NSArray instance where each element is formed by the result of the block calls
 *  @see Prefixed counterpart `-[NSArray(FunkyPrefixedUtilities) funky_nilTolerantMap:]`
 */
- (NSArray*)nilTolerantMap:(id(^)(ObjectType item))block;

/**
 *  Same as map, but the block contains the index of the current element.
 *
 *  @param block The transformator code which should return a new value based on the index and the existing item.
 *  @return A new NSArray instance where each element is formed by the result of the block calls
 *  @see Prefixed counterpart `-[NSArray(FunkyPrefixedUtilities) funky_mapWithIndex:]`
 */
- (NSArray*)mapWithIndex:(id(^)(NSUInteger index, ObjectType item))block;

/**
 *  Same as nil-tolerant map, but the block contains the index of the current element.
 *
 *  @param block The transformator code which should return a new value based on the index and the existing item.
 *  @return A new NSArray instance where each element is formed by the result of the block calls
 *  @see Prefixed counterpart `-[NSArray(FunkyPrefixedUtilities) funky_mapWithIndex:]`
 */
- (NSArray*)nilTolerantMapWithIndex:(id(^)(NSUInteger index, ObjectType item))block;

/**
 *  Returns a new NSArray instance with the same amount of elements, where each element is transformed to another by returning a new object in the block parameter. Same as map, but the result is going to be flattened, so if you return an NSArray any iteration, it is going to be converted into a flat structure, not an array of arrays.
 *
 *  @param block The transformator code which should return a new value based on the existing one.
 *  @return A new NSArray instance where each element is formed by the result of the flattened block calls
 *  @see Prefixed counterpart `-[NSArray(FunkyPrefixedUtilities) funky_flatMap:]`
 */
- (NSArray*)flatMap:(id(^)(ObjectType item))block;

/**
 *  Same as flatMap, but the block contains the index of the current element.
 *
 *  @param block The transformator code which should return a new value based on the index and the existing item.
 *  @return A new NSArray instance where each element is formed by the result of the flattened block calls
 *  @see Prefixed counterpart `-[NSArray(FunkyPrefixedUtilities) funky_flatMapWithIndex:]`
 */
- (NSArray*)flatMapWithIndex:(id(^)(NSUInteger index, ObjectType item))block;

#pragma mark - Filter

/**
 *  Returns a new NSArray instance with the element, that are passing the returned expression in the original array.
 *
 *  @param block The filtering predicate given as a BOOL expression
 *  @return A new NSArray instance where each element is selected from the original one where the block returned YES
 *  @see Mutable counterpart `-[NSMutableArray(FunkyUtilities) filter:]`
 *  @see Prefixed counterpart `-[NSArray(FunkyPrefixedUtilities) funky_filtered:]`
 */
- (NSArray<ObjectType>*)filtered:(BOOL(^)(ObjectType item))block;

#pragma mark - Flatten

/**
 *  Flattens the array, meaning that if it consisted of Array items, they are going to be flattened into one flat structure of elements. An array of arrays will transform to an array of elements from each of the previous arrays. This computation is performed deeply, meaning that it contontued flattening elements, until they produce a flat structure.
 *
 *  @return A new NSArray instance where the elements don't contain NSArrays
 *  @see Mutable counterpart `-[NSMutableArray(FunkyUtilities) flatten]`
 *  @see Prefixed counterpart `-[NSArray(FunkyPrefixedUtilities) funky_flattened]`
 */
- (NSArray<ObjectType>*)flattened;

#pragma mark - Merge

/**
 *  Returns a new NSArray instance, in which concatenates the two arrays by putting the existing elements first, and the elements in the provided array after them.
 *
 *  @param array The other collection to merge with
 *  @return A new NSArray which contains the elements of both arrays (self and the `array` parameter)
 *  @see Mutable counterpart `-[NSMutableArray(FunkyUtilities) merge:]`
 *  @see Prefixed counterpart `-[NSArray(FunkyPrefixedUtilities) funky_merged:]`
 */
- (NSArray*)merged:(NSArray*)array;

#pragma mark - For each

/**
 *  Calls every element of the array once.
 *
 *  @param block A block, giving the current item in each iteration.
 *  @see Prefixed counterpart `-[NSArray(FunkyPrefixedUtilities) funky_forEach:]`
 */
- (void)forEach:(void(^)(ObjectType item))block;

/**
 *  Calls every element of the array once. Same as forEach, but the block contains the index of the current element as well.
 *
 *  @param block A block, giving the current item and its index in each iteration.
 *  @see Prefixed counterpart `-[NSArray(FunkyPrefixedUtilities) funky_forEachWithIndex:]`
 */
- (void)forEachWithIndex:(void(^)(NSUInteger index, ObjectType item))block;

#pragma mark - Grouping

/**
 *  Groups elements to an NSDictionary, where the returned element serves as a key, and the objects as the value. If multiple elements are returned with the same key, this function will use the first matching element.
 *
 *  @param block A block which returns a key (based on the passed element) used as the key in the dictionary for that element.
 *  @return An NSDictionary where keys are produced by the result of the block call, and the values are the original elements
 *  @see Prefixed counterpart `-[NSArray(FunkyPrefixedUtilities) funky_groupByUsingFirst:]`
 */
- (NSDictionary<id, ObjectType>*)groupByUsingFirst:(id(^)(ObjectType item))block;

/**
 *  Groups elements to an NSDictionary, where the returned element serves as a key, and the objects as the value. If multiple elements are returned with the same key, this function will use the last matching element.
 *
 *  @param block A block which returns a key (based on the passed element) used as the key in the dictionary for that element.
 *  @return An NSDictionary where keys are produced by the result of the block call, and the values are the original elements
 *  @see Prefixed counterpart `-[NSArray(FunkyPrefixedUtilities) funky_groupByUsingLast:]`
 */
- (NSDictionary<id, ObjectType>*)groupByUsingLast:(id(^)(ObjectType item))block;

/**
 *  Groups elements to an NSDictionary, where the returned element serves as a key, and the objects as the value. The elements in the resulting Dictionary are arrays, so if multiple elements return the same keys, all of them are going to be included in the value.
 *
 *  @param block A block which returns a key (based on the passed element) used as the key in the dictionary.
 *  @return An NSDictionary where keys are produced by the result of the blocks, and the values are an array of original elements
 *  @see Prefixed counterpart `-[NSArray(FunkyPrefixedUtilities) funky_associateBy:]`
 */
- (NSDictionary<id, NSArray<ObjectType>*>*)associateBy:(id(^)(ObjectType item))block;

#pragma mark - Compute

/**
 *  Produces an aggregated value based on the elements of the array.
 *
 *  @param start The value to start with. At first this is going to be the rolling value.
 *  @param block The computation logic, which takes the rolling value and the current item and aggregates them using some custom logic.
 *  @return A custom value which is produced by computing all the elements with a custom logic, returned in `block`
 *  @see Prefixed counterpart `-[NSArray(FunkyPrefixedUtilities) funky_reduce:withInitialValue:]`
 */
- (id)reduce:(id(^)(id value, ObjectType item))block withInitialValue:(id)start;

/**
 *  A special use-case of reduce, which summarises the returned double values for each element in the array.
 *
 *  @param block A block which returns double value, based on the current element.
 *  @return The sum of all elements, where the numbers are computed are transformed based on the original elements
 *  @see Prefixed counterpart `-[NSArray(FunkyPrefixedUtilities) funky_sum:]`
 */
- (double)sum:(double(^)(ObjectType item))block;

/**
 *  A special use-case of reduce, which takes the average value of the returned double values for each element in the array.
 *
 *  @param block A block which returns double value, based on the current element.
 *  @return The average of all elements, where the numbers are computed are transformed based on the original elements
 *  @see Prefixed counterpart `-[NSArray(FunkyPrefixedUtilities) funky_average:]`
 */
- (double)average:(double(^)(ObjectType item))block;

#pragma mark - Min/Max

/**
 *  A special use-case of reduce, which takes the minimum of the returned double values for each element in the array.
 *
 *  @param block A block which returns double value, based on the current element.
 *  @return The minimum of all elements, where the numbers are computed are transformed based on the original elements
 *  @see Prefixed counterpart `-[NSArray(FunkyPrefixedUtilities) funky_minValue:]`
 */
- (double)minValue:(double(^)(ObjectType item))block;

/**
 *  A special use-case of reduce, which takes the maximum of the returned double values for each element in the array.
 *
 *  @param block A block which returns double value, based on the current element.
 *  @return The maximum of all elements, where the numbers are computed are transformed based on the original elements
 *  @see Prefixed counterpart `-[NSArray(FunkyPrefixedUtilities) funky_maxValue:]`
 */
- (double)maxValue:(double(^)(ObjectType item))block;

/**
 *  Returns an array with all the minimal value elements in the array, where the minimum was computed by the returned double value for each element in the array.
 *
 *  @param block A block which returns double value, based on the current element.
 *  @return The array of elements with the minimal value, where the numbers are computed are transformed based on the original elements
 *  @see Prefixed counterpart `-[NSArray(FunkyPrefixedUtilities) funky_minItems:]`
 */
- (NSArray<ObjectType>*)minItems:(double(^)(ObjectType item))block;

/**
 *  Returns an array with all the maximal value elements in the array, where the maximum was computed by the returned double value for each element in the array.
 *
 *  @param block A block which returns double value, based on the current element.
 *  @return The array of elements with the maximal value, where the numbers are computed are transformed based on the original elements
 *  @see Prefixed counterpart `-[NSArray(FunkyPrefixedUtilities) funky_maxItems:]`
 */
- (NSArray<ObjectType>*)maxItems:(double(^)(ObjectType item))block;

#pragma mark - First/Last

/**
 *  Returns the first index of the array: 0
 *
 *  @return the first index of the array
 *  @see Prefixed counterpart `-[NSArray(FunkyPrefixedUtilities) funky_firstIndex]`
 */
- (NSUInteger)firstIndex;

/**
 *  Returns the last index of the array: count - 1
 *
 *  @return the last index of the array
 *  @see Prefixed counterpart `-[NSArray(FunkyPrefixedUtilities) funky_lastIndex]`
 */
- (NSUInteger)lastIndex;

/**
 *  Returns the first element, where the predicate matches
 *
 *  @param block The condition provided as a BOOL expression.
 *  @return The first element where the block returns YES
 *  @see Prefixed counterpart `-[NSArray(FunkyPrefixedUtilities) funky_first:]`
 */
- (id)first:(BOOL(^)(ObjectType item))block;

/**
 *  Returns the index of the first element, where the predicate matches
 *
 *  @param block The condition provided as a BOOL expression.
 *  @return The index of the first element where the block returns YES
 *  @see Prefixed counterpart `-[NSArray(FunkyPrefixedUtilities) funky_firstIndex:]`
 */
- (NSUInteger)firstIndex:(BOOL(^)(ObjectType item))block;

/**
 *  Returns the last element, where the predicate matches
 *
 *  @param block The condition provided as a BOOL expression.
 *  @return The index of the first element where the block returns YES
 *  @see Prefixed counterpart `-[NSArray(FunkyPrefixedUtilities) funky_last:]`
 */
- (id)last:(BOOL(^)(ObjectType item))block;

/**
 *  Returns the index of the last element, where the predicate matches
 *
 *  @param block The condition provided as a BOOL expression.
 *  @return The index of the last element where the block returns YES
 *  @see Prefixed counterpart `-[NSArray(FunkyPrefixedUtilities) funky_lastIndex:]`
 */
- (NSUInteger)lastIndex:(BOOL(^)(ObjectType item))block;

#pragma mark - Take

/**
 *  Returns an array of the values where the predicate matches, but only until it's a consecutive sequence. Once the predicate returns NO, those elements are going to be dropped.
 *
 *  @param block The condition provided as a BOOL expression.
 *  @return The first subsequence of elements until the block returns YES
 *  @see Prefixed counterpart `-[NSArray(FunkyPrefixedUtilities) funky_take:]`
 */
- (NSArray<ObjectType>*)take:(BOOL(^)(ObjectType item))block;

/**
 *  Returns an array of the values where the predicate matches, but only the last consecutive sequence of these element. Same as take, but from the end of the array.
 *
 *  @param block The condition provided as a BOOL expression.
 *  @return The last subsequence of elements from where the block returns YES
 *  @see Prefixed counterpart `-[NSArray(FunkyPrefixedUtilities) funky_takeLast:]`
 */
- (NSArray<ObjectType>*)takeLast:(BOOL(^)(ObjectType item))block;

#pragma mark - from-until

/**
 *  Returns an array of the values starting from the given object, not including the object itself. If the given object does not exist in the array, the result is going to be an empty NSArray.
 *
 *  @param value The signaling object.
 *  @return A subsequence of elements starting from the first occurence of the given object
 *  @see Prefixed counterpart `-[NSArray(FunkyPrefixedUtilities) funky_fromValueExclusive:]`
 */
- (NSArray<ObjectType>*)fromValueExclusive:(id)value;

/**
 *  Returns an array of the values starting from the given object, including the object itself. If the given object does not exist in the array, the result is going to be an empty NSArray.
 *
 *  @param value The signaling value, which is going to be represent in the array as the first element.
 *  @return A subsequence of elements starting from the first occurence of the given object
 *  @see Prefixed counterpart `-[NSArray(FunkyPrefixedUtilities) funky_fromValueInclusive:]`
 */
- (NSArray<ObjectType>*)fromValueInclusive:(id)value;

/**
 *  Returns an array of the values starting from the given index, not including the object at the given index. If the given index does not exist in the array, the result is going to be an empty NSArray.
 *
 *  @param index The starting index.
 *  @return A subsequence of elements starting from the given index
 *  @see Prefixed counterpart `-[NSArray(FunkyPrefixedUtilities) funky_fromIndexExclusive:]`
 */
- (NSArray<ObjectType>*)fromIndexExclusive:(NSInteger)index;

/**
 *  Returns an array of the values starting from the given index, including the object at the fiven index. If the given index does not exist in the array, the result is going to be an empty NSArray.
 *
 *  @param index The signaling index, where the element at the index is going to be represent in the array as the first element.
 *  @return A subsequence of elements starting from the given index
 *  @see Prefixed counterpart `-[NSArray(FunkyPrefixedUtilities) funky_fromIndexInclusive:]`
 */
- (NSArray<ObjectType>*)fromIndexInclusive:(NSInteger)index;

/**
 *  Returns an array of the values until the given object, not including the object itself. If the given object does not exist in the array, the result is going to be an empty NSArray.
 *
 *  @param value The signaling object.
 *  @return A subsequence of elements until the first occurence of the given object
 *  @see Prefixed counterpart `-[NSArray(FunkyPrefixedUtilities) funky_untilValueExclusive:]`
 */
- (NSArray<ObjectType>*)untilValueExclusive:(id)value;

/**
 *  Returns an array of the values until the given object, including the object itself. If the given object does not exist in the array, the result is going to be an empty NSArray.
 *
 *  @param value The signaling value, which is going to be represent in the array as the last element.
 *  @return A subsequence of elements until the first occurence of the given object
 *  @see Prefixed counterpart `-[NSArray(FunkyPrefixedUtilities) funky_untilValueInclusive:]`
 */
- (NSArray<ObjectType>*)untilValueInclusive:(id)value;

/**
 *  Returns an array of the values until the given index, not including the object at the given index. If the given index does not exist in the array, the result is going to be an empty NSArray.
 *
 *  @param index The starting index.
 *  @return A subsequence of elements until the given index
 *  @see Prefixed counterpart `-[NSArray(FunkyPrefixedUtilities) funky_untilIndexExclusive:]`
 */
- (NSArray<ObjectType>*)untilIndexExclusive:(NSInteger)index;

/**
 *  Returns an array of the values until the given index, including the object at the fiven index. If the given index does not exist in the array, the result is going to be an empty NSArray.
 *
 *  @param index The signaling index, where the element at the index is going to be represent in the array as the last element.
 *  @return A subsequence of elements until the given index
 *  @see Prefixed counterpart `-[NSArray(FunkyPrefixedUtilities) funky_untilIndexInclusive:]`
 */
- (NSArray<ObjectType>*)untilIndexInclusive:(NSInteger)index;

/**
 *  Returns an array of the values between the given two input objects, excluding both from the result set.
 *  If the starting object does not exist in the array, it's equivalent to the matching untilValue expression.
 *  If the ending object does not exist in the array, it's equivalent to the matching fromValue expression.
 *  If neither one exists, the result is an empty NSArray.
 *
 *  @param from The starting object.
 *  @param until The ending object.
 *  @see Prefixed counterpart `-[NSArray(FunkyPrefixedUtilities) funky_fromValueExclusive:untilValueExclusive:]`
 *  @return A subsequence of elements between the first occurences given objects
 */
- (NSArray<ObjectType>*)fromValueExclusive:(id)from untilValueExclusive:(id)until;

/**
 *  Returns an array of the values between the given two input objects, excluding `from`, including `until` from the result set.
 *  If the starting object does not exist in the array, it's equivalent to the matching untilValue expression.
 *  If the ending object does not exist in the array, it's equivalent to the matching fromValue expression.
 *  If neither one exists, the result is an empty NSArray.
 *
 *  @param from The starting object.
 *  @param until The ending object.
 *  @return A subsequence of elements between the first occurences given objects
 *  @see Prefixed counterpart `-[NSArray(FunkyPrefixedUtilities) funky_fromValueExclusive:untilValueInclusive:]`
 */
- (NSArray<ObjectType>*)fromValueExclusive:(id)from untilValueInclusive:(id)until;

/**
 *  Returns an array of the values between the given two input objects, including `from`, excluding `until` from the result set.
 *  If the starting object does not exist in the array, it's equivalent to the matching untilValue expression.
 *  If the ending object does not exist in the array, it's equivalent to the matching fromValue expression.
 *  If neither one exists, the result is an empty NSArray.
 *
 *  @param from The starting object.
 *  @param until The ending object.
 *  @return A subsequence of elements between the first occurences given objects
 *  @see Prefixed counterpart `-[NSArray(FunkyPrefixedUtilities) funky_fromValueInclusive:untilValueExclusive:]`
 */
- (NSArray<ObjectType>*)fromValueInclusive:(id)from untilValueExclusive:(id)until;

/**
 *  Returns an array of the values between the given two input objects, including both from the result set.
 *  If the starting object does not exist in the array, it's equivalent to the matching untilValue expression.
 *  If the ending object does not exist in the array, it's equivalent to the matching fromValue expression.
 *  If neither one exists, the result is an empty NSArray.
 *
 *  @param from The starting object.
 *  @param until The ending object.
 *  @return A subsequence of elements between the first occurences given objects
 *  @see Prefixed counterpart `-[NSArray(FunkyPrefixedUtilities) funky_fromValueInclusive:untilValueInclusive:]`
 */
- (NSArray<ObjectType>*)fromValueInclusive:(id)from untilValueInclusive:(id)until;

/**
 *  Returns an array of the values between the given two indices, excluding both objects (at the given indices) from the result set.
 *  If the starting index does not exist in the array, it's equivalent to the matching untilIndex expression.
 *  If the ending index does not exist in the array, it's equivalent to the matching fromIndex expression.
 *  If neither one exists, the result is an empty NSArray.
 *
 *  @param from The starting index.
 *  @param until The ending index.
 *  @return A subsequence of elements between the first occurences given indices
 *  @see Prefixed counterpart `-[NSArray(FunkyPrefixedUtilities) funky_fromIndexExclusive:untilIndexExclusive:]`
 */
- (NSArray<ObjectType>*)fromIndexExclusive:(NSInteger)from untilIndexExclusive:(NSInteger)until;

/**
 *  Returns an array of the values between the given two indices, excluding the object at the index `from`, including the one at the index `until` from the result set.
 *  If the starting index does not exist in the array, it's equivalent to the matching untilIndex expression.
 *  If the ending index does not exist in the array, it's equivalent to the matching fromIndex expression.
 *  If neither one exists, the result is an empty NSArray.
 *
 *  @param from The starting index.
 *  @param until The ending index.
 *  @return A subsequence of elements between the first occurences given indices
 *  @see Prefixed counterpart `-[NSArray(FunkyPrefixedUtilities) funky_fromIndexExclusive:untilIndexInclusive:]`
 */
- (NSArray<ObjectType>*)fromIndexExclusive:(NSInteger)from untilIndexInclusive:(NSInteger)until;

/**
 *  Returns an array of the values between the given two indices, including the object at the index `from`, excluding the one at the index `until` from the result set.
 *  If the starting index does not exist in the array, it's equivalent to the matching untilIndex expression.
 *  If the ending index does not exist in the array, it's equivalent to the matching fromIndex expression.
 *  If neither one exists, the result is an empty NSArray.
 *
 *  @param from The starting index.
 *  @param until The ending index.
 *  @return A subsequence of elements between the first occurences given indices
 *  @see Prefixed counterpart `-[NSArray(FunkyPrefixedUtilities) funky_fromIndexInclusive:untilIndexExclusive:]`
 */
- (NSArray<ObjectType>*)fromIndexInclusive:(NSInteger)from untilIndexExclusive:(NSInteger)until;

/**
 *  Returns an array of the values between the given two indices, including both objects (at the given indices) from the result set.
 *  If the starting index does not exist in the array, it's equivalent to the matching untilIndex expression.
 *  If the ending index does not exist in the array, it's equivalent to the matching fromIndex expression.
 *  If neither one exists, the result is an empty NSArray.
 *
 *  @param from The starting index.
 *  @param until The ending index.
 *  @return A subsequence of elements between the first occurences given indices
 *  @see Prefixed counterpart `-[NSArray(FunkyPrefixedUtilities) funky_fromIndexInclusive:untilIndexInclusive:]`
 */
- (NSArray<ObjectType>*)fromIndexInclusive:(NSInteger)from untilIndexInclusive:(NSInteger)until;

#pragma mark - Transform

/**
 *  Returns an array where is object is unique, so the resulting array does not contain any duplicates.
 *  It checks equality using the `-isEqual:` method
 *
 *  @return A new NSArray consisting of unique objects
 *  @see Mutable counterpart `-[NSMutableArray(FunkyUtilities) removeDuplicates]`
 *  @see Prefixed counterpart `-[NSArray(FunkyPrefixedUtilities) funky_unique]`
 */
- (NSArray<ObjectType>*)unique;

/**
 *  Returns an array where the items are in a reversed order.
 *
 *  @return A new NSArray in reverese order compared to the original one
 *  @see Mutable counterpart `-[NSMutableArray(FunkyUtilities) reverse]`
 *  @see Prefixed counterpart `-[NSArray(FunkyPrefixedUtilities) funky_reversed]`
 */
- (NSArray<ObjectType>*)reversed;

/**
 *  Returns an array where the items are shuffled randomly.
 *
 *  @return A new NSArray consisting of the original objects in a shuffled order
 *  @see Mutable counterpart `-[NSMutableArray(FunkyUtilities) shuffle]`
 *  @see Prefixed counterpart `-[NSArray(FunkyPrefixedUtilities) funky_shuffled]`
 */
- (NSArray<ObjectType>*)shuffled;

#pragma mark - Sort

/**
 *  Returns an array sorted using the given comparator.
 *
 *  @param comparator An NSComparator block to define the sort order.
 *  @return A new NSArray sorted by the comparator
 *  @see Mutable counterpart `-[NSMutableArray(FunkyUtilities) sort:]`
 *  @see Prefixed counterpart `-[NSArray(FunkyPrefixedUtilities) funky_sorted:]`
 */
- (NSArray<ObjectType>*)sorted:(NSComparator)comparator;

#pragma mark - Constructor

/**
 *  Creates an array by repeating the same `item` by `repeat` number of times. The size of the array is going to be qual to `repeat`, only consisting of `item` objects.
 *
 *  @param item The item to repeat
 *  @param repeat Number of times to repeat the `item` parameter
 *  @return A new NSArray instance with the given item repeated
 *  @see Mutable counterpart `+[NSMutableArray(FunkyUtilities) arrayWithItem:repeated:]`
 *  @see Prefixed counterpart `+[NSArray(FunkyPrefixedUtilities) funky_arrayWithItem:repeated:]`
 */
+ (NSArray<ObjectType>*)arrayWithItem:(id)item repeated:(NSUInteger)repeat;

/**
 *  Creates an array by taking an initial `array` and computing the next items by repeatedly putting the result of `block` by `repeated` number of times.
 *
 *  @param array Initial array
 *  @param block The block to compute the next item in the resulting array
 *  @param repeat Number of times to repeat calling the `block` parameter
 *  @return A new NSArray instance with items returned by the block
 *  @see Mutable counterpart `+[NSMutableArray(FunkyUtilities) arrayWithArray:nextItem:repeated:]`
 *  @see Prefixed counterpart `+[NSArray(FunkyPrefixedUtilities) funky_arrayWithArray:nextItem:repeated:]`
 */
+ (NSArray<ObjectType>*)arrayWithArray:(NSArray<ObjectType>*)array nextItem:(id(^)(NSArray* array))block repeated:(NSUInteger)repeat;

/**
 *  Creates an array by taking an initial `array` and computing the next items by repeatedly putting the result of `block` by until the block parameter `until` returns YES.
 *
 *  @param array Initial array
 *  @param block The block to compute the next item in the resulting array
 *  @param until Logic until the iteration should be repeated. Until the block returns YES, the constructor repeatedly callis the `block` parameter
 *  @return A new NSArray instance with items returned by the block
 *  @see Mutable counterpart `+[NSMutableArray(FunkyUtilities) arrayWithArray:nextItem:until:]`
 *  @see Prefixed counterpart `+[NSArray(FunkyPrefixedUtilities) funky_arrayWithArray:nextItem:until:]`
 */
+ (NSArray<ObjectType>*)arrayWithArray:(NSArray<ObjectType>*)array nextItem:(id(^)(NSArray* array))block until:(BOOL(^)(NSArray* array))until;

@end

/**
 *  This extension provides simple and easy to use functional and general utilities for NSMutableArray.
 *  If you need to prefix the extension methods in this category, you should import `NSArray+FunkyPrefixedUtilities.h`, where every utility method is prefixed with the `funky_` keyword for compatiblitiy reasons.
 *
 *  @see Prefixed counterpart `NSMutableArray(FunkyPrefixedUtilities)`
 *  @see Immutable counterpart `NSArray(FunkyUtilities)`
 */
@interface NSMutableArray <ObjectType> (FunkyUtilities)

#pragma mark - Flatten

/**
 *  Makes the array structure a squence with flat elements, containing no NSArrays
 *
 *  @see Immutable counterpart `-[NSArray(FunkyUtilities) flattened]`
 *  @see Prefixed counterpart `-[NSMutableArray(FunkyPrefixedUtilities) funky_flatten]`
 */
- (void)flatten;

#pragma mark - Transform

/**
 *  Puts the containing items (in place) in a reversed order.
 *
 *  @see Immutable counterpart `-[NSArray(FunkyUtilities) reversed]`
 *  @see Prefixed counterpart `-[NSMutableArray(FunkyPrefixedUtilities) funky_reverse]`
 */
- (void)reverse;

/**
 *  Shuffles the containing items (in place) in a random fashion.
 *
 *  @see Immutable counterpart `-[NSArray(FunkyUtilities) shuffled]`
 *  @see Prefixed counterpart `-[NSMutableArray(FunkyPrefixedUtilities) funky_shuffle]`
 */
- (void)shuffle;

/**
 *  Makes the array unique (in place) by removing the duplicated items from the containing items. The method does this keeping the first occurence and removes the further duplications.
 *  It checks equality using the `-isEqual:` method
 *
 *  @see Immutable counterpart `-[NSArray(FunkyUtilities) unique]`
 *  @see Prefixed counterpart `-[NSMutableArray(FunkyPrefixedUtilities) funky_removeDuplicates]`
 */
- (void)removeDuplicates;

#pragma mark - Merge

/**
 *  Concatenates the current array (in place) with the one given in the parameter. It does this by putting the existing elements first, and the elements in the provided array afterwards.
 *
 *  @param array The other collection to merge with
 *  @see Immutable counterpart `-[NSArray(FunkyUtilities) merged:]`
 *  @see Prefixed counterpart `-[NSMutableArray(FunkyPrefixedUtilities) funky_merge:]`
 */
- (void)merge:(NSArray<ObjectType>*)array;

#pragma mark - Sort

/**
 *  Sorts the array (in place) using the given comparator.
 *
 *  @param comparator An NSComparator block to define the sort order.
 *  @see Immutable counterpart `-[NSArray(FunkyUtilities) sorted:]`
 *  @see Prefixed counterpart `-[NSMutableArray(FunkyPrefixedUtilities) funky_sort:]`
 */
- (void)sort:(NSComparator)comparator;

#pragma mark - Filter

/**
 *  Filters the array using the given predicate, keeping the elements that are passing the test.
 *
 *  @param block The predicate used to filter the results.
 *  @see Immutable counterpart `-[NSArray(FunkyUtilities) filtered:]`
 *  @see Prefixed counterpart `-[NSMutableArray(FunkyPrefixedUtilities) funky_filter:]`
 */
- (void)filter:(BOOL(^)(ObjectType item))block;

#pragma mark - Constructor

/**
 *  Creates a mutable array by repeating the same `item` by `repeat` number of times. The size of the array is going to be qual to `repeat`, only consisting of `item` objects.
 *
 *  @param item The item to repeat
 *  @param repeat Number of times to repeat the `item` parameter
 *  @return A new NSMutableArray instance with the given item repeated
 *  @see Immutable counterpart `+[NSArray(FunkyUtilities) arrayWithItem:repeated:]`
 *  @see Prefixed counterpart `+[NSMutableArray(FunkyPrefixedUtilities) funky_arrayWithItem:repeated:]`
 */
+ (NSMutableArray<ObjectType>*)arrayWithItem:(id)item repeated:(NSUInteger)repeat;

/**
 *  Creates a mutable array by taking an initial `array` and computing the next items by repeatedly putting the result of `block` by `repeated` number of times.
 *
 *  @param array Initial array
 *  @param block The block to compute the next item in the resulting array
 *  @param repeat Number of times to repeat calling the `block` parameter
 *  @return A new NSMutableArray instance with items returned by the block
 *  @see Immutable counterpart `+[NSArray(FunkyUtilities) arrayWithArray:nextItem:repeated:]`
 *  @see Prefixed counterpart `+[NSMutableArray(FunkyPrefixedUtilities) funky_arrayWithArray:nextItem:repeated:]`
 */
+ (NSMutableArray<ObjectType>*)arrayWithArray:(NSArray<ObjectType>*)array nextItem:(id(^)(NSMutableArray* array))block repeated:(NSUInteger)repeat;

/**
 *  Creates a mutable array by taking an initial `array` and computing the next items by repeatedly putting the result of `block` by until the block parameter `until` returns YES.
 *
 *  @param array Initial array
 *  @param block The block to compute the next item in the resulting array
 *  @param until Logic until the iteration should be repeated. Until the block returns YES, the constructor repeatedly callis the `block` parameter
 *  @return A new NSMutableArray instance with items returned by the block
 *  @see Immutable counterpart `+[NSArray(FunkyUtilities) arrayWithArray:nextItem:until:]`
 *  @see Prefixed counterpart `+[NSMutableArray(FunkyPrefixedUtilities) funky_arrayWithArray:nextItem:until:]`
 */
+ (NSMutableArray<ObjectType>*)arrayWithArray:(NSArray<ObjectType>*)array nextItem:(id(^)(NSMutableArray* array))block until:(BOOL(^)(NSArray* array))until;

@end
