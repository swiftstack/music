// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "Music",
    products: [
        .library(
            name: "Music",
            targets: ["Music"]),
        .library(
            name: "MIDI",
            targets: ["MIDI"]),
    ],
    dependencies: [
        .package(name: "Test")
    ],
    targets: [
        .target(
            name: "Music",
            dependencies: []),
        .target(
            name: "MIDI",
            dependencies: ["Music"]),
    ]
)

// MARK: - tests

testTarget("MIDI") { test in
    test("Frequency")
    test("MIDI")
    test("Pitch")
    test("PitchNote")
}

testTarget("Music") { test in
    test("Note")
    test("Octave")
}

func testTarget(_ target: String, task: ((String) -> Void) -> Void) {
    task { test in addTest(target: target, name: test) }
}

func addTest(target: String, name: String) {
    package.targets.append(
        .executableTarget(
            name: "Tests/\(target)/\(name)",
            dependencies: ["Test", "MIDI", "Music"],
            path: "Tests/\(target)/\(name)"))
}

// MARK: - custom package source

#if canImport(ObjectiveC)
import Darwin.C
#else
import Glibc
#endif

extension Package.Dependency {
    enum Source: String {
        case local, swiftcore, github

        static var `default`: Self { .github }

        var baseUrl: String {
            switch self {
            case .local: return "../"
            case .swiftcore: return "https://swiftstack.io/"
            case .github: return "https://github.com/swiftstack/"
            }
        }

        func url(for name: String) -> String {
            return self == .local
                ? baseUrl + name.lowercased()
                : baseUrl + name.lowercased() + ".git"
        }
    }

    static func package(name: String) -> Package.Dependency {
        guard let pointer = getenv("SWIFTSTACK") else {
            return .package(name: name, source: .default)
        }
        guard let source = Source(rawValue: String(cString: pointer)) else {
            fatalError("Invalid source. Use local, swiftcore or github")
        }
        return .package(name: name, source: source)
    }

    static func package(name: String, source: Source) -> Package.Dependency {
        return source == .local
            ? .package(name: name, path: source.url(for: name))
            : .package(name: name, url: source.url(for: name), .branch("dev"))
    }
}
