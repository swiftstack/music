import Test
@testable import MIDI

test.case("pitch from frequency") {
    expect(Pitch(from: 880.0).debugDescription == "A5+0.0")
    expect(Pitch(from: 174.61411571650194).debugDescription == "F3+0.0")
}

test.case("pitch to frequency") {
    let a5 = Pitch(name: .a, octave: .five, offset: 0.0)
    expect(a5?.frequency == 880.0)
    let f3 = Pitch(name: .f, octave: .three, offset: 0.0)
    expect(f3?.frequency == 174.61411571650194)
}

test.case("pitch offset") {
    #if os(Linux)
    expect(Pitch(from: 444.0).offset == 15.667383390535543)
    #else
    expect(Pitch(from: 444.0).offset == 15.66738339053554)
    #endif
    expect(Pitch(from: 444.0).debugDescription == "A4+15.66")

    expect(Pitch(from: 439.0).offset == -3.939100787161778)
    expect(Pitch(from: 439.0).debugDescription == "A4-3.93")
}

test.run()
