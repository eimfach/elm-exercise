module Hamming exposing (distance)


distance : String -> String -> Result String Int
distance left right =
    if String.length left /= String.length right then
        Err "left and right strands must be of equal length"

    else
        List.map2 compareNucleotides (String.toList left) (String.toList right)
            |> List.foldl (+) 0
            |> Ok


compareNucleotides : Char -> Char -> Int
compareNucleotides nucleotideA nucleotideB =
    if nucleotideA /= nucleotideB then
        1

    else
        0
