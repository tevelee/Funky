# Nil-tolerant collections

## Subclasses

Array

- [nil-tolerant NSArray](https://tevelee.github.io/Funky/Classes.html#/c:objc(cs)FunkyNilTolerantNSArray)
- [nil-tolerant NSMutableArray](https://tevelee.github.io/Funky/Classes.html#/c:objc(cs)FunkyNilTolerantNSMutableArray)

Set

- [nil-tolerant NSSet](https://tevelee.github.io/Funky/Classes.html#/c:objc(cs)FunkyNilTolerantNSSet)
- [nil-tolerant NSMutableSet](https://tevelee.github.io/Funky/Classes.html#/c:objc(cs)FunkyNilTolerantNSMutableSet)

Dictionary

- [nil-tolerant NSDictionary](https://tevelee.github.io/Funky/Classes.html#/c:objc(cs)FunkyNilTolerantNSDictionary)
- [nil-tolerant NSMutableDictionary](https://tevelee.github.io/Funky/Classes.html#/c:objc(cs)FunkyNilTolerantNSMutableDictionary)

## Usage

Use the full library

```ruby
pod "FunkyObjC"
```

or the `Collections` subpod only

```ruby
pod "FunkyObjC/Collections"
```

For the **[NSArray extension](https://tevelee.github.io/Funky/Classes.html#/c:objc(cs)FunkyNilTolerantNSArray)**

```obj-c
#import <Funky/NSArray+NilTolerant.h>
```

```obj-c
NSArray* array = @[@1, @2, @3].nilTolerant
```

For the **[NSSet extension](https://tevelee.github.io/Funky/Classes.html#/c:objc(cs)FunkyNilTolerantNSSet)**

```obj-c
#import <Funky/NSSet+NilTolerant.h>
```

```obj-c
NSSet* set = [NSSet setWithObject:@1].nilTolerant
```

For the **[NSDictionary extension](https://tevelee.github.io/Funky/Classes.html#/c:objc(cs)FunkyNilTolerantNSDictionary)**

```obj-c
#import <Funky/NSSet+NilTolerant.h>
```

```obj-c
NSDictionary* dictionary = @{@1: @"1"}.nilTolerant
```

## Why?

Funky comes with some special collections which make you handle nil values easily. It might happen that during a map operation you return nil in the block. Handling it in an easy way by adding an if statement can lead to much bigger issues later on, because you expect the same number of elements before and after the mapping, and maybe you just accidentally returned that nil value. 
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

Funky provides nil-tolerant and nil-storing collections as well. It serves with NSArray, NSDictionary, NSSet subclasses and all their mutable counterparts are also included. 

```obj-c
NSMutableArray* array = [NSMutableArray arrayWithObject:@1].nilTolerant;
[array addObject:nil];
[array addObject:@2];
NSLog(@"Item: %@", array[1]);
```
	
This latter example under the hood transforms nil values to `[NSNull null]` objects, and transforms them back to nil values when accessing using `objectAtIndex:`. Works of course for addition, insertion, replacement and retrieval. Every use-case is covered properly, tests are providing coverage in all relevant areas.
You can even copy or mutableCopy them, encode with coder or even transform back to original collection instances.

See the [nil-storing collections](https://tevelee.github.io/Funky/nil-storing-collections.html) page for more information on the nil-storing counterpart.