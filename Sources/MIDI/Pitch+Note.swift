import Music

extension Pitch {
    public var note: Note.Pitch {
        return Note.Pitch(from: self)
    }

    public init?(
        letter: Note.Letter,
        accidental: Note.Accidental = .default,
        octave: Octave = .default,
        offset: Cents = .default)
    {
        let base = Octave.semitonesCount * (octave.rawValue + 1)
        var rawNumber = base + letter.number
        switch accidental {
        case .natural: break
        case .sharp: rawNumber += 1
        case .flat: rawNumber -= 1
        }
        guard let number = MIDI.Number(rawNumber) else {
            return nil
        }
        self.number = number
        self.offset = offset
    }

    public init?(
        name: Note.Name,
        octave: Octave = .default,
        offset: Cents = .default)
    {
        self.init(
            letter: name.letter,
            accidental: name.accidental,
            octave: octave,
            offset: offset)
    }

    public init?(
        pitch: Note.Pitch,
        offset: Cents = .default)
    {
        self.init(
            name: pitch.name,
            octave: pitch.octave,
            offset: offset)
    }
}

public enum SemitoneRepresentation {
    case sharp, flat
    public static let `default`: SemitoneRepresentation = .sharp
}

extension Note.Pitch {
    public init(
        from pitch: Pitch,
        semitoneRepresentation: SemitoneRepresentation = .default)
    {
        let letter = Note.Letter(
            for: pitch.number,
            semitoneRepresentation: semitoneRepresentation)

        let accidental =  Note.Accidental(
            for: pitch.number,
            semitoneRepresentation: semitoneRepresentation)

        self.init(
            name: .init(letter: letter, accidental: accidental),
            octave: .init(pitch.number))
    }
}

extension Note.Letter {
    public init(
        for number: MIDI.Number,
        semitoneRepresentation: SemitoneRepresentation = .default)
    {
        let index = number.value % Octave.semitonesCount
        switch number.isFlat {
        case true:
            switch semitoneRepresentation {
            case .sharp: self = Note.Letter(index - 1)
            case .flat: self = Note.Letter(index + 1)
            }
        case false:
            self = Note.Letter(index)
        }
    }
}

extension Note.Accidental {
    public init(
        for number: MIDI.Number,
        semitoneRepresentation: SemitoneRepresentation = .default)
    {
        switch number.isFlat {
        case true:
            switch semitoneRepresentation {
            case .sharp: self = .sharp
            case .flat: self = .flat
            }
        case false:
            self = .natural
        }
    }
}

extension Octave {
    public init(_ number: MIDI.Number) {
        self = Octave(number.value / Octave.semitonesCount - 1)!
    }
}

extension MIDI.Number {
    var isFlat: Bool {
        switch value % Octave.semitonesCount {
        case 1,3,6,8,10: return true
        default: return false
        }
    }
}

extension Note.Letter {
    fileprivate var number: Int {
        switch self {
        case .c: return 0
        case .d: return 2
        case .e: return 4
        case .f: return 5
        case .g: return 7
        case .a: return 9
        case .b: return 11
        }
    }

    fileprivate init(_ number: Int) {
        assert(number >= 0 && number < 12)
        switch number {
        case 0: self = .c
        case 2: self = .d
        case 4: self = .e
        case 5: self = .f
        case 7: self = .g
        case 9: self = .a
        case 11: self = .b
        default: fatalError("unreachable")
        }
    }
}
