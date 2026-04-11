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
            url: "https://github.com/21-DOT-DEV/swift-plugin-tuist/releases/download/4.179.3/tuist.artifactbundle.zip",
            checksum: "75027f3be7383f47e486e053926adec329e71235542837f2dd141b0a8a51f705"
        ),
    ],
    swiftLanguageVersions: [.v5]
)
