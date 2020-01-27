module Pangram exposing (isPangram)


alphabet : List String
alphabet =
    "the quick brown fox jumps over the lazy dog"
        |> String.words
        |> String.join ""
        |> String.toList
        |> List.map String.fromChar


isPangram : String -> Bool
isPangram sentence =
    let
        lowerCaseSentence =
            String.toLower sentence
    in
    alphabet
        |> List.map (\letter -> String.contains letter lowerCaseSentence)
        |> List.all (\b -> b == True)
