# Tuist Swift Plugin

## Overview

Welcome to the Tuist Swift Plugin! This plugin is designed to seamlessly integrate and distribute [Tuist](https://github.com/tuist/tuist) within your Swift projects using the Swift Package Manager. With this plugin, you can easily manage and automate Xcode projects, making your development process smoother and more efficient.

## Features

- **Seamless Integration**: Integrates Tuist with Swift Package Manager for streamlined project setup.
- **Automated Configuration**: Automatically configure Xcode projects using Tuist.
- **Enhanced Project Management**: Leverage Tuist's powerful features directly from your Swift projects.
- **Consistent Environment**: Ensure consistent project environments across different machines and team members.

## Installation

To install the Tuist Swift Plugin, follow these steps:

1. **Add the Plugin to Your Package.swift**:
   Add the Tuist plugin to your `Package.swift` file under the `dependencies` and `targets` sections:

   ```swift
   // swift-tools-version:5.5
   import PackageDescription

   let package = Package(
       name: "MyProject",
       products: [
           .executable(name: "MyProject", targets: ["MyProject"]),
       ],
       dependencies: [
           .package(url: "https://github.com/tuist/tuist.git", from: "1.0.0"),
       ],
       targets: [
           .target(
               name: "MyProject",
               dependencies: [
                   .product(name: "TuistPlugin", package: "tuist"),
               ]
           ),
           .executableTarget(name: "MyProject", dependencies: ["TuistPlugin"]),
       ]
   )
   ```

2. **Run Swift Package Manager Command**:
   ```sh
   swift package resolve
   ```

3. **Verify Installation**:
   Confirm the plugin is installed correctly by running:
   ```sh
   swift package show-dependencies
   ```

## Usage

### Project Configuration

To configure your project with Tuist, create a `tuist.swift` file in your project directory and add your Tuist configuration:

```swift
import TuistPlugin

let project = Project(
    name: "MyProject",
    targets: [
        Target(
            name: "MyApp",
            platform: .iOS,
            product: .app,
            bundleId: "com.example.myapp",
            infoPlist: "Info.plist",
            sources: "Sources/**",
            dependencies: [
                .target(name: "MyFramework"),
                .package(product: "TuistPlugin")
            ]
        )
    ]
)
```

### Automate Project Setup

Automate your Xcode project setup using Tuist's powerful commands:

```sh
swift run tuist generate
```

### Custom Scripts Integration

Integrate custom scripts within your Tuist configuration to automate various tasks:

```swift
let script = TargetScript(
    name: "CustomScript",
    script: """
    echo "Running custom script..."
    ./custom_script.sh
    """,
    shell: "/bin/bash"
)
```

## Examples

### Generating Xcode Project

To generate your Xcode project with Tuist:

```sh
swift run tuist generate
```

### Cleaning Project

Clean your project to remove generated files:

```sh
swift run tuist clean
```

### Updating Tuist

Ensure you have the latest version of Tuist:

```sh
swift run tuist update
```

## Contributing

We welcome contributions to enhance the Tuist Swift Plugin! Please check our [contributing guidelines](CONTRIBUTING.md) and [code of conduct](CODE_OF_CONDUCT.md) for more information.

## License

This plugin is released under the MIT License. See [LICENSE](LICENSE) for details.

## Acknowledgements

Special thanks to the [Tuist](https://github.com/tuist/tuist) community for their support and contributions.

---

This README is structured to provide clear and comprehensive information about the Tuist Swift Plugin, highlighting its features, installation process, usage, examples, and contributing guidelines.