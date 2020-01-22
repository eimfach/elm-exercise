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
        |> List.foldr convertNucleotide (Ok "")


convertNucleotide : Nucleotide -> Result Char String -> Result Char String
convertNucleotide nucleotide rna =
    case rna of
        Ok resultRna ->
            case nucleotide of
                InvalidNucleotide err ->
                    Err err

                A ->
                    Ok <| "A" ++ resultRna

                C ->
                    Ok <| "C" ++ resultRna

                G ->
                    Ok <| "G" ++ resultRna

                U ->
                    Ok <| "U" ++ resultRna

                T ->
                    Ok <| "T" ++ resultRna

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
