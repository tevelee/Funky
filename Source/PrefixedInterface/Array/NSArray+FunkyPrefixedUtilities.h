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
 *  All the methods in this category are prefixed with the `funky_` keyword for compatibility reasons. If you prefer unprefixed utilities, you should import `NSArray+FunkyUtilities.h`.
 *
 *  @see Unprefixed counterpart `NSArray(FunkyUtilities)`
 *  @see Mutable counterpart `NSMutableArray(FunkyPrefixedUtilities)`
 */
@interface NSArray <__covariant ObjectType> (FunkyPrefixedUtilities)

#pragma mark - Check

/**
 *  Returns whether the condition matches all elements in the array
 *
 *  @param block The condition given as a BOOL expression
 *  @return YES if condition matches all elements, NO otherwise
 *  @see Unprefixed counterpart `-[NSArray(FunkyUtilities) all:]`
 */
- (BOOL)funky_all:(BOOL(^)(ObjectType item))block;

/**
 *  Returns whether the condition matches no elements in the array
 *
 *  @param block The condition given as a BOOL expression
 *  @return NO if condition matches any of the elements, YES otherwise
 *  @see Unprefixed counterpart `-[NSArray(FunkyUtilities) none:]`
 */
- (BOOL)funky_none:(BOOL(^)(ObjectType item))block;

/**
 *  Returns whether the condition matches at least one element in the array
 *
 *  @param block The condition given as a BOOL expression
 *  @return YES if condition matches any of the elements, NO otherwise
 *  @see Unprefixed counterpart `-[NSArray(FunkyUtilities) contains:]`
 */
- (BOOL)funky_contains:(BOOL(^)(ObjectType item))block;

#pragma mark - Count

/**
 *  Returns the number of elements the given condition matches in the array, like if you would filter the array.
 *
 *  @param block The condition given as a BOOL expression
 *  @return Number of occasions where the condition matches in the array
 *  @see Unprefixed counterpart `-[NSArray(FunkyUtilities) count:]`
 */
- (NSUInteger)funky_count:(BOOL(^)(ObjectType item))block;

#pragma mark - Map

/**
 *  Returns a new NSArray instance with the same amount of elements, where each element is transformed to another by returning a new object in the block parameter.
 *
 *  @param block The transformator code which should return a new value based on the existing one.
 *  @return A new NSArray instance where each element is formed by the result of the block calls
 *  @see Unprefixed counterpart `-[NSArray(FunkyUtilities) map:]`
 */
- (NSArray*)funky_map:(id(^)(ObjectType item))block;

/**
 *  Returns a new NSArray instance where each element is transformed to another by returning a new object in the block parameter. It ignores the nil parameters returned from the block.
 *
 *  @param block The transformator code which should return a new value based on the existing one.
 *  @return A new NSArray instance where each element is formed by the result of the block calls
 *  @see Unprefixed counterpart `-[NSArray(FunkyUtilities) nilTolerantMap:]`
 */
- (NSArray*)funky_nilTolerantMap:(id(^)(ObjectType item))block;

/**
 *  Same as map, but the block contains the index of the current element.
 *
 *  @param block The transformator code which should return a new value based on the index and the existing item.
 *  @return A new NSArray instance where each element is formed by the result of the block calls
 *  @see Unprefixed counterpart `-[NSArray(FunkyUtilities) mapWithIndex:]`
 */
- (NSArray*)funky_mapWithIndex:(id(^)(NSUInteger index, ObjectType item))block;

/**
 *  Same as nil-tolerant map, but the block contains the index of the current element.
 *
 *  @param block The transformator code which should return a new value based on the index and the existing item.
 *  @return A new NSArray instance where each element is formed by the result of the block calls
 *  @see Unprefixed counterpart `-[NSArray(FunkyUtilities) nilTolerantMapWithIndex:]`
 */
- (NSArray*)funky_nilTolerantMapWithIndex:(id(^)(NSUInteger index, ObjectType item))block;

/**
 *  Returns a new NSArray instance with the same amount of elements, where each element is transformed to another by returning a new object in the block parameter. Same as map, but the result is going to be flattened, so if you return an NSArray any iteration, it is going to be converted into a flat structure, not an array of arrays.
 *
 *  @param block The transformator code which should return a new value based on the existing one.
 *  @return A new NSArray instance where each element is formed by the result of the flattened block calls
 *  @see Unprefixed counterpart `-[NSArray(FunkyUtilities) flatMap:]`
 */
- (NSArray*)funky_flatMap:(id(^)(ObjectType item))block;

/**
 *  Same as flatMap, but the block contains the index of the current element.
 *
 *  @param block The transformator code which should return a new value based on the index and the existing item.
 *  @return A new NSArray instance where each element is formed by the result of the flattened block calls
 *  @see Unprefixed counterpart `-[NSArray(FunkyUtilities) flatMapWithIndex:]`
 */
- (NSArray*)funky_flatMapWithIndex:(id(^)(NSUInteger index, ObjectType item))block;

#pragma mark - Filter

/**
 *  Returns a new NSArray instance with the element, that are passing the returned expression in the original array.
 *
 *  @param block The filtering predicate given as a BOOL expression
 *  @return A new NSArray instance where each element is selected from the original one where the block returned YES
 *  @see Mutable counterpart `-[NSMutableArray(FunkyPrefixedUtilities) funky_filter:]`
 *  @see Unprefixed counterpart `-[NSArray(FunkyUtilities) filtered:]`
 */
- (NSArray<ObjectType>*)funky_filtered:(BOOL(^)(ObjectType item))block;

#pragma mark - Flatten

/**
 *  Flattens the array, meaning that if it consisted of Array items, they are going to be flattened into one flat structure of elements. An array of arrays will transform to an array of elements from each of the previous arrays. This computation is performed deeply, meaning that it contontued flattening elements, until they produce a flat structure.
 *
 *  @return A new NSArray instance where the elements don't contain NSArrays
 *  @see Mutable counterpart `-[NSMutableArray(FunkyPrefixedUtilities) funky_flattened]`
 *  @see Unprefixed counterpart `-[NSArray(FunkyUtilities) flattened]`
 */
- (NSArray<ObjectType>*)funky_flattened;

#pragma mark - Merge

/**
 *  Returns a new NSArray instance, in which concatenates the two arrays by putting the existing elements first, and the elements in the provided array after them.
 *
 *  @param array The other collection to merge with
 *  @return A new NSArray which contains the elements of both arrays (self and the `array` parameter)
 *  @see Mutable counterpart `-[NSMutableArray(FunkyPrefixedUtilities) funky_merge:]`
 *  @see Unprefixed counterpart `-[NSArray(FunkyUtilities) merged:]`
 */
- (NSArray*)funky_merged:(NSArray*)array;

#pragma mark - For each

/**
 *  Calls every element of the array once.
 *
 *  @param block A block, giving the current item in each iteration.
 *  @see Unprefixed counterpart `-[NSArray(FunkyUtilities) forEach:]`
 */
- (void)funky_forEach:(void(^)(ObjectType item))block;

/**
 *  Calls every element of the array once. Same as forEach, but the block contains the index of the current element as well.
 *
 *  @param block A block, giving the current item and its index in each iteration.
 *  @see Unprefixed counterpart `-[NSArray(FunkyUtilities) forEachWithIndex:]`
 */
- (void)funky_forEachWithIndex:(void(^)(NSUInteger index, ObjectType item))block;

#pragma mark - Grouping

/**
 *  Groups elements to an NSDictionary, where the returned element serves as a key, and the objects as the value. If multiple elements are returned with the same key, this function will use the first matching element.
 *
 *  @param block A block which returns a key (based on the passed element) used as the key in the dictionary for that element.
 *  @return An NSDictionary where keys are produced by the result of the block call, and the values are the original elements
 *  @see Unprefixed counterpart `-[NSArray(FunkyUtilities) groupByUsingFirst:]`
 */
- (NSDictionary<id, ObjectType>*)funky_groupByUsingFirst:(id(^)(ObjectType item))block;

/**
 *  Groups elements to an NSDictionary, where the returned element serves as a key, and the objects as the value. If multiple elements are returned with the same key, this function will use the last matching element.
 *
 *  @param block A block which returns a key (based on the passed element) used as the key in the dictionary for that element.
 *  @return An NSDictionary where keys are produced by the result of the block call, and the values are the original elements
 *  @see Unprefixed counterpart `-[NSArray(FunkyUtilities) groupByUsingLast:]`
 */
- (NSDictionary<id, ObjectType>*)funky_groupByUsingLast:(id(^)(ObjectType item))block;

/**
 *  Groups elements to an NSDictionary, where the returned element serves as a key, and the objects as the value. The elements in the resulting Dictionary are arrays, so if multiple elements return the same keys, all of them are going to be included in the value.
 *
 *  @param block A block which returns a key (based on the passed element) used as the key in the dictionary.
 *  @return An NSDictionary where keys are produced by the result of the blocks, and the values are an array of original elements
 *  @see Unprefixed counterpart `-[NSArray(FunkyUtilities) associateBy:]`
 */
- (NSDictionary<id, NSArray<ObjectType>*>*)funky_associateBy:(id(^)(ObjectType item))block;

#pragma mark - Compute

/**
 *  Produces an aggregated value based on the elements of the array.
 *
 *  @param start The value to start with. At first this is going to be the rolling value.
 *  @param block The computation logic, which takes the rolling value and the current item and aggregates them using some custom logic.
 *  @return A custom value which is produced by computing all the elements with a custom logic, returned in `block`
 *  @see Unprefixed counterpart `-[NSArray(FunkyUtilities) reduce:withInitialValue:]`
 */
- (id)funky_reduce:(id(^)(id value, ObjectType item))block withInitialValue:(id)start;

/**
 *  A special use-case of reduce, which summarises the returned double values for each element in the array.
 *
 *  @param block A block which returns double value, based on the current element.
 *  @return The sum of all elements, where the numbers are computed are transformed based on the original elements
 *  @see Unprefixed counterpart `-[NSArray(FunkyUtilities) sum:]`
 */
- (double)funky_sum:(double(^)(ObjectType item))block;

/**
 *  A special use-case of reduce, which takes the average value of the returned double values for each element in the array.
 *
 *  @param block A block which returns double value, based on the current element.
 *  @return The average of all elements, where the numbers are computed are transformed based on the original elements
 *  @see Unprefixed counterpart `-[NSArray(FunkyUtilities) average:]`
 */
- (double)funky_average:(double(^)(ObjectType item))block;

#pragma mark - Min/Max

/**
 *  A special use-case of reduce, which takes the minimum of the returned double values for each element in the array.
 *
 *  @param block A block which returns double value, based on the current element.
 *  @return The minimum of all elements, where the numbers are computed are transformed based on the original elements
 *  @see Unprefixed counterpart `-[NSArray(FunkyUtilities) minValue:]`
 */
- (double)funky_minValue:(double(^)(ObjectType item))block;

/**
 *  A special use-case of reduce, which takes the maximum of the returned double values for each element in the array.
 *
 *  @param block A block which returns double value, based on the current element.
 *  @return The maximum of all elements, where the numbers are computed are transformed based on the original elements
 *  @see Unprefixed counterpart `-[NSArray(FunkyUtilities) maxValue:]`
 */
- (double)funky_maxValue:(double(^)(ObjectType item))block;

/**
 *  Returns an array with all the minimal value elements in the array, where the minimum was computed by the returned double value for each element in the array.
 *
 *  @param block A block which returns double value, based on the current element.
 *  @return The array of elements with the minimal value, where the numbers are computed are transformed based on the original elements
 *  @see Unprefixed counterpart `-[NSArray(FunkyUtilities) minItems:]`
 */
- (NSArray<ObjectType>*)funky_minItems:(double(^)(ObjectType item))block;

/**
 *  Returns an array with all the maximal value elements in the array, where the maximum was computed by the returned double value for each element in the array.
 *
 *  @param block A block which returns double value, based on the current element.
 *  @return The array of elements with the maximal value, where the numbers are computed are transformed based on the original elements
 *  @see Unprefixed counterpart `-[NSArray(FunkyUtilities) maxItems:]`
 */
- (NSArray<ObjectType>*)funky_maxItems:(double(^)(ObjectType item))block;

#pragma mark - First/Last

/**
 *  Returns the first index of the array: 0
 *
 *  @return the first index of the array
 *  @see Unprefixed counterpart `-[NSArray(FunkyUtilities) firstIndex]`
 */
- (NSUInteger)funky_firstIndex;

/**
 *  Returns the last index of the array: count - 1
 *
 *  @return the last index of the array
 *  @see Unprefixed counterpart `-[NSArray(FunkyUtilities) lastIndex]`
 */
- (NSUInteger)funky_lastIndex;

/**
 *  Returns the first element, where the predicate matches
 *
 *  @param block The condition provided as a BOOL expression.
 *  @return The first element where the block returns YES
 *  @see Unprefixed counterpart `-[NSArray(FunkyUtilities) first:]`
 */
- (id)funky_first:(BOOL(^)(ObjectType item))block;

/**
 *  Returns the index of the first element, where the predicate matches
 *
 *  @param block The condition provided as a BOOL expression.
 *  @return The index of the first element where the block returns YES
 *  @see Unprefixed counterpart `-[NSArray(FunkyUtilities) firstIndex:]`
 */
- (NSUInteger)funky_firstIndex:(BOOL(^)(ObjectType item))block;

/**
 *  Returns the last element, where the predicate matches
 *
 *  @param block The condition provided as a BOOL expression.
 *  @return The index of the first element where the block returns YES
 *  @see Unprefixed counterpart `-[NSArray(FunkyUtilities) last:]`
 */
- (id)funky_last:(BOOL(^)(ObjectType item))block;

/**
 *  Returns the index of the last element, where the predicate matches
 *
 *  @param block The condition provided as a BOOL expression.
 *  @return The index of the last element where the block returns YES
 *  @see Unprefixed counterpart `-[NSArray(FunkyUtilities) lastIndex:]`
 */
- (NSUInteger)funky_lastIndex:(BOOL(^)(ObjectType item))block;

#pragma mark - Take

/**
 *  Returns an array of the values where the predicate matches, but only until it's a consecutive sequence. Once the predicate returns NO, those elements are going to be dropped.
 *
 *  @param block The condition provided as a BOOL expression.
 *  @return The first subsequence of elements until the block returns YES
 *  @see Unprefixed counterpart `-[NSArray(FunkyUtilities) take:]`
 */
- (NSArray<ObjectType>*)funky_take:(BOOL(^)(ObjectType item))block;

/**
 *  Returns an array of the values where the predicate matches, but only the last consecutive sequence of these element. Same as take, but from the end of the array.
 *
 *  @param block The condition provided as a BOOL expression.
 *  @return The last subsequence of elements from where the block returns YES
 *  @see Unprefixed counterpart `-[NSArray(FunkyUtilities) takeLast:]`
 */
- (NSArray<ObjectType>*)funky_takeLast:(BOOL(^)(ObjectType item))block;

#pragma mark - from-until

/**
 *  Returns an array of the values starting from the given object, not including the object itself. If the given object does not exist in the array, the result is going to be an empty NSArray.
 *
 *  @param value The signaling object.
 *  @return A subsequence of elements starting from the first occurence of the given object
 *  @see Unprefixed counterpart `-[NSArray(FunkyUtilities) fromValueExclusive:]`
 */
- (NSArray<ObjectType>*)funky_fromValueExclusive:(id)value;

/**
 *  Returns an array of the values starting from the given object, including the object itself. If the given object does not exist in the array, the result is going to be an empty NSArray.
 *
 *  @param value The signaling value, which is going to be represent in the array as the first element.
 *  @return A subsequence of elements starting from the first occurence of the given object
 *  @see Unprefixed counterpart `-[NSArray(FunkyUtilities) fromValueInclusive:]`
 */
- (NSArray<ObjectType>*)funky_fromValueInclusive:(id)value;

/**
 *  Returns an array of the values starting from the given index, not including the object at the given index. If the given index does not exist in the array, the result is going to be an empty NSArray.
 *
 *  @param index The starting index.
 *  @return A subsequence of elements starting from the given index
 *  @see Unprefixed counterpart `-[NSArray(FunkyUtilities) fromIndexExclusive:]`
 */
- (NSArray<ObjectType>*)funky_fromIndexExclusive:(NSInteger)index;

/**
 *  Returns an array of the values starting from the given index, including the object at the fiven index. If the given index does not exist in the array, the result is going to be an empty NSArray.
 *
 *  @param index The signaling index, where the element at the index is going to be represent in the array as the first element.
 *  @return A subsequence of elements starting from the given index
 *  @see Unprefixed counterpart `-[NSArray(FunkyUtilities) fromIndexInclusive:]`
 */
- (NSArray<ObjectType>*)funky_fromIndexInclusive:(NSInteger)index;

/**
 *  Returns an array of the values until the given object, not including the object itself. If the given object does not exist in the array, the result is going to be an empty NSArray.
 *
 *  @param value The signaling object.
 *  @return A subsequence of elements until the first occurence of the given object
 *  @see Unprefixed counterpart `-[NSArray(FunkyUtilities) untilValueExclusive:]`
 */
- (NSArray<ObjectType>*)funky_untilValueExclusive:(id)value;

/**
 *  Returns an array of the values until the given object, including the object itself. If the given object does not exist in the array, the result is going to be an empty NSArray.
 *
 *  @param value The signaling value, which is going to be represent in the array as the last element.
 *  @return A subsequence of elements until the first occurence of the given object
 *  @see Unprefixed counterpart `-[NSArray(FunkyUtilities) untilValueInclusive:]`
 */
- (NSArray<ObjectType>*)funky_untilValueInclusive:(id)value;

/**
 *  Returns an array of the values until the given index, not including the object at the given index. If the given index does not exist in the array, the result is going to be an empty NSArray.
 *
 *  @param index The starting index.
 *  @return A subsequence of elements until the given index
 *  @see Unprefixed counterpart `-[NSArray(FunkyUtilities) untilIndexExclusive:]`
 */
- (NSArray<ObjectType>*)funky_untilIndexExclusive:(NSInteger)index;

/**
 *  Returns an array of the values until the given index, including the object at the fiven index. If the given index does not exist in the array, the result is going to be an empty NSArray.
 *
 *  @param index The signaling index, where the element at the index is going to be represent in the array as the last element.
 *  @return A subsequence of elements until the given index
 *  @see Unprefixed counterpart `-[NSArray(FunkyUtilities) untilIndexInclusive:]`
 */
- (NSArray<ObjectType>*)funky_untilIndexInclusive:(NSInteger)index;

/**
 *  Returns an array of the values between the given two input objects, excluding both from the result set. 
 *  If the starting object does not exist in the array, it's equivalent to the matching untilValue expression.
 *  If the ending object does not exist in the array, it's equivalent to the matching fromValue expression.
 *  If neither one exists, the result is an empty NSArray.
 *
 *  @param from The starting object.
 *  @param until The ending object.
 *  @see Unprefixed counterpart `-[NSArray(FunkyUtilities) fromValueExclusive:untilValueExclusive:]`
 */
- (NSArray<ObjectType>*)funky_fromValueExclusive:(id)from untilValueExclusive:(id)until;

/**
 *  Returns an array of the values between the given two input objects, excluding `from`, including `until` from the result set. 
 *  If the starting object does not exist in the array, it's equivalent to the matching untilValue expression.
 *  If the ending object does not exist in the array, it's equivalent to the matching fromValue expression.
 *  If neither one exists, the result is an empty NSArray.
 *
 *  @param from The starting object.
 *  @param until The ending object.
 *  @return A subsequence of elements between the first occurences given objects
 *  @see Unprefixed counterpart `-[NSArray(FunkyUtilities) fromValueExclusive:untilValueInclusive:]`
 */
- (NSArray<ObjectType>*)funky_fromValueExclusive:(id)from untilValueInclusive:(id)until;

/**
 *  Returns an array of the values between the given two input objects, including `from`, excluding `until` from the result set. 
 *  If the starting object does not exist in the array, it's equivalent to the matching untilValue expression.
 *  If the ending object does not exist in the array, it's equivalent to the matching fromValue expression.
 *  If neither one exists, the result is an empty NSArray.
 *
 *  @param from The starting object.
 *  @param until The ending object.
 *  @return A subsequence of elements between the first occurences given objects
 *  @see Unprefixed counterpart `-[NSArray(FunkyUtilities) fromValueInclusive:untilValueExclusive:]`
 */
- (NSArray<ObjectType>*)funky_fromValueInclusive:(id)from untilValueExclusive:(id)until;

/**
 *  Returns an array of the values between the given two input objects, including both from the result set. 
 *  If the starting object does not exist in the array, it's equivalent to the matching untilValue expression.
 *  If the ending object does not exist in the array, it's equivalent to the matching fromValue expression.
 *  If neither one exists, the result is an empty NSArray.
 *
 *  @param from The starting object.
 *  @param until The ending object.
 *  @return A subsequence of elements between the first occurences given objects
 *  @see Unprefixed counterpart `-[NSArray(FunkyUtilities) fromValueInclusive:untilValueInclusive:]`
 */
- (NSArray<ObjectType>*)funky_fromValueInclusive:(id)from untilValueInclusive:(id)until;

/**
 *  Returns an array of the values between the given two indices, excluding both objects (at the given indices) from the result set. 
 *  If the starting index does not exist in the array, it's equivalent to the matching untilIndex expression.
 *  If the ending index does not exist in the array, it's equivalent to the matching fromIndex expression.
 *  If neither one exists, the result is an empty NSArray.
 *
 *  @param from The starting index.
 *  @param until The ending index.
 *  @return A subsequence of elements between the first occurences given indices
 *  @see Unprefixed counterpart `-[NSArray(FunkyUtilities) fromIndexExclusive:untilValueExclusive:]`
 */
- (NSArray<ObjectType>*)funky_fromIndexExclusive:(NSInteger)from untilIndexExclusive:(NSInteger)until;

/**
 *  Returns an array of the values between the given two indices, excluding the object at the index `from`, including the one at the index `until` from the result set. 
 *  If the starting index does not exist in the array, it's equivalent to the matching untilIndex expression.
 *  If the ending index does not exist in the array, it's equivalent to the matching fromIndex expression.
 *  If neither one exists, the result is an empty NSArray.
 *
 *  @param from The starting index.
 *  @param until The ending index.
 *  @return A subsequence of elements between the first occurences given indices
 *  @see Unprefixed counterpart `-[NSArray(FunkyUtilities) fromIndexExclusive:untilValueInclusive:]`
 */
- (NSArray<ObjectType>*)funky_fromIndexExclusive:(NSInteger)from untilIndexInclusive:(NSInteger)until;

/**
 *  Returns an array of the values between the given two indices, including the object at the index `from`, excluding the one at the index `until` from the result set. 
 *  If the starting index does not exist in the array, it's equivalent to the matching untilIndex expression.
 *  If the ending index does not exist in the array, it's equivalent to the matching fromIndex expression.
 *  If neither one exists, the result is an empty NSArray.
 *
 *  @param from The starting index.
 *  @param until The ending index.
 *  @return A subsequence of elements between the first occurences given indices
 *  @see Unprefixed counterpart `-[NSArray(FunkyUtilities) fromIndexInclusive:untilValueExclusive:]`
 */
- (NSArray<ObjectType>*)funky_fromIndexInclusive:(NSInteger)from untilIndexExclusive:(NSInteger)until;

/**
 *  Returns an array of the values between the given two indices, including both objects (at the given indices) from the result set. 
 *  If the starting index does not exist in the array, it's equivalent to the matching untilIndex expression.
 *  If the ending index does not exist in the array, it's equivalent to the matching fromIndex expression.
 *  If neither one exists, the result is an empty NSArray.
 *
 *  @param from The starting index.
 *  @param until The ending index.
 *  @return A subsequence of elements between the first occurences given indices
 *  @see Unprefixed counterpart `-[NSArray(FunkyUtilities) fromIndexInclusive:untilValueInclusive:]`
 */
- (NSArray<ObjectType>*)funky_fromIndexInclusive:(NSInteger)from untilIndexInclusive:(NSInteger)until;

#pragma mark - Transform

/**
 *  Returns an array where is object is unique, so the resulting array does not contain any duplicates.
 *  It checks equality using the `-isEqual:` method
 *
 *  @return A new NSArray consisting of unique objects
 *  @see Mutable counterpart `-[NSMutableArray(FunkyPrefixedUtilities) funky_removeDuplicates]`
 *  @see Unprefixed counterpart `-[NSArray(FunkyUtilities) unique]`
 */
- (NSArray<ObjectType>*)funky_unique;

/**
 *  Returns an array where the items are in a reversed order.
 *
 *  @return A new NSArray in reverese order compared to the original one
 *  @see Mutable counterpart `-[NSMutableArray(FunkyPrefixedUtilities) funky_reverse]`
 *  @see Unprefixed counterpart `-[NSArray(FunkyUtilities) reversed]`
 */
- (NSArray<ObjectType>*)funky_reversed;

/**
 *  Returns an array where the items are shuffled randomly.
 *
 *  @return A new NSArray consisting of the original objects in a shuffled order
 *  @see Mutable counterpart `-[NSMutableArray(FunkyPrefixedUtilities) funky_shuffle]`
 *  @see Unprefixed counterpart `-[NSArray(FunkyUtilities) shuffled]`
 */
- (NSArray<ObjectType>*)funky_shuffled;

#pragma mark - Sort

/**
 *  Returns an array sorted using the given comparator.
 *
 *  @param comparator An NSComparator block to define the sort order.
 *  @return A new NSArray sorted by the comparator
 *  @see Mutable counterpart `-[NSMutableArray(FunkyPrefixedUtilities) funky_sort]`
 *  @see Unprefixed counterpart `-[NSArray(FunkyUtilities) sorted]`
 */
- (NSArray<ObjectType>*)funky_sorted:(NSComparator)comparator;

#pragma mark - Constructor

/**
 *  Creates an array by repeating the same `item` by `repeat` number of times. The size of the array is going to be qual to `repeat`, only consisting of `item` objects.
 *
 *  @param item The item to repeat
 *  @param repeat Number of times to repeat the `item` parameter
 *  @return A new NSArray instance with the given item repeated
 *  @see Mutable counterpart `+[NSMutableArray(FunkyPrefixedUtilities) funky_arrayWithItem:repeated:]`
 *  @see Unprefixed counterpart `+[NSArray(FunkyUtilities) arrayWithItem:repeated:]`
 */
+ (NSArray<ObjectType>*)funky_arrayWithItem:(id)item repeated:(NSUInteger)repeat;

/**
 *  Creates an array by taking an initial `array` and computing the next items by repeatedly putting the result of `block` by `repeated` number of times.
 *
 *  @param array Initial array
 *  @param block The block to compute the next item in the resulting array
 *  @param repeat Number of times to repeat calling the `block` parameter
 *  @return A new NSArray instance with items returned by the block
 *  @see Mutable counterpart `+[NSMutableArray(FunkyPrefixedUtilities) funky_arrayWithArray:nextItem:repeated:]`
 *  @see Unprefixed counterpart `+[NSArray(FunkyUtilities) arrayWithArray:nextItem:repeated:]`
 */
+ (NSArray<ObjectType>*)funky_arrayWithArray:(NSArray<ObjectType>*)array nextItem:(id(^)(NSArray* array))block repeated:(NSUInteger)repeat;

/**
 *  Creates an array by taking an initial `array` and computing the next items by repeatedly putting the result of `block` by until the block parameter `until` returns YES.
 *
 *  @param array Initial array
 *  @param block The block to compute the next item in the resulting array
 *  @param until Logic until the iteration should be repeated. Until the block returns YES, the constructor repeatedly callis the `block` parameter
 *  @return A new NSArray instance with items returned by the block
 *  @see Mutable counterpart `+[NSMutableArray(FunkyPrefixedUtilities) funky_arrayWithArray:nextItem:until:]`
 *  @see Unprefixed counterpart `+[NSArray(FunkyUtilities) arrayWithArray:nextItem:until:]`
 */
+ (NSArray<ObjectType>*)funky_arrayWithArray:(NSArray<ObjectType>*)array nextItem:(id(^)(NSArray* array))block until:(BOOL(^)(NSArray* array))until;

@end

/**
 *  This extension provides simple and easy to use functional and general utilities for NSMutableArray.
 *  All the methods in this category are prefixed with the `funky_` keyword for compatibility reasons. If you prefer unprefixed utilities, you should import `NSArray+FunkyUtilities.h`.
 *
 *  @see Unprefixed counterpart `NSMutableArray(FunkyUtilities)`
 *  @see Immutable counterpart `NSArray(FunkyPrefixedUtilities)`
 */
@interface NSMutableArray <ObjectType> (FunkyPrefixedUtilities)

#pragma mark - Flatten

/**
 *  Makes the array structure a squence with flat elements, containing no NSArrays
 *
 *  @see Immutable counterpart `-[NSArray(FunkyPrefixedUtilities) funky_flattened]`
 *  @see Unprefixed counterpart `-[NSMutableArray(FunkyUtilities) flatten]`
 */
- (void)funky_flatten;

#pragma mark - Transform

/**
 *  Puts the containing items (in place) in a reversed order.
 *
 *  @see Immutable counterpart `-[NSArray(FunkyPrefixedUtilities) funky_reversed]`
 *  @see Unprefixed counterpart `-[NSMutableArray(FunkyUtilities) reverse]`
 */
- (void)funky_reverse;

/**
 *  Shuffles the containing items (in place) in a random fashion.
 *
 *  @see Immutable counterpart `-[NSArray(FunkyPrefixedUtilities) funky_shuffled]`
 *  @see Unprefixed counterpart `-[NSMutableArray(FunkyUtilities) shuffle]`
 */
- (void)funky_shuffle;

/**
 *  Makes the array unique (in place) by removing the duplicated items from the containing items. The method does this keeping the first occurence and removes the further duplications.
 *  It checks equality using the `-isEqual:` method
 *
 *  @see Immutable counterpart `-[NSArray(FunkyPrefixedUtilities) funky_unique]`
 *  @see Unprefixed counterpart `-[NSMutableArray(FunkyUtilities) removeDuplicates]`
 */
- (void)funky_removeDuplicates;

#pragma mark - Merge

/**
 *  Concatenates the current array (in place) with the one given in the parameter. It does this by putting the existing elements first, and the elements in the provided array afterwards.
 *
 *  @param array The other collection to merge with
 *  @see Immutable counterpart `-[NSArray(FunkyPrefixedUtilities) funky_merged:]`
 *  @see Unprefixed counterpart `-[NSMutableArray(FunkyUtilities) merge:]`
 */
- (void)funky_merge:(NSArray<ObjectType>*)array;

#pragma mark - Sort

/**
 *  Sorts the array (in place) using the given comparator.
 *
 *  @param comparator An NSComparator block to define the sort order.
 *  @see Immutable counterpart `-[NSArray(FunkyPrefixedUtilities) funky_sorted:]`
 *  @see Unprefixed counterpart `-[NSMutableArray(FunkyUtilities) sort:]`
 */
- (void)funky_sort:(NSComparator)comparator;

#pragma mark - Filter

/**
 *  Filters the array using the given predicate, keeping the elements that are passing the test.
 *
 *  @param block The predicate used to filter the results.
 *  @see Immutable counterpart `-[NSArray(FunkyPrefixedUtilities) funky_filtered:]`
 *  @see Unprefixed counterpart `-[NSMutableArray(FunkyUtilities) filter:]`
 */
- (void)funky_filter:(BOOL(^)(ObjectType item))block;

#pragma mark - Constructor

/**
 *  Creates a mutable array by repeating the same `item` by `repeat` number of times. The size of the array is going to be qual to `repeat`, only consisting of `item` objects.
 *
 *  @param item The item to repeat
 *  @param repeat Number of times to repeat the `item` parameter
 *  @return A new NSMutableArray instance with the given item repeated
 *  @see Immutable counterpart `+[NSArray(FunkyPrefixedUtilities) funky_arrayWithItem:repeated:]`
 *  @see Unprefixed counterpart `+[NSMutableArray(FunkyUtilities) arrayWithItem:repeated:]`
 */
+ (NSMutableArray<ObjectType>*)funky_arrayWithItem:(id)item repeated:(NSUInteger)repeat;

/**
 *  Creates a mutable array by taking an initial `array` and computing the next items by repeatedly putting the result of `block` by `repeated` number of times.
 *
 *  @param array Initial array
 *  @param block The block to compute the next item in the resulting array
 *  @param repeat Number of times to repeat calling the `block` parameter
 *  @return A new NSMutableArray instance with items returned by the block
 *  @see Immutable counterpart `+[NSArray(FunkyPrefixedUtilities) funky_arrayWithArray:nextItem:repeated:]`
 *  @see Unprefixed counterpart `+[NSMutableArray(FunkyUtilities) arrayWithArray:nextItem:repeated:]`
 */
+ (NSMutableArray<ObjectType>*)funky_arrayWithArray:(NSArray<ObjectType>*)array nextItem:(id(^)(NSMutableArray* array))block repeated:(NSUInteger)repeat;

/**
 *  Creates a mutable array by taking an initial `array` and computing the next items by repeatedly putting the result of `block` by until the block parameter `until` returns YES.
 *
 *  @param array Initial array
 *  @param block The block to compute the next item in the resulting array
 *  @param until Logic until the iteration should be repeated. Until the block returns YES, the constructor repeatedly callis the `block` parameter
 *  @return A new NSMutableArray instance with items returned by the block
 *  @see Immutable counterpart `+[NSArray(FunkyPrefixedUtilities) funky_arrayWithArray:nextItem:until:]`
 *  @see Unprefixed counterpart `+[NSMutableArray(FunkyUtilities) arrayWithArray:nextItem:until:]`
 */
+ (NSMutableArray<ObjectType>*)funky_arrayWithArray:(NSArray<ObjectType>*)array nextItem:(id(^)(NSMutableArray* array))block until:(BOOL(^)(NSArray* array))until;

@end
