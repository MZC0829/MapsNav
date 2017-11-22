# MapsNav
##### Multiple map navigation.  Include Apple map 、Google map and Amap.

---


## Cocoapods

### 1. Add the following line to your Podfile:

```
platform :ios, '8.0'

target 'YourIosApps' do

  use_frameworks!

  pod 'MapsNav', '~> 1.1.0'

end
```

### 2. Then, run the following command:

```
$ pod install
```



## Carthage

### 1、run the following command:
```
$ touch Cartfile
```

### 2、Add the following line to your Cartfile:

```
github "MZC0829/MapsNav"
```

### 3、run the following command:

```
$ carthage update
```



## Requirements
>
- iOS 8.0+
- swift 3+ and swift 4




## Usage

### - just like


```
let toLocation = CLLocationCoordinate2D(latitude: 22.553355, longitude: 113.946791)

mapsNav(toPoint: toLocation, toPointName: "good place")
```
