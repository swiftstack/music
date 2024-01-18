import Test
@testable import Music

test("note name") {
    let name = Note.Name(letter: .a, accidental: .natural)
    expect(name.letter == .a)
    expect(name.accidental == .natural)
}

test("note pitch") {
    let pitch = Note.Pitch(name: .a, octave: .four)
    expect(pitch.name.letter == .a)
    expect(pitch.name.accidental == .natural)
    expect(pitch.octave == .four)
}

test("note pitch description") {
    let a4 = Note.Pitch(name: .a, octave: .four)
    expect(a4.description == "A4")

    let gSharp4 = Note.Pitch(name: .gSharp, octave: .three)
    expect(gSharp4.description == "G#3")
}

test("note") {
    let note = Note(name: .a, octave: .four)
    expect(note.pitch.name.letter == .a)
    expect(note.pitch.octave == .four)
}

test("note description") {
    let a4 = Note(letter: .a, octave: .four)
    expect(a4.description == "A4")

    let gSharp4 = Note(letter: .g, accidental: .sharp, octave: .three)
    expect(gSharp4.description == "G#3")
}

await run()
