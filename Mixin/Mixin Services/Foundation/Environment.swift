import Foundation

public let appGroupIdentifier = "group.one.mixin.messenger"
public let callTimeoutInterval: TimeInterval = 60

public var isAppExtension: Bool {
    Bundle.main.bundleURL.pathExtension == "appex"
}

public var currentDecimalSeparator: String {
    Locale.current.decimalSeparator ?? "."
}

public var globalSignalContext: OpaquePointer {
    return Signal.context
}
