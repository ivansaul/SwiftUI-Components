import ProjectDescription

let project = Project(
    name: "SpotifyStickyHeader",
    targets: [
        .target(
            name: "SpotifyStickyHeader",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.SpotifyStickyHeader",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            sources: ["SpotifyStickyHeader/Sources/**"],
            resources: ["SpotifyStickyHeader/Resources/**"],
            dependencies: []
        ),
        .target(
            name: "SpotifyStickyHeaderTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.SpotifyStickyHeaderTests",
            infoPlist: .default,
            sources: ["SpotifyStickyHeader/Tests/**"],
            resources: [],
            dependencies: [.target(name: "SpotifyStickyHeader")]
        ),
    ]
)
