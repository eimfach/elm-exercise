module RNATranscription2 exposing (toRNA)

-- Another solution from: https://exercism.io/tracks/elm/exercises/rna-transcription/solutions/57d548b82f174fe8a45885079caa970b


toRNA : String -> Result Char String
toRNA dna =
    dna
        |> String.toList
        |> List.map transcribe
        |> List.foldr (Result.map2 (::)) (Ok [])
        |> Result.map String.fromList


transcribe : Char -> Result Char Char
transcribe c =
    case c of
        'G' ->
            Ok 'C'

        'C' ->
            Ok 'G'

        'T' ->
            Ok 'A'

        'A' ->
            Ok 'U'

        _ ->
            Err c
