# Funky

[![CI Status](https://travis-ci.org/tevelee/Funky.svg?branch=master&style=flat)](https://travis-ci.org/tevelee/Funky)
[![Code coverage](https://codecov.io/github/tevelee/Funky/coverage.svg?branch=master)](https://codecov.io/github/tevelee/Funky?branch=master)
[![Documentation](https://tevelee.github.io/Funky/badge.svg)](https://tevelee.github.io/Funky)
[![Version](https://img.shields.io/cocoapods/v/FunkyObjC.svg?style=flat)](http://cocoapods.org/pods/FunkyObjC)
[![License](https://img.shields.io/cocoapods/l/FunkyObjC.svg?style=flat)](http://cocoapods.org/pods/FunkyObjC)
[![Platform](https://img.shields.io/cocoapods/p/FunkyObjC.svg?style=flat)](http://cocoapods.org/pods/FunkyObjC)
![Language](https://img.shields.io/badge/language-Objective--C-blue.svg)

Funky is a functional utility library written in Objective-C.

It provides a set of extension methods on NSArray, NSDictionary and NSSet  for you to help dealing with common operations (usually in a functional way).

## Documentation

Full documentation is available at [tevelee.github.io/Funky](https://tevelee.github.io/Funky)

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

**[Click here for the full list of utils](https://tevelee.github.io/Funky/Categories/NSArray(FunkyUtilities).html), or visit [tevelee.github.io/Funky](https://tevelee.github.io/Funky) for a detailed documentation**

The framework includes some cool nil-tolerant collection behaviours as well:

```obj-c
NSArray* array = @[@0, @1, @2].nilTolerant;
NSLog(@"Items: %@", [array arrayByAddingObject:nil]);
```

**Again, see the [docs for more details](https://tevelee.github.io/Funky)**

## Help & Bug Reporting

In case you need help or want to report a bug - please file an [issue](https://github.com/tevelee/Funky/issues/new). Make sure to provide as much information as you can, sample code also makes it a lot easier for me to help you.

## Contribution

Anyone is more than welcome to contribute to Funky! It even can be an addition to the docs or to the code directly, by raising an issue or in form of a pull request. Both are equally valuable to me!

## Future plans

### Roadmap

- Figuring out ways for lazy collections, so the order of map/filter/take won't matter and always compute only the most necessary computations. So if you operate a map function on a huge array, but at the end you filter only for a few, the mapping should only take effect on the very few you needed.

### General guidelines

- Active maintenance
- Keep the >95% test and documentation coverage
- Accepting suggestions and pull requests from the community

## Author

I am Laszlo Teveli, software engineer, iOS evangelist.

Feel free to reach out to me anytime via tevelee [at] gmail [dot] com.

## License

Funky is available under the MIT license. See the LICENSE file for more information.
