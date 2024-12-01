import Testing
@testable import MIDI

@Test("pitch")
func pitch() async throws {
    let pitch = Pitch(number: 69)
    #expect(pitch.number == 69)
}

@Test("pitch description")
func pitchDescription() async throws {
    let a4 = Pitch(number: 69)
    #expect(a4.description == "A4+0")
    #expect(a4.debugDescription == "A4+0.0")

    let gSharp4 = Pitch(number: 68, offset: 1.34)
    #expect(gSharp4.description == "G#4+1")
    #expect(gSharp4.debugDescription == "G#4+1.34")
}

@Test("pitch from note")
func pitchFromNote() async throws {
    let pitch = Pitch(
        letter: .a,
        accidental: .flat,
        octave: .four,
        offset: 0.0)

    #expect(pitch?.number == 68)
}
