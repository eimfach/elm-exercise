module Tests exposing (anotherSolution, tests)

import Expect
import RNATranscription
import RNATranscription2
import Test exposing (..)


tests : Test
tests =
    describe "RNATranscription"
        [ test "complement of cytosine is guanine" <|
            \() -> Expect.equal (Ok "G") (RNATranscription.toRNA "C")
        , test "complement of guanine is cytosine" <|
            \() -> Expect.equal (Ok "C") (RNATranscription.toRNA "G")
        , test "complement of thymine is adenine" <|
            \() -> Expect.equal (Ok "A") (RNATranscription.toRNA "T")
        , test "complement of adenine is uracil" <|
            \() -> Expect.equal (Ok "U") (RNATranscription.toRNA "A")
        , test "complement" <|
            \() -> Expect.equal (Ok "UGCACCAGAAUU") (RNATranscription.toRNA "ACGTGGTCTTAA")
        , test "invalid nucleotide" <| \() -> Expect.equal (Err '2') (RNATranscription.toRNA "ACGTGGTCTTAA2")
        ]


anotherSolution : Test
anotherSolution =
    describe "RNATranscription2"
        [ test "complement of cytosine is guanine" <|
            \() -> Expect.equal (Ok "G") (RNATranscription2.toRNA "C")
        , test "complement of guanine is cytosine" <|
            \() -> Expect.equal (Ok "C") (RNATranscription2.toRNA "G")
        , test "complement of thymine is adenine" <|
            \() -> Expect.equal (Ok "A") (RNATranscription2.toRNA "T")
        , test "complement of adenine is uracil" <|
            \() -> Expect.equal (Ok "U") (RNATranscription2.toRNA "A")
        , test "complement" <|
            \() -> Expect.equal (Ok "UGCACCAGAAUU") (RNATranscription2.toRNA "ACGTGGTCTTAA")
        , test "invalid nucleotide" <| \() -> Expect.equal (Err '2') (RNATranscription2.toRNA "ACGTGGTCTTAA2")
        ]
