// swift-tools-version:5.6

import PackageDescription

let package = Package(
    name: "Tuist",
    products: [
        .plugin(
            name: "tuist",
            targets: [
                "TuistPlugin"
            ]
        )
    ],
    dependencies: [],
    targets: [
        .plugin(
            name: "TuistPlugin",
            capability: .command(
                intent: .custom(
                    verb: "tuist",
                    description: "Execute commands defined by template."
                )
            ),
            dependencies: ["tuist"]
        ),
        .binaryTarget(
            name: "tuist",
            url: "https://github.com/21-DOT-DEV/swift-plugin-tuist/releases/download/4.17.0/tuist.artifactbundle.zip",
            checksum: "fe3d9a35d640c5a6919c025c0c7cf04910a9295d71b66aa952d71f0d235f6c27"
        ),
    ],
    swiftLanguageVersions: [.v5]
)
