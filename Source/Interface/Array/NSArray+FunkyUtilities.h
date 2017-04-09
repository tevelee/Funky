//
//  NSArray+Utilities.h
//  Pods
//
//  Created by László Teveli on 2017. 03. 21..
//
//

#import <Foundation/Foundation.h>

@interface NSArray <__covariant ObjectType> (FunkyUtilities)

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

/**
 *  Returns the number of elements the given condition matches in the array, like if you would filter the array.
 *  @param block The condition given as a BOOL expression
 */
- (NSUInteger)count:(BOOL(^)(ObjectType item))block;

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

/**
 *  Returns a new NSArray instance with the element, that are passing the returned expression in the original array.
 *  @param block The filtering predicate given as a BOOL expression
 */
- (NSArray<ObjectType>*)filter:(BOOL(^)(ObjectType item))block;

/**
 *  Produces an aggregated value based on the elements of the array.
 *  @param initialValue The value to start with. At first this is going to be the rolling value.
 *  @param block The computation logic, which takes the rolling value and the current item and aggregates them using some custom logic.
 */
- (id)reduce:(id(^)(id value, ObjectType item))block withInitialValue:(id)start;

/**
 *  Flattens the array, meaning that if it consisted of Array items, they are going to be flattened into one flat structure of elements. An array of arrays will transform to an array of elements from each of the previous arrays. This computation is performed deeply, meaning that it contontued flattening elements, until they produce a flat structure.
 */
- (NSArray<ObjectType>*)flattened;

/**
 *  Returns a new NSArray instances, in which concatenates the two arrays by putting the existing elements first, and the provided array elements after.
 *  @param array The other collection to merge with
 */
- (NSArray*)merged:(NSArray*)array;

/**
 *  Calls every element of the array once.
 *  @param block A block, giving the current item in each iteration.
 */
- (void)forEach:(void(^)(ObjectType item))block;

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

- (NSArray<ObjectType>*)untilValueExclusive:(id)value;
- (NSArray<ObjectType>*)untilValueInclusive:(id)value;
- (NSArray<ObjectType>*)untilIndexExclusive:(NSInteger)index;
- (NSArray<ObjectType>*)untilIndexInclusive:(NSInteger)index;

- (NSArray<ObjectType>*)fromValueExclusive:(id)from untilValueExclusive:(id)until;
- (NSArray<ObjectType>*)fromValueExclusive:(id)from untilValueInclusive:(id)until;
- (NSArray<ObjectType>*)fromValueInclusive:(id)from untilValueExclusive:(id)until;
- (NSArray<ObjectType>*)fromValueInclusive:(id)from untilValueInclusive:(id)until;

- (NSArray<ObjectType>*)fromIndexExclusive:(NSInteger)from untilIndexExclusive:(NSInteger)until;
- (NSArray<ObjectType>*)fromIndexExclusive:(NSInteger)from untilIndexInclusive:(NSInteger)until;
- (NSArray<ObjectType>*)fromIndexInclusive:(NSInteger)from untilIndexExclusive:(NSInteger)until;
- (NSArray<ObjectType>*)fromIndexInclusive:(NSInteger)from untilIndexInclusive:(NSInteger)until;

- (NSArray<ObjectType>*)unique;
- (NSArray<ObjectType>*)reversed;
- (NSArray<ObjectType>*)shuffled;

- (NSArray<ObjectType>*)sorted:(NSComparator)comparator;

+ (NSArray<ObjectType>*)arrayWithItem:(id)item repeated:(NSUInteger)repeat;
+ (NSArray<ObjectType>*)arrayWithArray:(NSArray<ObjectType>*)array nextItem:(id(^)(NSArray* array))block repeated:(NSUInteger)repeat;
+ (NSArray<ObjectType>*)arrayWithArray:(NSArray<ObjectType>*)array nextItem:(id(^)(NSArray* array))block until:(BOOL(^)(NSArray* array))until;

@end

@interface NSMutableArray <ObjectType> (FunkyUtilities)

- (NSMutableArray<ObjectType>*)reverse;
- (NSMutableArray<ObjectType>*)shuffle;
- (NSMutableArray<ObjectType>*)removeDuplicates;

- (NSMutableArray<ObjectType>*)merge:(NSArray<ObjectType>*)array;

+ (NSMutableArray<ObjectType>*)arrayWithItem:(id)item repeated:(NSUInteger)repeat;
+ (NSMutableArray<ObjectType>*)arrayWithArray:(NSArray<ObjectType>*)array nextItem:(id(^)(NSMutableArray* array))block repeated:(NSUInteger)repeat;
+ (NSMutableArray<ObjectType>*)arrayWithArray:(NSArray<ObjectType>*)array nextItem:(id(^)(NSMutableArray* array))block until:(BOOL(^)(NSArray* array))until;

@end
