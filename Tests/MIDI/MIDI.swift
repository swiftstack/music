import Testing
@testable import MIDI

@Test("midi number")
func midiNumber() async throws {
    #expect(MIDI.Number(Int(0)) != nil)
    #expect(MIDI.Number(Int(127)) != nil)
    #expect(MIDI.Number(Int(-1)) == nil)
    #expect(MIDI.Number(Int(128)) == nil)
}
