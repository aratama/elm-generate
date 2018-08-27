"use strict";

Object.defineProperty(exports, "__esModule", {
    value: true
});
exports.renderRootUpdate = renderRootUpdate;
function renderRootUpdate(application) {

    return `
module ${application}.Update exposing (..)

import UrlParser exposing (..)
import ${application}.Type exposing (Model, Msg(..), AscentMsg(..), DescentMsg)
import UrlParser as UrlParser exposing (s, Parser, (</>), map, parseHash)
import Navigation exposing (Location, newUrl)
import Maybe exposing (withDefault)


init : Location -> ( Model, Cmd Msg )
init _ =
    ( {}, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg, Maybe DescentMsg )
update msg model =
    case msg of
        Navigate url ->
            Just (ChangeRoute url)

receive : AscentMsg -> Maybe Msg
receive msg =
    Nothing


subscriptions : Sub Msg
subscriptions =
    Sub.none


parse : Parser (a -> a) a -> Location -> Maybe a
parse = parseHash

`.trim();
}