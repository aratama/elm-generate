module ElmPortfolio.Update exposing (..)

import UrlParser exposing (..)
import ElmPortfolio.Type exposing (Model, Msg(..), AscentMsg(..), DescentMsg(Initialize))
import UrlParser as UrlParser exposing (s, Parser, (</>), map)
import Navigation exposing (Location, newUrl)
import ElmPortfolio.Ports exposing (requestThemeFromLocalStorage, receiveThemeFromLocalStorage)
import Maybe exposing (withDefault)


init : Location -> ( Model, Cmd Msg )
init _ =
    ( { theme = "goat" }, requestThemeFromLocalStorage () )


update : Msg -> Model -> ( Model, Cmd Msg, Maybe DescentMsg )
update msg model =
    case msg of
        ChangeRoute url ->
            ( model, newUrl url, Nothing )

        ReceiveThemeFromLocalStorage themeMaybe ->
            ( { model | theme = withDefault model.theme themeMaybe }, Cmd.none, Just Initialize )


receive : AscentMsg -> Maybe Msg
receive msg =
    case msg of
        Navigate url ->
            Just (ChangeRoute url)


subscriptions : Sub Msg
subscriptions =
    receiveThemeFromLocalStorage ReceiveThemeFromLocalStorage