# SubPods

Funky consists of 2 main parts: **utility interface** and **collections**.

The interface layer gives you the functional helpers and extensions on `NSArray`, `NSDictionary` and `NSSet`. 

The collection part gives you specialised custom collections, composable from the built-in ones, like nil-tolerant arrays or nil-soring sets.

## Structure

The structure of the pod mirrors this separation. 
There are currently 4 subpods, each with its different use-case, reflecting the two main user-facing parts:

- **`Collections`**: For holding the custom collection implementations.
- **`Interface`**: For providing the utility extensions on the existing collection classes.
- **`PrefixedInterface`**: A version of Interface designed for compatibility, giving method prefixes for the extension methods.
- **`Core`**: (Private) A common layer for both interfaces, which holds the actual implementation of the methods in the interface. Both utilities are just a "presentation layer" above the functionalities provided by `Core`. This subpod also holds model objects, protocols and type definitions, that interfaces can use.

By default - when you use *Funky* as a cocoapod - all 4 subpods get represented and integrated into your project, however you can choose to accept only sub-parts, that you'll need.
For example if the default Interface subpod causes dupliaction issues (for example with their map or filter methods, which are commonly used in other libraries as well), you can only import the prefixed counterpart:

```ruby
pod "FunkyObjC/PrefixedInterface"
```

This will include the desired `PrefixedInterface` and all its dependencies, like the `Core` subpod, but won't include the normal Interface or the `Collections` parts.
For that you can use:

```ruby
pod "FunkyObjC/PrefixedInterface"
pod "FunkyObjC/Collections"
```

Subspecs are a commonly used practice to separate and decouple parts of the whole framework. 
Feel free to use any of `Interface`, `PrefixedInterface` or `Collections` if you just need *Funky* because one of its specific capability.