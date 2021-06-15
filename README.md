# CypherPoetCoreDataKit

<div align="center">
   <img width="600px" src="./Extras/Images/Banner-1.png" alt="CypherPoetCoreDataKit Header Image">
</div>

<p>
    <img src="https://img.shields.io/badge/Swift-5.4-F06C33.svg" />
    <img src="https://img.shields.io/badge/iOS-13.0+-865EFC.svg" />
    <img src="https://img.shields.io/badge/iPadOS-13.0+-F65EFC.svg" />
    <img src="https://img.shields.io/badge/macOS-10.15+-179AC8.svg" />
    <img src="https://img.shields.io/badge/tvOS-13.0+-41465B.svg" />
    <img src="https://img.shields.io/badge/watchOS-6.0+-1FD67A.svg" />
    <img src="https://img.shields.io/badge/License-MIT-blue.svg" />
    <img src="https://github.com/CypherPoet/CypherPoetCoreDataKit/workflows/Build%20&%20Test/badge.svg" />
    <a href="https://github.com/apple/swift-package-manager">
      <img src="https://img.shields.io/badge/spm-compatible-brightgreen.svg?style=flat" />
    </a>
    <a href="https://twitter.com/cypher_poet">
        <img src="https://img.shields.io/badge/Contact-@cypher_poet-lightgrey.svg?style=flat" alt="Twitter: @cypher_poet" />
    </a>
</p>


<p align="center">

_A collection of utilities for building Core Data applications in SwiftUI._

<p />


## 🚧 Disclaimer

This library is still very much a WIP as I study some of the new best practices, patterns, and affordances for Core Data after the release of SwiftUI 2.0. Please treat it as a guideline/reference for the time being 🙂.


## Features

- ✅ A [`CoreDataManager`](./Sources/CoreDataManager/) that handles setting up your ["Core Data Stack"](https://developer.apple.com/documentation/coredata/core_data_stack).
- ✅ A [`rich set of utilities`](./Sources/Migration/) for performing Core Data migrations.
- ✅ A [`FetchedResultsControlling` protocol](./Sources/FetchUtils/FetchedResultsControlling.swift) that helps architect `NSFetchedResultsController` instances and extract data from their `NSFetchRequest` results.
- ✅ Predicate Utilities
- ✅ Strongly-typed errors.
- ✅ `NSPersistentStore` helpers for using `NSSQLiteStoreType` in production apps and `NSInMemoryStoreType` in tests or previews:


## Installation

### Xcode Projects

### Xcode Projects

Select `File` -> `Swift Packages` -> `Add Package Dependency` and enter `https://github.com/CypherPoet/CypherPoetCoreDataKit`.


### Swift Package Manager Projects

You can add `CypherPoetCoreDataKit` as a package dependency in your `Package.swift` file:

```swift
let package = Package(
    //...
    dependencies: [
        .package(
            url: "https://github.com/CypherPoet/CypherPoetCoreDataKit",
            .exact("0.0.18")
        ),
    ],
    //...
)
```

From there, refer to `CypherPoetCoreDataKit` as a "target dependency" in any of _your_ package's targets that need it.

```swift
targets: [
    .target(
        name: "YourLibrary",
        dependencies: [
          "CypherPoetCoreDataKit",
        ],
        ...
    ),
    ...
]
```

Then simply `import CypherPoetCoreDataKit` wherever you’d like to use it.



## Usage

Currently, usage of these utilities is best demonstrated by the various example applications [here](./Examples/). But a few pointers...

### Dynamically initializing a Core Data Stack for your app depending on whether it's running for production or for Xcode Previews.

- [🔗 Example](https://github.com/CypherPoet/CypherPoetCoreDataKit/blob/migration-helpers/Examples/ReviewJournal/Shared/Misc%20Utils/Extensions/CoreDataManager%2BUtils.swift)

### Setting up the Core Data stack on launch

- [🔗 iOS Example](./Examples/ReviewJournal/iOS/App/AppDelegate.swift)
- [🔗 macOS Example](./Examples/ReviewJournal/macOS/App/AppDelegate.swift)


<!-- ### [Advanced Fetching]() (adapted from _Core Data by Tutorials_) -->

### Core Data Migrations

- [🔗 Example application built specifically around this.](./Examples/ReviewJournal)


### Requirements

- Xcode 13.0+ (Recommended)


### 📜 Generating Documentation

Documentation is generated by [Swift Doc](https://github.com/SwiftDocOrg/swift-doc). Installation instructions can be found [here](https://github.com/SwiftDocOrg/swift-doc#installation), and as soon as you have it set up, docs can be generated simply by running `./Scripts/generate-html-docs.zsh` from the command line.

📝 Note that this will only generate a `.build/documentation` folder for you to view locally. This folder is being ignored by `git`, and a GitHub [action](./.github/workflows/PublishDocumentation.yml) exists to automatically generate docs at the root level and serve them on the project's `gh-pages` branch.



## 🏷 License

`CypherPoetCoreDataKit` is available under the MIT license. See the [LICENSE file](./LICENSE) for more info.
