import Testing
@testable import Music

@Test("note name")
func noteName() async throws {
    let name = Note.Name(letter: .a, accidental: .natural)
    #expect(name.letter == .a)
    #expect(name.accidental == .natural)
}

@Test("note pitch")
func notePitch() async throws {
    let pitch = Note.Pitch(name: .a, octave: .four)
    #expect(pitch.name.letter == .a)
    #expect(pitch.name.accidental == .natural)
    #expect(pitch.octave == .four)
}

@Test("note pitch description")
func notePitchDescription() async throws {
    let a4 = Note.Pitch(name: .a, octave: .four)
    #expect(a4.description == "A4")

    let gSharp4 = Note.Pitch(name: .gSharp, octave: .three)
    #expect(gSharp4.description == "G#3")
}

@Test("note")
func note() async throws {
    let note = Note(name: .a, octave: .four)
    #expect(note.pitch.name.letter == .a)
    #expect(note.pitch.octave == .four)
}

@Test("note description")
func noteDescription() async throws {
    let a4 = Note(letter: .a, octave: .four)
    #expect(a4.description == "A4")

    let gSharp4 = Note(letter: .g, accidental: .sharp, octave: .three)
    #expect(gSharp4.description == "G#3")
}
