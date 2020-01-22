module TwoFer exposing (twoFer)


twoFer : Maybe String -> String
twoFer name =
    let
        verifiedName =
            Maybe.withDefault "you" name
    in
    "One for " ++ verifiedName ++ ", one for me."
