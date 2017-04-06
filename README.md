# Funky

[![CI Status](https://travis-ci.org/tevelee/Funky.svg?branch=master&style=flat)](https://travis-ci.org/tevelee/Funky)
[![Version](https://img.shields.io/cocoapods/v/FunkyObjC.svg?style=flat)](http://cocoapods.org/pods/Funky)
[![License](https://img.shields.io/cocoapods/l/FunkyObjC.svg?style=flat)](http://cocoapods.org/pods/Funky)
[![Platform](https://img.shields.io/cocoapods/p/FunkyObjC.svg?style=flat)](http://cocoapods.org/pods/Funky)

Funky is a collection utility with functional extensions, written in Objective-C.

## Installation with CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Swift and Objective-C Cocoa projects. You can install it with the following command:

```bash
$ sudo gem install cocoapods
```

To install Funky, simply add the following line to your `Podfile`:

```ruby
pod "FunkyObjC"
```

then import using any of these 

```obj-c
#import <Funky/NSArray+FunkyUtilities.h>
#import <Funky/NSDictionary+FunkyUtilities.h>
#import <Funky/NSSet+FunkyUtilities.h>
```

## USAGE

Funky provides a set of extension methods on NSArray, NSDictionary and NSSet  for you to help dealing with common operations (usually in a functional way).

### NSArray

```obj-c
- (BOOL)all:(BOOL(^)(ObjectType item))block;
- (BOOL)none:(BOOL(^)(ObjectType item))block;
- (BOOL)contains:(BOOL(^)(ObjectType item))block;
- (NSUInteger)count:(BOOL(^)(ObjectType item))block;
	
- (NSArray*)map:(id(^)(ObjectType item))block;
- (NSArray*)mapWithIndex:(id(^)(NSUInteger index, ObjectType item))block;
- (NSArray*)flatMap:(id(^)(ObjectType item))block;
- (NSArray*)flatMapWithIndex:(id(^)(NSUInteger index, ObjectType item))block;
- (NSArray*)filter:(BOOL(^)(ObjectType item))block;
- (NSArray*)reduce:(id(^)(id value, ObjectType item))block withInitialValue:(id)start;
- (NSArray*)flattened;
- (NSArray*)merged:(NSArray*)array;
	
- (void)forEach:(void(^)(ObjectType item))block;
- (void)forEachWithIndex:(void(^)(NSUInteger index, ObjectType item))block;
	
- (NSDictionary*)groupByUsingFirst:(id(^)(ObjectType item))block;
- (NSDictionary*)groupByUsingLast:(id(^)(ObjectType item))block;
- (NSDictionary<id, NSArray*>*)associateBy:(id(^)(ObjectType item))block;
	
- (double)sum:(double(^)(ObjectType item))block;
- (double)average:(double(^)(ObjectType item))block;
- (double)minValue:(double(^)(ObjectType item))block;
- (double)maxValue:(double(^)(ObjectType item))block;
	
- (NSArray*)minItems:(double(^)(ObjectType item))block;
- (NSArray*)maxItems:(double(^)(ObjectType item))block;
	
- (NSUInteger)firstIndex;
- (NSUInteger)lastIndex;
	
- (id)first:(BOOL(^)(ObjectType item))block;
- (NSUInteger)firstIndex:(BOOL(^)(ObjectType item))block;
- (id)last:(BOOL(^)(ObjectType item))block;
- (NSUInteger)lastIndex:(BOOL(^)(ObjectType item))block;
	
- (NSArray*)take:(BOOL(^)(ObjectType item))block;
- (NSArray*)takeLast:(BOOL(^)(ObjectType item))block;
	
- (NSArray*)fromValueExclusive:(id)value;
- (NSArray*)fromValueInclusive:(id)value;
- (NSArray*)fromIndexExclusive:(NSInteger)index;
- (NSArray*)fromIndexInclusive:(NSInteger)index;
	
- (NSArray*)untilValueExclusive:(id)value;
- (NSArray*)untilValueInclusive:(id)value;
- (NSArray*)untilIndexExclusive:(NSInteger)index;
- (NSArray*)untilIndexInclusive:(NSInteger)index;
	
- (NSArray*)fromValueExclusive:(id)from untilValueExclusive:(id)until;
- (NSArray*)fromValueExclusive:(id)from untilValueInclusive:(id)until;
- (NSArray*)fromValueInclusive:(id)from untilValueExclusive:(id)until;
- (NSArray*)fromValueInclusive:(id)from untilValueInclusive:(id)until;
	
- (NSArray*)fromIndexExclusive:(NSInteger)from untilIndexExclusive:(NSInteger)until;
- (NSArray*)fromIndexExclusive:(NSInteger)from untilIndexInclusive:(NSInteger)until;
- (NSArray*)fromIndexInclusive:(NSInteger)from untilIndexExclusive:(NSInteger)until;
- (NSArray*)fromIndexInclusive:(NSInteger)from untilIndexInclusive:(NSInteger)until;
	
- (NSArray*)unique;
- (NSArray*)reversed;
- (NSArray*)shuffled;
	
- (NSArray*)sorted:(NSComparator)comparator;
	
+ (NSArray*)arrayWithItem:(id)item repeated:(NSUInteger)repeat;
+ (NSArray*)arrayWithArray:(NSArray*)array nextItem:(id(^)(NSArray* array))block repeated:(NSUInteger)repeat;
+ (NSArray*)arrayWithArray:(NSArray*)array nextItem:(id(^)(NSArray* array))block until:(BOOL(^)(NSArray* array))until;
```

### NSMutableArray

```obj-c
- (NSMutableArray*)removeDuplicates;
- (NSMutableArray*)reverse;
- (NSMutableArray*)shuffle;

- (NSMutableArray*)merge:(NSArray*)array;

+ (NSMutableArray*)arrayWithItem:(id)item repeated:(NSUInteger)repeat;
+ (NSMutableArray*)arrayWithArray:(NSArray*)array nextItem:(id(^)(NSMutableArray* array))block repeated:(NSUInteger)repeat;
+ (NSMutableArray*)arrayWithArray:(NSArray*)array nextItem:(id(^)(NSMutableArray* array))block until:(BOOL(^)(NSArray* array))until;
```

### NSDicitonary

```obj-c
- (NSDictionary*)map:(FunkyPair*(^)(KeyType key, ObjectType value))block;
- (NSDictionary*)merged:(NSDictionary*)dictionary;
- (void)forEach:(void(^)(KeyType key, ObjectType value))block;
	
- (NSDictionary*)invertedObjectsAndKeys;

- (NSDictionary*)filter:(BOOL(^)(KeyType key, ObjectType value))block;
- (BOOL)all:(BOOL(^)(KeyType key, ObjectType value))block;
- (BOOL)none:(BOOL(^)(KeyType key, ObjectType value))block;
- (BOOL)contains:(BOOL(^)(KeyType key, ObjectType value))block;
- (id)reduce:(id(^)(id previousValue, KeyType key, ObjectType value))block withInitialValue:(id)start;
```

### NSMutableDictionary

```obj-c
- (NSMutableDictionary*)merge:(NSDictionary*)dictionary;
```

### NSSet

```obj-c
- (BOOL)all:(BOOL(^)(ObjectType item))block;
- (BOOL)none:(BOOL(^)(ObjectType item))block;
- (BOOL)contains:(BOOL(^)(ObjectType item))block;
- (NSUInteger)count:(BOOL(^)(ObjectType item))block;
	
- (NSSet*)map:(id(^)(ObjectType item))block;
- (NSSet*)flatMap:(id(^)(ObjectType item))block;
- (NSSet*)filter:(BOOL(^)(ObjectType item))block;
- (id)reduce:(id(^)(id value, ObjectType item))block withInitialValue:(id)start;
- (NSSet*)flattened;
- (NSSet*)takingUnion:(NSSet*)set;
- (NSSet*)takingMinus:(NSSet*)set;
- (NSSet*)takingIntersection:(NSSet*)set;
	
- (void)forEach:(void(^)(ObjectType item))block;
	
- (NSDictionary*)groupBy:(id(^)(ObjectType item))block;
- (NSDictionary<id, NSArray*>*)associateBy:(id(^)(ObjectType item))block;
	
- (double)sum:(double(^)(ObjectType item))block;
- (double)average:(double(^)(ObjectType item))block;
- (double)minValue:(double(^)(ObjectType item))block;
- (double)maxValue:(double(^)(ObjectType item))block;
	
- (NSSet*)minItems:(double(^)(ObjectType item))block;
- (NSSet*)maxItems:(double(^)(ObjectType item))block;
```

### NSMutableSet

```obj-c
- (NSMutableSet*)takeUnion:(NSSet*)set;
- (NSMutableSet*)takeMinus:(NSSet*)set;
- (NSMutableSet*)takeIntersection:(NSSet*)set;
```

Funky also comes with some special collections, which makes you handle nil values easily. It might happen that during a map operation you return nil in the block. Handling it in an easy way by adding an if statement can lead to much bigger issues later on, because you expect the same number of elements before and after the mapping, and maybe you just accidentally returned that nil value. 
Not handling it on the other hand crashes the system, because foundation collection cannot hold nil values, they will crash.

To overcome this limitation I made up a set of special collections which CAN handle nil values properly. For example FunkyNilTolerantNSArray is a subclass of the NSArray class-cluster. It properly handles nil values, by ignoring them, excluding all from the collection and doesn't make your app crash.
It's a proper NSArray subclass, based on Apple's guidance on how to create new subclasses in the NSArray class cluster. To validate it's behaviour, I heavily unit tested, that it won't crash and won't leak and work exactly like the built-in Foundation NSArray. 

To create on you can use NSArray's well known initialisers, but using this class, eg. `[FunkyNilTolerantNSArray arrayWithObject:@1];` or simly transform an existing array to a nil tolerant one using `@[@1, @2, @3].nilTolerant`

So consider the following exaple:

```obj-c
NSArray* array = @[@0, @1, @2].nilTolerant;
NSLog(@"Items: %@", [array arrayByAddingObject:nil]);
```
	
It does what you expect, leaves the array as it is and doesn't crash your app.

Funky provides nil-tolerant and also nil-storing collections. It serves with NSArray and NSMutableArray subclasses as well. 

```obj-c
NSMutableArray* array = [NSMutableArray arrayWithObject:@1].nilStoring;
[array addObject:nil];
[array addObject:@2];
NSLog(@"Item: %@", array[1]);
```
	
Under the hood it transforms nil values to `[NSNull null]` objects, and transforms them back to nil values when accessing using `objectAtIndex:`. Works of course for adding, insertion, replacing, retrieval. Every use-case is covered properly.
You can even copy, mutableCopy them, encode with coder or transform back to original array instances.

### Future plans

- Keep the >95% code coverage.
- Doing proper documentation.
- Active maintenance. 
- Accepting suggestions and pull requests from the community.
- Figuring out ways for lazy collections, so the order of map/filter/take won't matter and always compute only the most necessary computations. So in a 2000 size array you call map, but take only the first object later, the filter should only be run once for that one occasion.

See the included [Example](https://github.com/tevelee/Funky/tree/master/Example) app for more.

## Author

Laszlo Teveli, tevelee@gmail.com

## License

Funky is available under the MIT license. See the LICENSE file for more info.
