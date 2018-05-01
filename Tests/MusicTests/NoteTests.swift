import Test
@testable import Music

final class NoteTests: TestCase {
    func testName() {
        let name = Note.Name(letter: .a, accidental: .natural)
        assertEqual(name.letter, .a)
        assertEqual(name.accidental, .natural)
    }

    func testPitch() {
        let pitch = Note.Pitch(name: .a, octave: .four)
        assertEqual(pitch.name.letter, .a)
        assertEqual(pitch.name.accidental, .natural)
        assertEqual(pitch.octave, .four)
    }

    func testPitchDescription() {
        let a4 = Note.Pitch(name: .a, octave: .four)
        assertEqual(a4.description, "A4")

        let gSharp4 = Note.Pitch(name: .gSharp, octave: .three)
        assertEqual(gSharp4.description, "G#3")
    }

    func testNote() {
        let note = Note(name: .a, octave: .four)
        assertEqual(note.pitch.name.letter, .a)
        assertEqual(note.pitch.octave, .four)
    }

    func testNoteDescription() {
        let a4 = Note(letter: .a, octave: .four)
        assertEqual(a4.description, "A4")

        let gSharp4 = Note(letter: .g, accidental: .sharp, octave: .three)
        assertEqual(gSharp4.description, "G#3")
    }
}
