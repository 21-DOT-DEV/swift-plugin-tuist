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
            url: "https://github.com/21-DOT-DEV/swift-plugin-tuist/releases/download/4.88.1/tuist.artifactbundle.zip",
            checksum: "41c710bde4bf789257b512e0fce251766af0c7f307c58985f96dd112de934bd1"
        ),
    ],
    swiftLanguageVersions: [.v5]
)
