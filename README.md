## Native iOS App for GoCoronoa
Repository for Native iOS app which is developed in Swift.

## Getting started
Ensure you've the following installed.
- Xcode 11.0 +
- Cocoapods

### Installing Cocoapods
[Cocoapods](https://guides.cocoapods.org/using/getting-started.html) are dependency package manager for iOS Xcode project.
- Open terminal and type `$ sudo gem install cocoapods`

### Configuring cocoapods in project
- Open terminal at [level](https://github.com/GoCorona-org/Native_iOS_App) and type `$ pod install`

### Configuring an Apple Developer Account
- Please create an [Apple Developer Account](https://developer.apple.com/) for installing the app on your iPhone.
- With the free tier membership, you can install 3 different development apps on your iPhone which can't be distributed.

### Configuring Google Cloud Platform for Google Maps SDK
- Follow the steps mentioned at [Maps Platform](https://developers.google.com/maps/documentation/ios-sdk/intro) for configuring the SDK.
- Get the [Google API Key](https://developers.google.com/maps/documentation/ios-sdk/get-api-key) and once the key is configured for Maps Platform, use the api key in AppDelegate.swift file.
