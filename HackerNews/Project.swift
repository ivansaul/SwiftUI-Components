import ProjectDescription

let project = Project(
    name: "HackerNews",
    targets: [
        .target(
            name: "HackerNews",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.HackerNews",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            sources: ["HackerNews/Sources/**"],
            resources: ["HackerNews/Resources/**"],
            dependencies: []
        ),
        .target(
            name: "HackerNewsTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.HackerNewsTests",
            infoPlist: .default,
            sources: ["HackerNews/Tests/**"],
            resources: [],
            dependencies: [.target(name: "HackerNews")]
        ),
    ]
)
