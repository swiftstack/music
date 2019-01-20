@_exported import Music

public enum MIDI {
    public struct Number: Equatable {
        public var value: Int

        public static let min: Number = 0
        public static let max: Number = 127
        /// A4
        public static let standart: Number = 69

        public init?(_ value: Int) {
            // magic numbers to avoid recursion
            guard value >= 0 && value <= 127 else {
                return nil
            }
            self.value = value
        }
    }
}

extension MIDI.Number: CustomStringConvertible {
    public var description: String {
        return String(describing: value)
    }
}

extension MIDI.Number: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int) {
        guard let number = MIDI.Number(value) else {
            fatalError("Invalid MIDI number: \(value)")
        }
        self = number
    }
}
