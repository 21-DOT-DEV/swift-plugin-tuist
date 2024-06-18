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
            url: "https://github.com/21-DOT-DEV/swift-plugin-tuist/releases/download/4.18.0/tuist.artifactbundle.zip",
            checksum: "bbd811cff0985ceafcb799d4295e591fc99e69d3f712d6d711859744a768bd8e"
        ),
    ],
    swiftLanguageVersions: [.v5]
)
