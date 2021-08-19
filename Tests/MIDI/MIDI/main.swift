import Test
@testable import MIDI

test.case("midi number") {
    expect(MIDI.Number(Int(0)) != nil)
    expect(MIDI.Number(Int(127)) != nil)
    expect(MIDI.Number(Int(-1)) == nil)
    expect(MIDI.Number(Int(128)) == nil)
}

test.run()
