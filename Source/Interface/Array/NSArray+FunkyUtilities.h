//
//  NSArray+Utilities.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 21..
//
//

#import <Foundation/Foundation.h>

/**
 *  This extension provides you with simple and easy to use functional and general utilities for NSArray.
 *  If you need to prefix the extension methods in this category, you should import `NSArray+FunkyPrefixedUtilities.h`, where every utility method is prefixed with the `funky_` keyword for compatiblitiy reasons.
 */
@interface NSArray <__covariant ObjectType> (FunkyUtilities)

#pragma mark - Check

/**
 *  Returns whether the condition matches all elements in the array
 *  @param block The condition given as a BOOL expression
 */
- (BOOL)all:(BOOL(^)(ObjectType item))block;

/**
 *  Returns whether the condition matches no elements in the array
 *  @param block The condition given as a BOOL expression
 */
- (BOOL)none:(BOOL(^)(ObjectType item))block;

/**
 *  Returns whether the condition matches at least one element in the array
 *  @param block The condition given as a BOOL expression
 */
- (BOOL)contains:(BOOL(^)(ObjectType item))block;

#pragma mark - Count

/**
 *  Returns the number of elements the given condition matches in the array, like if you would filter the array.
 *  @param block The condition given as a BOOL expression
 */
- (NSUInteger)count:(BOOL(^)(ObjectType item))block;

#pragma mark - Map

/**
 *  Returns a new NSArray instance with the same amount of elements, where each element is transformed to another by returning a new object in the block parameter.
 *  @param block The transformator code which should return a new value based on the existing one.
 */
- (NSArray*)map:(id(^)(ObjectType item))block;

/**
 *  Same as map, but the block contains the index of the current element.
 *  @param block The transformator code which should return a new value based on the index and the existing item.
 */
- (NSArray*)mapWithIndex:(id(^)(NSUInteger index, ObjectType item))block;

/**
 *  Returns a new NSArray instance with the same amount of elements, where each element is transformed to another by returning a new object in the block parameter. Same as map, but the result is going to be flattened, so if you return an NSArray any iteration, it is going to be converted into a flat structure, not an array of arrays.
 *  @param block The transformator code which should return a new value based on the existing one.
 */
- (NSArray*)flatMap:(id(^)(ObjectType item))block;

/**
 *  Same as flatMap, but the block contains the index of the current element.
 *  @param block The transformator code which should return a new value based on the index and the existing item.
 */
- (NSArray*)flatMapWithIndex:(id(^)(NSUInteger index, ObjectType item))block;

#pragma mark - Filter

/**
 *  Returns a new NSArray instance with the element, that are passing the returned expression in the original array.
 *  @param block The filtering predicate given as a BOOL expression
 */
- (NSArray<ObjectType>*)filter:(BOOL(^)(ObjectType item))block;

#pragma mark - Flatten

/**
 *  Flattens the array, meaning that if it consisted of Array items, they are going to be flattened into one flat structure of elements. An array of arrays will transform to an array of elements from each of the previous arrays. This computation is performed deeply, meaning that it contontued flattening elements, until they produce a flat structure.
 */
- (NSArray<ObjectType>*)flattened;

#pragma mark - Merge

/**
 *  Returns a new NSArray instance, in which concatenates the two arrays by putting the existing elements first, and the elements in the provided array after them.
 *  @param array The other collection to merge with
 */
- (NSArray*)merged:(NSArray*)array;

#pragma mark - For each

/**
 *  Calls every element of the array once.
 *  @param block A block, giving the current item in each iteration.
 */
- (void)forEach:(void(^)(ObjectType item))block;

#pragma mark - Grouping

/**
 *  Calls every element of the array once. Same as forEach, but the block contains the index of the current element as well.
 *  @param block A block, giving the current item and its index in each iteration.
 */
- (void)forEachWithIndex:(void(^)(NSUInteger index, ObjectType item))block;

/**
 *  Groups elements to an NSDictionary, where the returned element serves as a key, and the objects as the value. If multiple elements are returned with the same key, this function will use the first matching element.
 *  @param block A block which returns a key (based on the passed element) used as the key in the dictionary for that element.
 */
- (NSDictionary<id, ObjectType>*)groupByUsingFirst:(id(^)(ObjectType item))block;

/**
 *  Groups elements to an NSDictionary, where the returned element serves as a key, and the objects as the value. If multiple elements are returned with the same key, this function will use the last matching element.
 *  @param block A block which returns a key (based on the passed element) used as the key in the dictionary for that element.
 */
- (NSDictionary<id, ObjectType>*)groupByUsingLast:(id(^)(ObjectType item))block;

/**
 *  Groups elements to an NSDictionary, where the returned element serves as a key, and the objects as the value. The elements in the resulting Dictionary are arrays, so if multiple elements return the same keys, all of them are going to be included in the value.
 *  @param block A block which returns a key (based on the passed element) used as the key in the dictionary.
 */
- (NSDictionary<id, NSArray<ObjectType>*>*)associateBy:(id(^)(ObjectType item))block;

#pragma mark - Compute

/**
 *  Produces an aggregated value based on the elements of the array.
 *  @param initialValue The value to start with. At first this is going to be the rolling value.
 *  @param block The computation logic, which takes the rolling value and the current item and aggregates them using some custom logic.
 */
- (id)reduce:(id(^)(id value, ObjectType item))block withInitialValue:(id)start;

/**
 *  A special use-case of reduce, which summarises the returned double values for each element in the array.
 *  @param block A block which returns double value, based on the current element.
 */
- (double)sum:(double(^)(ObjectType item))block;

/**
 *  A special use-case of reduce, which takes the average value of the returned double values for each element in the array.
 *  @param block A block which returns double value, based on the current element.
 */
- (double)average:(double(^)(ObjectType item))block;

#pragma mark - Min/Max

/**
 *  A special use-case of reduce, which takes the minimum of the returned double values for each element in the array.
 *  @param block A block which returns double value, based on the current element.
 */
- (double)minValue:(double(^)(ObjectType item))block;

/**
 *  A special use-case of reduce, which takes the maximum of the returned double values for each element in the array.
 *  @param block A block which returns double value, based on the current element.
 */
- (double)maxValue:(double(^)(ObjectType item))block;

/**
 *  Returns an array with all the minimal value elements in the array, where the minimum was computed by the returned double value for each element in the array.
 *  @param block A block which returns double value, based on the current element.
 */
- (NSArray<ObjectType>*)minItems:(double(^)(ObjectType item))block;

/**
 *  Returns an array with all the maximal value elements in the array, where the maximum was computed by the returned double value for each element in the array.
 *  @param block A block which returns double value, based on the current element.
 */
- (NSArray<ObjectType>*)maxItems:(double(^)(ObjectType item))block;

#pragma mark - First/Last

/**
 *  Returns the first index of the array: 0
 */
- (NSUInteger)firstIndex;

/**
 *  Returns the last index of the array: count - 1
 */
- (NSUInteger)lastIndex;

/**
 *  Returns the first element, where the predicate matches
 *  @param block The condition provided as a BOOL expression.
 */
- (id)first:(BOOL(^)(ObjectType item))block;

/**
 *  Returns the index of the first element, where the predicate matches
 *  @param block The condition provided as a BOOL expression.
 */
- (NSUInteger)firstIndex:(BOOL(^)(ObjectType item))block;

/**
 *  Returns the last element, where the predicate matches
 *  @param block The condition provided as a BOOL expression.
 */
- (id)last:(BOOL(^)(ObjectType item))block;

/**
 *  Returns the index of the last element, where the predicate matches
 *  @param block The condition provided as a BOOL expression.
 */
- (NSUInteger)lastIndex:(BOOL(^)(ObjectType item))block;

#pragma mark - Take

/**
 *  Returns an array of the values where the predicate matches, but only until it's a consecutive sequence. Once the predicate returns NO, those elements are going to be dropped.
 *  @param block The condition provided as a BOOL expression.
 */
- (NSArray<ObjectType>*)take:(BOOL(^)(ObjectType item))block;

/**
 *  Returns an array of the values where the predicate matches, but only the last consecutive sequence of these element. Same as take, but from the end of the array.
 *  @param block The condition provided as a BOOL expression.
 */
- (NSArray<ObjectType>*)takeLast:(BOOL(^)(ObjectType item))block;

#pragma mark - from-until

/**
 *  Returns an array of the values starting from the given object, not including the object itself. If the given object does not exist in the array, the result is going to be an empty NSArray.
 *  @param value The signaling object.
 */
- (NSArray<ObjectType>*)fromValueExclusive:(id)value;

/**
 *  Returns an array of the values starting from the given object, including the object itself. If the given object does not exist in the array, the result is going to be an empty NSArray.
 *  @param value The signaling value, which is going to be represent in the array as the first element.
 */
- (NSArray<ObjectType>*)fromValueInclusive:(id)value;

/**
 *  Returns an array of the values starting from the given index, not including the object at the given index. If the given index does not exist in the array, the result is going to be an empty NSArray.
 *  @param index The starting index.
 */
- (NSArray<ObjectType>*)fromIndexExclusive:(NSInteger)index;

/**
 *  Returns an array of the values starting from the given index, including the object at the fiven index. If the given index does not exist in the array, the result is going to be an empty NSArray.
 *  @param value The signaling index, where the element at the index is going to be represent in the array as the first element.
 */
- (NSArray<ObjectType>*)fromIndexInclusive:(NSInteger)index;

/**
 *  Returns an array of the values until the given object, not including the object itself. If the given object does not exist in the array, the result is going to be an empty NSArray.
 *  @param value The signaling object.
 */
- (NSArray<ObjectType>*)untilValueExclusive:(id)value;

/**
 *  Returns an array of the values until the given object, including the object itself. If the given object does not exist in the array, the result is going to be an empty NSArray.
 *  @param value The signaling value, which is going to be represent in the array as the last element.
 */
- (NSArray<ObjectType>*)untilValueInclusive:(id)value;

/**
 *  Returns an array of the values until the given index, not including the object at the given index. If the given index does not exist in the array, the result is going to be an empty NSArray.
 *  @param index The starting index.
 */
- (NSArray<ObjectType>*)untilIndexExclusive:(NSInteger)index;

/**
 *  Returns an array of the values until the given index, including the object at the fiven index. If the given index does not exist in the array, the result is going to be an empty NSArray.
 *  @param value The signaling index, where the element at the index is going to be represent in the array as the last element.
 */
- (NSArray<ObjectType>*)untilIndexInclusive:(NSInteger)index;

/**
 *  Returns an array of the values between the given two input objects, excluding both from the result set. 
 *  If the starting object does not exist in the array, it's equivalent to the matching untilValue expression.
 *  If the ending object does not exist in the array, it's equivalent to the matching fromValue expression.
 *  If neither one exists, the result is an empty NSArray.
 *  @param from The starting object.
 *  @param until The ending object.
 */
- (NSArray<ObjectType>*)fromValueExclusive:(id)from untilValueExclusive:(id)until;

/**
 *  Returns an array of the values between the given two input objects, excluding `from`, including `until` from the result set. 
 *  If the starting object does not exist in the array, it's equivalent to the matching untilValue expression.
 *  If the ending object does not exist in the array, it's equivalent to the matching fromValue expression.
 *  If neither one exists, the result is an empty NSArray.
 *  @param from The starting object.
 *  @param until The ending object.
 */
- (NSArray<ObjectType>*)fromValueExclusive:(id)from untilValueInclusive:(id)until;

/**
 *  Returns an array of the values between the given two input objects, including `from`, excluding `until` from the result set. 
 *  If the starting object does not exist in the array, it's equivalent to the matching untilValue expression.
 *  If the ending object does not exist in the array, it's equivalent to the matching fromValue expression.
 *  If neither one exists, the result is an empty NSArray.
 *  @param from The starting object.
 *  @param until The ending object.
 */
- (NSArray<ObjectType>*)fromValueInclusive:(id)from untilValueExclusive:(id)until;

/**
 *  Returns an array of the values between the given two input objects, including both from the result set. 
 *  If the starting object does not exist in the array, it's equivalent to the matching untilValue expression.
 *  If the ending object does not exist in the array, it's equivalent to the matching fromValue expression.
 *  If neither one exists, the result is an empty NSArray.
 *  @param from The starting object.
 *  @param until The ending object.
 */
- (NSArray<ObjectType>*)fromValueInclusive:(id)from untilValueInclusive:(id)until;

/**
 *  Returns an array of the values between the given two indices, excluding both objects (at the given indices) from the result set. 
 *  If the starting index does not exist in the array, it's equivalent to the matching untilIndex expression.
 *  If the ending index does not exist in the array, it's equivalent to the matching fromIndex expression.
 *  If neither one exists, the result is an empty NSArray.
 *  @param from The starting index.
 *  @param until The ending index.
 */
- (NSArray<ObjectType>*)fromIndexExclusive:(NSInteger)from untilIndexExclusive:(NSInteger)until;

/**
 *  Returns an array of the values between the given two indices, excluding the object at the index `from`, including the one at the index `until` from the result set. 
 *  If the starting index does not exist in the array, it's equivalent to the matching untilIndex expression.
 *  If the ending index does not exist in the array, it's equivalent to the matching fromIndex expression.
 *  If neither one exists, the result is an empty NSArray.
 *  @param from The starting index.
 *  @param until The ending index.
 */
- (NSArray<ObjectType>*)fromIndexExclusive:(NSInteger)from untilIndexInclusive:(NSInteger)until;

/**
 *  Returns an array of the values between the given two indices, including the object at the index `from`, excluding the one at the index `until` from the result set. 
 *  If the starting index does not exist in the array, it's equivalent to the matching untilIndex expression.
 *  If the ending index does not exist in the array, it's equivalent to the matching fromIndex expression.
 *  If neither one exists, the result is an empty NSArray.
 *  @param from The starting index.
 *  @param until The ending index.
 */
- (NSArray<ObjectType>*)fromIndexInclusive:(NSInteger)from untilIndexExclusive:(NSInteger)until;

/**
 *  Returns an array of the values between the given two indices, including both objects (at the given indices) from the result set. 
 *  If the starting index does not exist in the array, it's equivalent to the matching untilIndex expression.
 *  If the ending index does not exist in the array, it's equivalent to the matching fromIndex expression.
 *  If neither one exists, the result is an empty NSArray.
 *  @param from The starting index.
 *  @param until The ending index.
 */
- (NSArray<ObjectType>*)fromIndexInclusive:(NSInteger)from untilIndexInclusive:(NSInteger)until;

#pragma mark - Transform

/**
 *  Returns an array where is object is unique, so the resulting array does not contain any duplicates.
 *  It checks equality using the `-isEqual:` method
 */
- (NSArray<ObjectType>*)unique;

/**
 *  Returns an array where the items are in a reversed order.
 */
- (NSArray<ObjectType>*)reversed;

/**
 *  Returns an array where the items are shuffled randomly.
 */
- (NSArray<ObjectType>*)shuffled;

#pragma mark - Sort

/**
 *  Returns an array sorted using the given comparator.
 *  @param comparator An NSComparator block to define the sort order.
 */
- (NSArray<ObjectType>*)sorted:(NSComparator)comparator;

#pragma mark - Constructor

/**
 *  Creates an array by repeating the same `item` by `repeat` number of times. The size of the array is going to be qual to `repeat`, only consisting of `item` objects.
 *  @param item The item to repeat
 *  @param repeat Number of times to repeat the `item` parameter
 */
+ (NSArray<ObjectType>*)arrayWithItem:(id)item repeated:(NSUInteger)repeat;

/**
 *  Creates an array by taking an initial `array` and computing the next items by repeatedly putting the result of `block` by `repeated` number of times.
 *  @param array Initial array
 *  @param block The block to compute the next item in the resulting array
 *  @param repeat Number of times to repeat calling the `block` parameter
 */
+ (NSArray<ObjectType>*)arrayWithArray:(NSArray<ObjectType>*)array nextItem:(id(^)(NSArray* array))block repeated:(NSUInteger)repeat;

/**
 *  Creates an array by taking an initial `array` and computing the next items by repeatedly putting the result of `block` by until the block parameter `until` returns YES.
 *  @param array Initial array
 *  @param block The block to compute the next item in the resulting array
 *  @param until Logic until the iteration should be repeated. Until the block returns YES, the constructor repeatedly callis the `block` parameter
 */
+ (NSArray<ObjectType>*)arrayWithArray:(NSArray<ObjectType>*)array nextItem:(id(^)(NSArray* array))block until:(BOOL(^)(NSArray* array))until;

@end

/**
 *  This extension provides you with simple and easy to use functional and general utilities for NSMutableArray.
 *  If you need to prefix the extension methods in this category, you should import `NSArray+FunkyPrefixedUtilities.h`, where every utility method is prefixed with the `funky_` keyword for compatiblitiy reasons.
 */
@interface NSMutableArray <ObjectType> (FunkyUtilities)

#pragma mark - Transform

/**
 *  Puts the containing items in a reversed order.
 */
- (NSMutableArray<ObjectType>*)reverse;

/**
 *  Shuffles the containing items in a random fashion.
 */
- (NSMutableArray<ObjectType>*)shuffle;

/**
 *  Makes the array unique by removing the duplicated items from the containing items. The method does this keeping the first occurence and removes the further duplications.
 *  It checks equality using the `-isEqual:` method
 */
- (NSMutableArray<ObjectType>*)removeDuplicates;

#pragma mark - Merge

/**
 *  Concatenates the current array with the one given in the parameter. It does this by putting the existing elements first, and the elements in the provided array afterwards.
 *  @param array The other collection to merge with
 */
- (NSMutableArray<ObjectType>*)merge:(NSArray<ObjectType>*)array;

#pragma mark - Constructor

/**
 *  Creates aa mutable array by repeating the same `item` by `repeat` number of times. The size of the array is going to be qual to `repeat`, only consisting of `item` objects.
 *  @param item The item to repeat
 *  @param repeat Number of times to repeat the `item` parameter
 */
+ (NSMutableArray<ObjectType>*)arrayWithItem:(id)item repeated:(NSUInteger)repeat;

/**
 *  Creates a mutable array by taking an initial `array` and computing the next items by repeatedly putting the result of `block` by `repeated` number of times.
 *  @param array Initial array
 *  @param block The block to compute the next item in the resulting array
 *  @param repeat Number of times to repeat calling the `block` parameter
 */
+ (NSMutableArray<ObjectType>*)arrayWithArray:(NSArray<ObjectType>*)array nextItem:(id(^)(NSMutableArray* array))block repeated:(NSUInteger)repeat;

/**
 *  Creates a mutable array by taking an initial `array` and computing the next items by repeatedly putting the result of `block` by until the block parameter `until` returns YES.
 *  @param array Initial array
 *  @param block The block to compute the next item in the resulting array
 *  @param until Logic until the iteration should be repeated. Until the block returns YES, the constructor repeatedly callis the `block` parameter
 */
+ (NSMutableArray<ObjectType>*)arrayWithArray:(NSArray<ObjectType>*)array nextItem:(id(^)(NSMutableArray* array))block until:(BOOL(^)(NSArray* array))until;

@end
