import Platform

public struct Pitch {
    public var number: MIDI.Number
    public var offset: Cents

    public init(number: MIDI.Number, offset: Cents = .default) {
        self.number = number
        self.offset = offset
    }

    public struct Cents: Equatable {
        public var value: Double

        public init(_ value: Double) {
            self.value = value
        }

        public static let `default`: Cents = 0.0
        public static let semitone: Cents = 100.0
    }
}

extension Pitch {
    public init?(halfStepsFromStandard halfSteps: Int) {
        let standart = MIDI.Number.standart.value
        guard let number = MIDI.Number(standart + halfSteps) else {
            return nil
        }
        self.init(number: number)
    }

    public func advanced(by halfSteps: Int) -> Pitch? {
        guard let number = MIDI.Number(number.value + halfSteps) else {
            return nil
        }
        return Pitch(number: number)
    }
}

extension Pitch.Cents: ExpressibleByFloatLiteral {
    public init(floatLiteral value: Double) {
        self.value = value
    }
}

extension Pitch: CustomStringConvertible {
    public var description: String {
        let plus = offset.value >= 0.0 ? "+" : ""
        let integer = Int(offset.value)
        let fract = Int(abs(offset.value) * 100) % 100
        return "\(Note.Pitch(from: self))\(plus)\(integer).\(fract)"
    }
}

extension Pitch.Cents: CustomStringConvertible {
    public var description: String {
        return String(describing: value)
    }
}
