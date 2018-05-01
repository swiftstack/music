public enum MIDI {
    public struct Number: Equatable {
        public var value: Int

        init?(_ value: Int) {
            guard value >= Number.min.value
                && value <= Number.max.value else {
                    return nil
            }
            self.value = value
        }

        public static let min: Number = 0
        public static let max: Number = 127

        public static let standart: Number = 69 // A4
    }
}

extension MIDI.Number: CustomStringConvertible {
    public var description: String {
        return String(describing: value)
    }
}

extension MIDI.Number: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int) {
        self.value = value
    }
}
