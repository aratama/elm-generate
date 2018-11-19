module ElmPortfolio.Page.Minimum exposing (Model, Msg, Route, page)

import Browser exposing (Document)
import Browser.Navigation exposing (Key)
import ElmPortfolio.Root as Root exposing (Flags, Session, initial)
import Html exposing (h1, text)
import Url exposing (Url)
import Url.Parser exposing (Parser, map, s)


type Msg
    = NoOp


type alias Model =
    { session : Session }


type alias Route =
    ()


page : Root.Page Model Msg Route a
page =
    { route = map () (s "minimum")
    , init = \_ _ _ _ session -> ( { session = Maybe.withDefault initial session }, Cmd.none )
    , view = \_ -> { title = "Minimum - ElmPortfolio", body = [ h1 [] [ text "Minimum" ] ] }
    , update = \msg model -> ( model, Cmd.none )
    , subscriptions = always Sub.none
    , onUrlRequest = always Nothing
    }
