// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "UIKitMixinable",
	products: [
		.library(name: "UIKitMixinable", targets: ["UIKitMixinable"])
	],
	dependencies: [],
	targets: [
	.target(name: "UIKitMixinable", dependencies: [], path: "Sources/Shared"),
		.testTarget(name: "UIKitMixinableTests", dependencies: ["UIKitMixinable"], path: "UIKitMixinableTests/Shared")
	]
)
