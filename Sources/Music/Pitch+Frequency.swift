import Platform

extension Pitch {
    public struct Frequency: Equatable {
        public var value: Double

        public init?(_ value: Double) {
            guard value >= Frequency.min && value <= Frequency.max else {
                return nil
            }
            self.value = value
        }

        public static var standart: Double = 440.0

        public static let min: Double = 8.175798915643707
        public static let max: Double = 12543.853951415975
    }
}

extension Pitch {
    public var frequency: Frequency {
        let semitones = Double(Octave.semitonesCount)
        let steps = number.value - MIDI.Number.standart.value
        let power = Double(steps) / Double(semitones)
        return Frequency(pow(2, power) * Frequency.standart)!
    }

    public init(from frequency: Frequency) {
        let semitones = Double(Octave.semitonesCount)
        let standart = Frequency.standart
        let steps = Int(round(semitones * log2(frequency.value / standart)))
        precondition(steps >= -69 && steps <= 58)
        self.init(halfStepsFromStandard: steps)!
        if (self.frequency != frequency) {
            self.offset = self.frequency.interval(to: frequency)
        }
    }
}

extension Pitch.Frequency {
    public func interval(to frequency: Pitch.Frequency) -> Pitch.Cents {
        return Pitch.Frequency.interval(self, frequency)
    }

    public static func interval(
        _ frequency1: Pitch.Frequency,
        _ frequency2: Pitch.Frequency) -> Pitch.Cents
    {
        return Pitch.Cents(1200.0 * log2(frequency2.value / frequency1.value))
    }
}

extension Pitch.Frequency: Comparable {
    public static func < (lhs: Pitch.Frequency, rhs: Pitch.Frequency) -> Bool {
        return lhs.value < rhs.value
    }
}

extension Pitch.Frequency: ExpressibleByFloatLiteral {
    public init(floatLiteral value: Double) {
        guard let frequency = Pitch.Frequency(value) else {
            fatalError("invalid frequency")
        }
        self = frequency
    }
}
