import ProjectDescription

let project = Project(
    name: "YouTubeHeader",
    targets: [
        .target(
            name: "YouTubeHeader",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.YouTubeHeader",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            sources: ["YouTubeHeader/Sources/**"],
            resources: ["YouTubeHeader/Resources/**"],
            dependencies: []
        ),
        .target(
            name: "YouTubeHeaderTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.YouTubeHeaderTests",
            infoPlist: .default,
            sources: ["YouTubeHeader/Tests/**"],
            resources: [],
            dependencies: [.target(name: "YouTubeHeader")]
        ),
    ]
)
