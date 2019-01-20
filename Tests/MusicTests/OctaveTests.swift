import Test
@testable import Music

final class OctaveTests: TestCase {
    func testOctave() {
        assertEqual(Octave(-1), .minusOne)
        assertEqual(Octave(0), .zero)
        assertEqual(Octave(1), .one)
        assertEqual(Octave(2), .two)
        assertEqual(Octave(3), .three)
        assertEqual(Octave(4), .four)
        assertEqual(Octave(5), .five)
        assertEqual(Octave(6), .six)
        assertEqual(Octave(7), .seven)
        assertEqual(Octave(8), .eight)
        assertEqual(Octave(9), .nine)
        assertNil(Octave(-2))
        assertNil(Octave(10))
    }
}
