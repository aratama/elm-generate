module ElmPortfolio.Page.URLParsing.Type exposing (..)

import Navigation exposing (Location)


type Msg
    = Navigate String


type alias Model =
    { id : Int, location : Location }


type alias Route =
    Int
