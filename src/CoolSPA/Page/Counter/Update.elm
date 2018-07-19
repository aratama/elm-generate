module CoolSPA.Page.Counter.Update exposing (..)

import UrlParser exposing (..)
import Html exposing (Html, text, div, h1, img, a, p)
import Html.Attributes exposing (src, href)
import CoolSPA.Page.Counter.Type exposing (Model, Msg(..), Route)
import CoolSPA.Type as Root
import UrlParser as UrlParser exposing (s, Parser, (</>), map)


route : Parser (Route -> a) a
route =
    map 0 (s "counter")


init : Route -> Root.Model -> ( Model, Cmd Msg )
init route rootModel =
    ( route, Cmd.none )


update : Msg -> Root.Model -> Model -> ( Root.Model, Model, Cmd Msg )
update msg rootModel model =
    case msg of
        Increment ->
            ( rootModel, model + 1, Cmd.none )

        Decrement ->
            ( rootModel, model - 1, Cmd.none )