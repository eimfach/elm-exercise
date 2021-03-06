module RNATranscription exposing (toRNA)


type Nucleotide
    = A
    | C
    | G
    | U
    | T
    | InvalidNucleotide Char


toRNA : String -> Result Char String
toRNA dna =
    String.toList dna
        |> List.map parseDnaToRna
        |> List.foldl convertNucleotide (Ok "")


convertNucleotide : Nucleotide -> Result Char String -> Result Char String
convertNucleotide nucleotide rna =
    case rna of
        Ok resultRna ->
            case nucleotide of
                InvalidNucleotide err ->
                    Err err

                A ->
                    Ok <| resultRna ++ "A"

                C ->
                    Ok <| resultRna ++ "C"

                G ->
                    Ok <| resultRna ++ "G"

                U ->
                    Ok <| resultRna ++ "U"

                T ->
                    Ok <| resultRna ++ "T"

        Err theError ->
            Err theError


parseDnaToRna : Char -> Nucleotide
parseDnaToRna theNucleotide =
    case theNucleotide of
        'G' ->
            C

        'C' ->
            G

        'T' ->
            A

        'A' ->
            U

        _ ->
            InvalidNucleotide theNucleotide
