import Test
@testable import MIDI

final class MIDITests: TestCase {
    func testNumber() {
        assertNotNil(MIDI.Number(Int(0)))
        assertNotNil(MIDI.Number(Int(127)))
        assertNil(MIDI.Number(Int(-1)))
        assertNil(MIDI.Number(Int(128)))
    }
}
