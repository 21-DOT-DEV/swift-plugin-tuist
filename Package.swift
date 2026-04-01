// swift-tools-version:5.6

import PackageDescription

let package = Package(
    name: "Tuist",
    products: [
        .executable(name: "tuist", targets: ["TuistExecutable"]),
        .plugin(name: "TuistPlugin", targets: ["TuistPlugin"])
    ],
    dependencies: [
        .package(url: "https://github.com/21-DOT-DEV/swift-artifact-parser", exact: "0.0.1")
    ],
    targets: [
        .executableTarget(
            name: "TuistExecutable",
            dependencies: [
                .product(name: "ArtifactParser", package: "swift-artifact-parser")
            ]
        ),
        .plugin(
            name: "TuistPlugin",
            capability: .command(
                intent: .custom(
                    verb: "tuist",
                    description: "Generate, build, and test your Xcode projects."
                )
            ),
            dependencies: ["tuist"]
        ),
        .binaryTarget(
            name: "tuist",
            url: "https://github.com/21-DOT-DEV/swift-plugin-tuist/releases/download/4.174.0/tuist.artifactbundle.zip",
            checksum: "4dc86e3fa264058d187ed136e0d9ce256853f46d45842b6f032d592b36701e6b"
        ),
    ],
    swiftLanguageVersions: [.v5]
)
