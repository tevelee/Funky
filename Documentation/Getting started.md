# Getting started

Currently the supported way to use the framework is wither cocoapods or manually copying the files.

The framework uses the _Funky_ prefix for all its classes and extensions, so they probably won't cause any naming conflicts either way.

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

## Usage

The framework contains a set of extension methods on NSArray, NSSet and NSDictionary.

Using them is as simle as

```obj-c
NSArray<NSNumber*>* numbers = @[@1, @2, @3];
NSArray<NSString*>* strings = [numbers map:^id(NSNumber* item) {
    return item.stringValue;
}];
```

or

```obj-c
bigNumbers = [numbers filter:^BOOL(NSNumber* item) {
    return item.intValue > 1000;
}];
```
See the full list of helpers are available here: 

- [NSArray+FunkyUtilities](https://tevelee.github.io/Funky/Categories/NSArray(FunkyUtilities).html)
- [NSDictionary+FunkyUtilities](https://tevelee.github.io/Funky/Categories/NSDictionary(FunkyUtilities).html)
- [NSSet+FunkyUtilities](https://tevelee.github.io/Funky/Categories/NSSet(FunkyUtilities).html)

If the extensions cause a naming conflict with other utility libraries you may include, you can use the `PrefixedInterface` subpod and its corresponding utilities:

- [NSArray+FunkyPrefixedUtilities](https://tevelee.github.io/Funky/Categories/NSArray(FunkyPrefixedUtilities).html)
- [NSDictionary+FunkyPrefixedUtilities](https://tevelee.github.io/Funky/Categories/NSDictionary(FunkyPrefixedUtilities).html)
- [NSSet+FunkyPrefixedUtilities](https://tevelee.github.io/Funky/Categories/NSSet(FunkyPrefixedUtilities).html)

A quick note on the different subpods is available [here](https://tevelee.github.io/Funky/subpods.html).

Other useful information about nil-handling collections (included in *Funky*) are available [here](https://tevelee.github.io/Funky/nil-storing-collections.html) and [here](https://tevelee.github.io/Funky/nil-tolerant-collections.html).