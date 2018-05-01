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
    case sharp
    case flat

    public static let `default`: SemitoneRepresentation = .sharp
}

extension Note.Pitch {
    init(
        from pitch: Pitch,
        semitoneRepresentation: SemitoneRepresentation = .default)
    {
        let octave = pitch.number.value / 12 - 1
        var number = pitch.number.value % 12
        var accidental: Note.Accidental = .natural

        switch number {
        // flats
        case 1,3,6,8,10:
            switch semitoneRepresentation {
            case .sharp:
                number -= 1
                accidental = .sharp
            case .flat:
                number += 1
                accidental = .flat
            }
        default: break
        }

        self.init(
            name: Note.Name(
                letter: Note.Letter(number: number)!,
                accidental: accidental),
            octave: Octave(octave)!)
    }
}

extension Note.Letter {
    public var number: Int {
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

    public init?(number: Int) {
        guard number >= 0 && number < 12 else {
            return nil
        }

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
