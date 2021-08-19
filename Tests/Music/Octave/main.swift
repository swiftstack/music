import Test
@testable import Music

test.case("octave") {
    expect(Octave(-1) == .minusOne)
    expect(Octave(0) == .zero)
    expect(Octave(1) == .one)
    expect(Octave(2) == .two)
    expect(Octave(3) == .three)
    expect(Octave(4) == .four)
    expect(Octave(5) == .five)
    expect(Octave(6) == .six)
    expect(Octave(7) == .seven)
    expect(Octave(8) == .eight)
    expect(Octave(9) == .nine)
    expect(Octave(-2) == nil)
    expect(Octave(10) == nil)
}

test.run()
