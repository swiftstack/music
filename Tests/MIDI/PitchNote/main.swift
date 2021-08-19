import Test
@testable import MIDI

test.case("note from pitch natural") {
    let pitch = Pitch(number: 69)
    let note = Note.Pitch(from: pitch)

    expect(note.name.letter == .a)
    expect(note.name.accidental == .natural)
    expect(note.octave == .four)
}

test.case("note from pitch sharp") {
    let pitch = Pitch(number: 70)
    let note = Note.Pitch(from: pitch)

    expect(note.name.letter == .a)
    expect(note.name.accidental == .sharp)
    expect(note.octave == .four)
}

test.case("note from pitch flat") {
    let pitch = Pitch(number: 70)
    let note = Note.Pitch(from: pitch, semitoneRepresentation: .flat)

    expect(note.name.letter == .b)
    expect(note.name.accidental == .flat)
    expect(note.octave == .four)
}

test.run()
