public struct Note {
    public let pitch: Pitch
    public let duration: Duration

    public struct Pitch {
        public var name: Name
        public var octave: Octave

        public init(
            name: Name,
            octave: Octave = .default)
        {
            self.name = name
            self.octave = octave
        }
    }

    public struct Name {
        public var letter: Letter
        public var accidental: Accidental

        public init(letter: Letter, accidental: Accidental = .default) {
            self.letter = letter
            self.accidental = accidental
        }
    }

    public enum Letter: String {
        case c = "C"
        case d = "D"
        case e = "E"
        case f = "F"
        case g = "G"
        case a = "A"
        case b = "B"
    }

    public enum Accidental {
        case sharp
        case flat
        case natural

        public static let `default`: Accidental = .natural
    }

    public struct Duration {
        public let size: Size
        public let dots: Dots

        public static let `default` = Duration(size: .whole, dots: .none)

        public enum Size {
            case large
            case long
            case doubleWhole
            case whole
            case half
            case quarter
            case eighth
            case sixteenth
            case thirtySecond
            case sixtyFourth
            case hundredTwentyEighth
            case twoHundredFiftySixth
        }

        public enum Dots: String {
            case none, one, two, three
        }
    }

    public init(pitch: Pitch, duration: Duration = .default) {
        self.pitch = pitch
        self.duration = duration
    }
}

extension Note {
    public init(
        name: Name,
        octave: Octave = .default,
        duration: Duration = .default)
    {
        self.init(
            pitch: Pitch(
                name: name,
                octave: octave),
            duration: duration)
    }

    public init(
        letter: Letter,
        accidental: Accidental = .default,
        octave: Octave = .default,
        duration: Duration = .default)
    {
        self.init(
            pitch: Pitch(
                name: Name(letter: letter, accidental: accidental),
                octave: octave),
            duration: duration)
    }
}

extension Note.Name {
    public static let c = Note.Name(letter: .c, accidental: .natural)
    public static let cSharp = Note.Name(letter: .c, accidental: .sharp)
    public static let dFlat = Note.Name(letter: .d, accidental: .flat)
    public static let d = Note.Name(letter: .d, accidental: .natural)
    public static let dSharp = Note.Name(letter: .d, accidental: .sharp)
    public static let eFlat = Note.Name(letter: .e, accidental: .flat)
    public static let e = Note.Name(letter: .e, accidental: .natural)
    public static let f = Note.Name(letter: .f, accidental: .natural)
    public static let fSharp = Note.Name(letter: .f, accidental: .sharp)
    public static let gFlat = Note.Name(letter: .g, accidental: .flat)
    public static let g = Note.Name(letter: .g, accidental: .natural)
    public static let gSharp = Note.Name(letter: .g, accidental: .sharp)
    public static let aFlat = Note.Name(letter: .a, accidental: .flat)
    public static let a = Note.Name(letter: .a, accidental: .natural)
    public static let aSharp = Note.Name(letter: .a, accidental: .sharp)
    public static let bFlat = Note.Name(letter: .b, accidental: .flat)
    public static let b = Note.Name(letter: .b, accidental: .natural)
}

extension Note.Letter {
    public var next: Note.Letter {
        switch self {
        case .c: return .d
        case .d: return .e
        case .e: return .f
        case .f: return .g
        case .g: return .a
        case .a: return .b
        case .b: return .c
        }
    }

    public var prev: Note.Letter {
        switch self {
        case .c: return .b
        case .d: return .c
        case .e: return .d
        case .f: return .e
        case .g: return .f
        case .a: return .g
        case .b: return .a
        }
    }
}

extension Note: CustomStringConvertible {
    public var description: String {
        return "\(pitch)"
    }
}

extension Note.Pitch: CustomStringConvertible {
    public var description: String {
        return "\(name)\(octave)"
    }
}

extension Note.Name: CustomStringConvertible {
    public var description: String {
        return "\(letter)\(accidental)"
    }
}

extension Note.Letter: CustomStringConvertible {
    public var description: String {
        return rawValue
    }
}

extension Note.Accidental: CustomStringConvertible {
    public var description: String {
        switch self {
        case .sharp: return "#"
        case .flat: return "♭"
        case .natural: return ""
        }
    }
}

extension Note.Duration.Size: CustomStringConvertible {
    public var description: String {
        switch self {
        case .large: return "large"
        case .long: return "long"
        case .doubleWhole: return "double whole"
        case .whole: return "whole"
        case .half: return "half"
        case .quarter: return "quater"
        case .eighth: return "eighth"
        case .sixteenth: return "sixteenth"
        case .thirtySecond: return "thirty-second"
        case .sixtyFourth: return "sixty-fourth"
        case .hundredTwentyEighth: return "hundred twenty-eighth"
        case .twoHundredFiftySixth: return "two hundred fifty-sixth"
        }
    }
}
