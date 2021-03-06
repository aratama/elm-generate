module ElmPortfolio.Page.Http exposing (Model, Msg, Route, page, route)

import Browser exposing (Document, UrlRequest(..))
import Browser.Navigation exposing (Key)
import ElmPortfolio.Common as Common exposing (Msg(..), Page, Session, decodeSession, encodeSession, initialSession, link)
import ElmPortfolio.Ports exposing (receiveTopic)
import Html exposing (br, button, div, h1, h2, img, p, text)
import Html.Attributes exposing (class, src)
import Html.Events exposing (onClick)
import Http
import Json.Decode as Decode
import Json.Encode exposing (Value)
import Url exposing (Url)
import Url.Parser exposing (Parser, map, s)


type alias Msg =
    Common.Msg PageMsg


type PageMsg
    = MorePlease
    | NewGif (Result Http.Error String)


type alias Model =
    { key : Key
    , session : Session
    , gifUrl : String
    }


type alias Route =
    ()


route : Parser (Route -> a) a
route =
    map () (s "http")


init : Value -> Url -> Key -> Route -> ( Model, Cmd Msg )
init value _ key _ =
    case Decode.decodeValue decodeSession value of
        Err _ ->
            ( Model key initialSession "waiting.gif", getRandomGif initialSession.topic )

        Ok session ->
            ( Model key session "waiting.gif", getRandomGif session.topic )


update : Msg -> Model -> ( Model, Cmd Msg )
update =
    Common.update <|
        \msg model ->
            case msg of
                MorePlease ->
                    ( { model | gifUrl = "waiting.gif" }, getRandomGif model.session.topic )

                NewGif (Ok newUrl) ->
                    ( { model | gifUrl = newUrl }, Cmd.none )

                NewGif (Err _) ->
                    ( model, Cmd.none )


getRandomGif : String -> Cmd Msg
getRandomGif topic =
    Cmd.map Common.PageMsg <|
        Http.get
            { url = "https://api.giphy.com/v1/gifs/random?api_key=dc6zaTOxFJmzC&tag=" ++ topic
            , expect = Http.expectJson NewGif decodeGifUrl
            }


decodeGifUrl : Decode.Decoder String
decodeGifUrl =
    Decode.at [ "data", "image_url" ] Decode.string


subscriptions : Model -> Sub Msg
subscriptions _ =
    receiveTopic Common.ReceiveTopic


view : Model -> Document Msg
view model =
    { title = "Http - ElmPortfolio"
    , body =
        [ Common.view model.session <|
            Html.map Common.PageMsg <|
                div [ class "page-http container" ]
                    [ h1 [] [ text "Http" ]
                    , h2 [] [ text <| "Topic: " ++ model.session.topic ]
                    , button [ onClick MorePlease ] [ text "More Please!" ]
                    , br [] []
                    , img [ src model.gifUrl ] []
                    , p []
                        [ text "Go to "
                        , link "/preferences" "the preferences page"
                        , text " to change topic."
                        ]
                    ]
        ]
    }


page : Page Model Msg Route a
page =
    { route = route
    , init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    , onUrlRequest = UrlRequest
    , onUrlChange = \_ -> NoOp
    , session = \model -> encodeSession model.session
    }
