import Test
@testable import MIDI

final class PitchTests: TestCase {
    func testPitch() {
        let pitch = Pitch(number: 69)
        assertEqual(pitch.number, 69)
    }

    func testDescription() {
        let a4 = Pitch(number: 69)
        assertEqual(a4.description, "A4+0")
        assertEqual(a4.debugDescription, "A4+0.0")

        let gSharp4 = Pitch(number: 68, offset: 1.34)
        assertEqual(gSharp4.description, "G#4+1")
        assertEqual(gSharp4.debugDescription, "G#4+1.34")
    }

    func testFromNotePitch() {
        let pitch = Pitch(
            letter: .a,
            accidental: .flat,
            octave: .four,
            offset: 0.0)

        assertEqual(pitch?.number, 68)
    }
}
