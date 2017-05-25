## Announce

[![Platforms](https://img.shields.io/cocoapods/p/Announce.svg)](https://cocoapods.org/pods/Announce)
[![License](https://img.shields.io/cocoapods/l/Announce.svg)](https://raw.githubusercontent.com/cookiecutter-swift/Announce/master/LICENSE)

[![Swift Package Manager](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![CocoaPods compatible](https://img.shields.io/cocoapods/v/Announce.svg)](https://cocoapods.org/pods/Announce)

[![Travis](https://img.shields.io/travis/cookiecutter-swift/Announce/master.svg)](https://travis-ci.org/cookiecutter-swift/Announce/branches)
[![JetpackSwift](https://img.shields.io/badge/JetpackSwift-framework-red.svg)](http://github.com/JetpackSwift/Framework)

A simple framework to display alert and notification messages in Swift

- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [License](#license)

## Requirements

- iOS 8.0+
- Xcode 8.0+

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

> CocoaPods 1.1.0+ is required to build Announce 1.0+.

To integrate Announce into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

pod 'Announce', '~> 1.0'
```

Then, run the following command:

```bash
$ pod install
```

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that automates the process of adding frameworks to your Cocoa application.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate Announce into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "Announce/Announce" ~> 1.0
```
### Swift Package Manager

To use Announce as a [Swift Package Manager](https://swift.org/package-manager/) package just add the following in your Package.swift file.

``` swift
import PackageDescription

let package = Package(
    name: "HelloAnnounce",
    dependencies: [
        .Package(url: "https://github.com/cookiecutter-swift/Announce.git", "1.0")
    ]
)
```

### Manually

If you prefer not to use either of the aforementioned dependency managers, you can integrate Announce into your project manually.

#### Git Submodules

- Open up Terminal, `cd` into your top-level project directory, and run the following command "if" your project is not initialized as a git repository:

```bash
$ git init
```

- Add Announce as a git [submodule](http://git-scm.com/docs/git-submodule) by running the following command:

```bash
$ git submodule add https://github.com/cookiecutter-swift/Announce.git
$ git submodule update --init --recursive
```

- Open the new `Announce` folder, and drag the `Announce.xcodeproj` into the Project Navigator of your application's Xcode project.

    > It should appear nested underneath your application's blue project icon. Whether it is above or below all the other Xcode groups does not matter.

- Select the `Announce.xcodeproj` in the Project Navigator and verify the deployment target matches that of your application target.
- Next, select your application project in the Project Navigator (blue project icon) to navigate to the target configuration window and select the application target under the "Targets" heading in the sidebar.
- In the tab bar at the top of that window, open the "General" panel.
- Click on the `+` button under the "Embedded Binaries" section.
- You will see two different `Announce.xcodeproj` folders each with two different versions of the `Announce.framework` nested inside a `Products` folder.

    > It does not matter which `Products` folder you choose from.

- Select the `Announce.framework`.

- And that's it!

> The `Announce.framework` is automagically added as a target dependency, linked framework and embedded framework in a copy files build phase which is all you need to build on the simulator and a device.

#### Embeded Binaries

- Download the latest release from https://github.com/cookiecutter-swift/Announce/releases
- Next, select your application project in the Project Navigator (blue project icon) to navigate to the target configuration window and select the application target under the "Targets" heading in the sidebar.
- In the tab bar at the top of that window, open the "General" panel.
- Click on the `+` button under the "Embedded Binaries" section.
- Add the downloaded `Announce.framework`.
- And that's it!

## Acknowledgments

Helio Costa for helping me with the color palette for errors, warnings, information and success

## Usage

## License

Announce is released under the MIT license. See [LICENSE](https://github.com/cookiecutter-swift/Announce/blob/master/LICENSE) for details.
