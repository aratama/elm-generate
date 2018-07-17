module CoolSPA.Page.NotFound.Update exposing (..)

import UrlParser exposing (..)
import Html exposing (Html, text, div, h1, img, a, p)
import Html.Attributes exposing (src, href)
import CoolSPA.Page.NotFound.Type exposing (Model, Msg)
import UrlParser as UrlParser exposing (s, Parser, (</>), map, top)


initial : Model
initial =
    {}


initialize : Cmd Msg
initialize =
    Cmd.none


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )


route : Parser (Model -> a) a
route =
    map Model (s "not-found")
