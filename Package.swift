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
            checksum: "03f1f97b410c98c436331a56d509588f77145cbdaf6646afcb140af2be3a1fe9"
        ),
    ],
    swiftLanguageVersions: [.v5]
)
