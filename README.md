# swift-plugin-tuist

A Swift plugin that integrates [Tuist](https://github.com/tuist/tuist), a toolchain for managing and automating Xcode projects.

## Features

- **Seamless Integration**: Manage Xcode projects using Tuist directly through the Swift Package Manager.
- **Automated Configuration**: Easily set up and manage your project structure with Tuist.
- **Consistent Development Environment**: Ensure uniform project configuration across all team members.
- **Custom Scripts and Modularization**: Utilize Tuist's custom scripts and modularization features to enhance your project workflows.

## Installation

### Using Swift Package Manager plugin

To utilize the `swift-plugin-tuist`, include it in the target specification of your Swift Package:

```swift
// swift-tools-version: 5.6
import PackageDescription

let package = Package(
    name: "YourPackageName",
    dependencies: [
        .package(url: "https://github.com/21-DOT-DEV/swift-plugin-tuist.git", exact: "4.55.9"),
    ],
    targets: [
        .executableTarget(name: "YourTargetName")
    ]
)
```

This configuration provides the minimum setup required to invoke tuist from the command line, enabling its integration into your manifest file.

### Using [Mint](https://github.com/yonaskolb/Mint)

```
$ mint install 21-DOT-DEV/swift-plugin-tuist
```

## Commands

After Tuist is [installed](#installation) in your Swift package, you can start using it.

### Using Swift Package Manager plugin

Invoke the plugin directly using the `swift package <PLUGIN>` command:

```bash
swift package tuist --help
```

Run `tuist generate` to generate an Xcode project from your Tuist configuration:

```bash
swift package --disable-sandbox tuist generate
```

> [!IMPORTANT]  
> The Tuist plugin requires the `--disable-sandbox` flag with the Swift Package Manager due to its need for local document access.

To run other Tuist commands within your package repository:

```bash
swift package --disable-sandbox tuist <command>
```

> [!NOTE]  
> For a detailed understanding of Tuist commands and their usage, refer to [Tuist's official documentation](https://docs.tuist.io/en/cli/auth).

### Using `mint`

After running `mint install 21-DOT-DEV/swift-plugin-tuist` to install the CLI tool, anytime you want to interact with Tuist, simply run:

```
mint run 21-DOT-DEV/swift-plugin-tuist <command>
```

Example:

```
mint run 21-DOT-DEV/swift-plugin-tuist --help
```

## Configuration

Below is a sample configuration for a Tuist project:

```swift
import ProjectDescription

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
            ]
        )
    ]
)
```

> [!TIP]  
> For more advanced project configurations, refer to [Tuist's guides](https://docs.tuist.io/en/guides/start/new-project).

## Community and Support

If you encounter any issues or have questions regarding the `swift-plugin-tuist`, please open an issue on GitHub. Contributions, suggestions, and feedback are always welcome!

## Acknowledgments

Special thanks to the original [Tuist](https://github.com/tuist/tuist) project and its contributors for creating a powerful tool for managing Xcode projects.