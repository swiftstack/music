import Testing
@testable import MIDI

@Test("note from pitch natural")
func noteFromPitchNatural() async throws {
    let pitch = Pitch(number: 69)
    let note = Note.Pitch(from: pitch)

    #expect(note.name.letter == .a)
    #expect(note.name.accidental == .natural)
    #expect(note.octave == .four)
}

@Test("note from pitch sharp")
func noteFromPitchSharp() async throws {
    let pitch = Pitch(number: 70)
    let note = Note.Pitch(from: pitch)

    #expect(note.name.letter == .a)
    #expect(note.name.accidental == .sharp)
    #expect(note.octave == .four)
}

@Test("note from pitch flat")
func noteFromPitchFlat() async throws {
    let pitch = Pitch(number: 70)
    let note = Note.Pitch(from: pitch, semitoneRepresentation: .flat)

    #expect(note.name.letter == .b)
    #expect(note.name.accidental == .flat)
    #expect(note.octave == .four)
}
