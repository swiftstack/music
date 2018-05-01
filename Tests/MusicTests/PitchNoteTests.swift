import Test
@testable import Music

final class ConvertionTests: TestCase {
    func testNoteFromPitchNatural() {
        let pitch = Pitch(number: 69)
        let note = Note.Pitch(from: pitch)

        assertEqual(note.name.letter, .a)
        assertEqual(note.name.accidental, .natural)
        assertEqual(note.octave, .four)
    }

    func testNoteFromPitchSharp() {
        let pitch = Pitch(number: 70)
        let note = Note.Pitch(from: pitch)

        assertEqual(note.name.letter, .a)
        assertEqual(note.name.accidental, .sharp)
        assertEqual(note.octave, .four)
    }

    func testNoteFromPitchFlat() {
        let pitch = Pitch(number: 70)
        let note = Note.Pitch(from: pitch, semitoneRepresentation: .flat)

        assertEqual(note.name.letter, .b)
        assertEqual(note.name.accidental, .flat)
        assertEqual(note.octave, .four)
    }
}
