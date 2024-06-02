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
            url: "https://github.com/21-DOT-DEV/swift-plugin-tuist/releases/download/4.16.1/tuist.artifactbundle.zip",
            checksum: "283ddb22c09f38ef8fd461cc15c9c115e8f63aa86cbd8e7e1e168bdcd637b64e"
        ),
    ],
    swiftLanguageVersions: [.v5]
)
