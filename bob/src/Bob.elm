module Bob exposing (hey)

import Regex


hey : String -> String
hey remark =
    let
        addressSilent =
            case Regex.fromString "^\\s*$" of
                Just whiteSpaceRegex ->
                    Regex.contains whiteSpaceRegex remark

                Nothing ->
                    False

        yell =
            let
                alphaWords =
                    remark
                        |> String.words
                        |> String.join ""
                        |> String.filter Char.isAlpha
            in
            String.length alphaWords > 0 && String.all Char.isUpper alphaWords

        question =
            remark
                |> String.words
                |> String.join ""
                |> String.endsWith "?"
    in
    if addressSilent then
        "Fine. Be that way!"

    else if yell then
        if question then
            "Calm down, I know what I'm doing!"

        else
            "Whoa, chill out!"

    else if question then
        "Sure."

    else
        "Whatever."
