
--------------------------
-- Auto-generated codes --
-- Do not edit this     --
--------------------------

module ElmPortfolio.Alchelmy exposing (Model, Msg, program)

import Browser exposing (Document, UrlRequest(..), application)
import Browser.Navigation exposing (Key, load, pushUrl)
import Html as Html exposing (Html, text)
import Maybe as Maybe exposing (Maybe(..))
import Url exposing (Url)
import Url.Parser as UrlParser exposing (s, oneOf, Parser, parse, (</>))
import ElmPortfolio.Root as Root
import ElmPortfolio.Page.Counter as Counter
import ElmPortfolio.Page.Http as Http
import ElmPortfolio.Page.Minimum as Minimum
import ElmPortfolio.Page.NotFound as NotFound
import ElmPortfolio.Page.Preferences as Preferences
import ElmPortfolio.Page.Time as Time
import ElmPortfolio.Page.Top as Top
import ElmPortfolio.Page.URLParsing as URLParsing

type Model = Model
  { route : RouteState
  , session : Root.Session
  , key : Key
  , flags : Root.Flags
  }

type Route
  = Route__Counter Counter.Route
  | Route__Http Http.Route
  | Route__Minimum Minimum.Route
  | Route__NotFound NotFound.Route
  | Route__Preferences Preferences.Route
  | Route__Time Time.Route
  | Route__Top Top.Route
  | Route__URLParsing URLParsing.Route

type RouteState
  = State__Counter Counter.Model
  | State__Http Http.Model
  | State__Minimum Minimum.Model
  | State__NotFound NotFound.Model
  | State__Preferences Preferences.Model
  | State__Time Time.Model
  | State__Top Top.Model
  | State__URLParsing URLParsing.Model

type Msg
  = UrlRequest UrlRequest
  | Navigate Url
  | Msg__Counter Counter.Msg
  | Msg__Http Http.Msg
  | Msg__Minimum Minimum.Msg
  | Msg__NotFound NotFound.Msg
  | Msg__Preferences Preferences.Msg
  | Msg__Time Time.Msg
  | Msg__Top Top.Msg
  | Msg__URLParsing URLParsing.Msg


update : Msg -> Model -> ( Model, Cmd Msg )
update msg (Model model) =
  case msg of
    UrlRequest urlRequest ->
      let
        defaultNavigation =
          case urlRequest of
            Internal url ->
              ( Model model
              , pushUrl model.key (Url.toString url)
              )

            External url ->
              ( Model model
              , load url
              )
        in
          case model.route of

            State__Counter pmodel ->
              case Counter.page.onUrlRequest urlRequest of
                Nothing -> defaultNavigation
                Just onUrlRequestMsg ->
                  case Counter.page.update onUrlRequestMsg pmodel of
                    (pmodel_, pcmd) ->
                      ( Model { model | session = pmodel_.session, route = State__Counter pmodel_ }
                      , Cmd.map Msg__Counter pcmd
                      )
        

            State__Http pmodel ->
              case Http.page.onUrlRequest urlRequest of
                Nothing -> defaultNavigation
                Just onUrlRequestMsg ->
                  case Http.page.update onUrlRequestMsg pmodel of
                    (pmodel_, pcmd) ->
                      ( Model { model | session = pmodel_.session, route = State__Http pmodel_ }
                      , Cmd.map Msg__Http pcmd
                      )
        

            State__Minimum pmodel ->
              case Minimum.page.onUrlRequest urlRequest of
                Nothing -> defaultNavigation
                Just onUrlRequestMsg ->
                  case Minimum.page.update onUrlRequestMsg pmodel of
                    (pmodel_, pcmd) ->
                      ( Model { model | session = pmodel_.session, route = State__Minimum pmodel_ }
                      , Cmd.map Msg__Minimum pcmd
                      )
        

            State__NotFound pmodel ->
              case NotFound.page.onUrlRequest urlRequest of
                Nothing -> defaultNavigation
                Just onUrlRequestMsg ->
                  case NotFound.page.update onUrlRequestMsg pmodel of
                    (pmodel_, pcmd) ->
                      ( Model { model | session = pmodel_.session, route = State__NotFound pmodel_ }
                      , Cmd.map Msg__NotFound pcmd
                      )
        

            State__Preferences pmodel ->
              case Preferences.page.onUrlRequest urlRequest of
                Nothing -> defaultNavigation
                Just onUrlRequestMsg ->
                  case Preferences.page.update onUrlRequestMsg pmodel of
                    (pmodel_, pcmd) ->
                      ( Model { model | session = pmodel_.session, route = State__Preferences pmodel_ }
                      , Cmd.map Msg__Preferences pcmd
                      )
        

            State__Time pmodel ->
              case Time.page.onUrlRequest urlRequest of
                Nothing -> defaultNavigation
                Just onUrlRequestMsg ->
                  case Time.page.update onUrlRequestMsg pmodel of
                    (pmodel_, pcmd) ->
                      ( Model { model | session = pmodel_.session, route = State__Time pmodel_ }
                      , Cmd.map Msg__Time pcmd
                      )
        

            State__Top pmodel ->
              case Top.page.onUrlRequest urlRequest of
                Nothing -> defaultNavigation
                Just onUrlRequestMsg ->
                  case Top.page.update onUrlRequestMsg pmodel of
                    (pmodel_, pcmd) ->
                      ( Model { model | session = pmodel_.session, route = State__Top pmodel_ }
                      , Cmd.map Msg__Top pcmd
                      )
        

            State__URLParsing pmodel ->
              case URLParsing.page.onUrlRequest urlRequest of
                Nothing -> defaultNavigation
                Just onUrlRequestMsg ->
                  case URLParsing.page.update onUrlRequestMsg pmodel of
                    (pmodel_, pcmd) ->
                      ( Model { model | session = pmodel_.session, route = State__URLParsing pmodel_ }
                      , Cmd.map Msg__URLParsing pcmd
                      )
        

    Navigate location ->

      let
        defaultNavigation =
            case parseLocation location of

                Route__Counter routeValue ->
                      case Counter.page.init model.flags location model.key routeValue (Just model.session) of
                        (initialModel, initialCmd) ->
                          ( Model { model | session = initialModel.session, route = State__Counter initialModel }
                          , Cmd.map Msg__Counter initialCmd
                          )
                

                Route__Http routeValue ->
                      case Http.page.init model.flags location model.key routeValue (Just model.session) of
                        (initialModel, initialCmd) ->
                          ( Model { model | session = initialModel.session, route = State__Http initialModel }
                          , Cmd.map Msg__Http initialCmd
                          )
                

                Route__Minimum routeValue ->
                      case Minimum.page.init model.flags location model.key routeValue (Just model.session) of
                        (initialModel, initialCmd) ->
                          ( Model { model | session = initialModel.session, route = State__Minimum initialModel }
                          , Cmd.map Msg__Minimum initialCmd
                          )
                

                Route__NotFound routeValue ->
                      case NotFound.page.init model.flags location model.key routeValue (Just model.session) of
                        (initialModel, initialCmd) ->
                          ( Model { model | session = initialModel.session, route = State__NotFound initialModel }
                          , Cmd.map Msg__NotFound initialCmd
                          )
                

                Route__Preferences routeValue ->
                      case Preferences.page.init model.flags location model.key routeValue (Just model.session) of
                        (initialModel, initialCmd) ->
                          ( Model { model | session = initialModel.session, route = State__Preferences initialModel }
                          , Cmd.map Msg__Preferences initialCmd
                          )
                

                Route__Time routeValue ->
                      case Time.page.init model.flags location model.key routeValue (Just model.session) of
                        (initialModel, initialCmd) ->
                          ( Model { model | session = initialModel.session, route = State__Time initialModel }
                          , Cmd.map Msg__Time initialCmd
                          )
                

                Route__Top routeValue ->
                      case Top.page.init model.flags location model.key routeValue (Just model.session) of
                        (initialModel, initialCmd) ->
                          ( Model { model | session = initialModel.session, route = State__Top initialModel }
                          , Cmd.map Msg__Top initialCmd
                          )
                

                Route__URLParsing routeValue ->
                      case URLParsing.page.init model.flags location model.key routeValue (Just model.session) of
                        (initialModel, initialCmd) ->
                          ( Model { model | session = initialModel.session, route = State__URLParsing initialModel }
                          , Cmd.map Msg__URLParsing initialCmd
                          )
                
      in
      case model.route of

        State__Counter pmodel -> defaultNavigation
        

        State__Http pmodel -> defaultNavigation
        

        State__Minimum pmodel -> defaultNavigation
        

        State__NotFound pmodel -> defaultNavigation
        

        State__Preferences pmodel -> defaultNavigation
        

        State__Time pmodel -> defaultNavigation
        

        State__Top pmodel -> defaultNavigation
        

        State__URLParsing pmodel -> defaultNavigation
        



    Msg__Counter pageMsg ->
      case model.route of
        State__Counter pageModel ->
          case Counter.page.update pageMsg { pageModel | session = model.session } of
            (pageModel_, pageCmd ) ->
              (Model { model | session = pageModel_.session, route = State__Counter pageModel_ }, Cmd.map Msg__Counter pageCmd)
        _ -> (Model model, Cmd.none)

    Msg__Http pageMsg ->
      case model.route of
        State__Http pageModel ->
          case Http.page.update pageMsg { pageModel | session = model.session } of
            (pageModel_, pageCmd ) ->
              (Model { model | session = pageModel_.session, route = State__Http pageModel_ }, Cmd.map Msg__Http pageCmd)
        _ -> (Model model, Cmd.none)

    Msg__Minimum pageMsg ->
      case model.route of
        State__Minimum pageModel ->
          case Minimum.page.update pageMsg { pageModel | session = model.session } of
            (pageModel_, pageCmd ) ->
              (Model { model | session = pageModel_.session, route = State__Minimum pageModel_ }, Cmd.map Msg__Minimum pageCmd)
        _ -> (Model model, Cmd.none)

    Msg__NotFound pageMsg ->
      case model.route of
        State__NotFound pageModel ->
          case NotFound.page.update pageMsg { pageModel | session = model.session } of
            (pageModel_, pageCmd ) ->
              (Model { model | session = pageModel_.session, route = State__NotFound pageModel_ }, Cmd.map Msg__NotFound pageCmd)
        _ -> (Model model, Cmd.none)

    Msg__Preferences pageMsg ->
      case model.route of
        State__Preferences pageModel ->
          case Preferences.page.update pageMsg { pageModel | session = model.session } of
            (pageModel_, pageCmd ) ->
              (Model { model | session = pageModel_.session, route = State__Preferences pageModel_ }, Cmd.map Msg__Preferences pageCmd)
        _ -> (Model model, Cmd.none)

    Msg__Time pageMsg ->
      case model.route of
        State__Time pageModel ->
          case Time.page.update pageMsg { pageModel | session = model.session } of
            (pageModel_, pageCmd ) ->
              (Model { model | session = pageModel_.session, route = State__Time pageModel_ }, Cmd.map Msg__Time pageCmd)
        _ -> (Model model, Cmd.none)

    Msg__Top pageMsg ->
      case model.route of
        State__Top pageModel ->
          case Top.page.update pageMsg { pageModel | session = model.session } of
            (pageModel_, pageCmd ) ->
              (Model { model | session = pageModel_.session, route = State__Top pageModel_ }, Cmd.map Msg__Top pageCmd)
        _ -> (Model model, Cmd.none)

    Msg__URLParsing pageMsg ->
      case model.route of
        State__URLParsing pageModel ->
          case URLParsing.page.update pageMsg { pageModel | session = model.session } of
            (pageModel_, pageCmd ) ->
              (Model { model | session = pageModel_.session, route = State__URLParsing pageModel_ }, Cmd.map Msg__URLParsing pageCmd)
        _ -> (Model model, Cmd.none)

documentMap : (msg -> Msg) -> Document msg -> Document Msg
documentMap f { title, body } = { title = title, body = List.map (Html.map f) body }

view : Model -> Document Msg
view (Model model) = case model.route of

  State__Counter m -> documentMap Msg__Counter (Counter.page.view { m | session = model.session })
  State__Http m -> documentMap Msg__Http (Http.page.view { m | session = model.session })
  State__Minimum m -> documentMap Msg__Minimum (Minimum.page.view { m | session = model.session })
  State__NotFound m -> documentMap Msg__NotFound (NotFound.page.view { m | session = model.session })
  State__Preferences m -> documentMap Msg__Preferences (Preferences.page.view { m | session = model.session })
  State__Time m -> documentMap Msg__Time (Time.page.view { m | session = model.session })
  State__Top m -> documentMap Msg__Top (Top.page.view { m | session = model.session })
  State__URLParsing m -> documentMap Msg__URLParsing (URLParsing.page.view { m | session = model.session })

matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ UrlParser.map Route__Counter Counter.page.route
        , UrlParser.map Route__Http Http.page.route
        , UrlParser.map Route__Minimum Minimum.page.route
        , UrlParser.map Route__NotFound NotFound.page.route
        , UrlParser.map Route__Preferences Preferences.page.route
        , UrlParser.map Route__Time Time.page.route
        , UrlParser.map Route__Top Top.page.route
        , UrlParser.map Route__URLParsing URLParsing.page.route
        ]

parseLocation : Url -> Route
parseLocation location =
    case parse matchers location of
        Just route ->
            route

        Nothing ->
            Route__NotFound ()

navigate : Url -> Msg
navigate = Navigate

init : Root.Flags -> Url -> Key -> ( Model, Cmd Msg )
init flags location key =

        case parseLocation location of

          Route__Counter routeValue -> case Counter.page.init flags location key routeValue Nothing of
                (initialModel, initialCmd) ->
                    ( Model
                        { route = State__Counter initialModel
                        , session = initialModel.session
                        , key = key
                        , flags = flags
                        }
                    , Cmd.map Msg__Counter initialCmd
                    )
                
          Route__Http routeValue -> case Http.page.init flags location key routeValue Nothing of
                (initialModel, initialCmd) ->
                    ( Model
                        { route = State__Http initialModel
                        , session = initialModel.session
                        , key = key
                        , flags = flags
                        }
                    , Cmd.map Msg__Http initialCmd
                    )
                
          Route__Minimum routeValue -> case Minimum.page.init flags location key routeValue Nothing of
                (initialModel, initialCmd) ->
                    ( Model
                        { route = State__Minimum initialModel
                        , session = initialModel.session
                        , key = key
                        , flags = flags
                        }
                    , Cmd.map Msg__Minimum initialCmd
                    )
                
          Route__NotFound routeValue -> case NotFound.page.init flags location key routeValue Nothing of
                (initialModel, initialCmd) ->
                    ( Model
                        { route = State__NotFound initialModel
                        , session = initialModel.session
                        , key = key
                        , flags = flags
                        }
                    , Cmd.map Msg__NotFound initialCmd
                    )
                
          Route__Preferences routeValue -> case Preferences.page.init flags location key routeValue Nothing of
                (initialModel, initialCmd) ->
                    ( Model
                        { route = State__Preferences initialModel
                        , session = initialModel.session
                        , key = key
                        , flags = flags
                        }
                    , Cmd.map Msg__Preferences initialCmd
                    )
                
          Route__Time routeValue -> case Time.page.init flags location key routeValue Nothing of
                (initialModel, initialCmd) ->
                    ( Model
                        { route = State__Time initialModel
                        , session = initialModel.session
                        , key = key
                        , flags = flags
                        }
                    , Cmd.map Msg__Time initialCmd
                    )
                
          Route__Top routeValue -> case Top.page.init flags location key routeValue Nothing of
                (initialModel, initialCmd) ->
                    ( Model
                        { route = State__Top initialModel
                        , session = initialModel.session
                        , key = key
                        , flags = flags
                        }
                    , Cmd.map Msg__Top initialCmd
                    )
                
          Route__URLParsing routeValue -> case URLParsing.page.init flags location key routeValue Nothing of
                (initialModel, initialCmd) ->
                    ( Model
                        { route = State__URLParsing initialModel
                        , session = initialModel.session
                        , key = key
                        , flags = flags
                        }
                    , Cmd.map Msg__URLParsing initialCmd
                    )
                

subscriptions : Model -> Sub Msg
subscriptions (Model model) =
    case model.route of
        State__Counter routeValue -> Sub.map Msg__Counter (Counter.page.subscriptions routeValue)
        State__Http routeValue -> Sub.map Msg__Http (Http.page.subscriptions routeValue)
        State__Minimum routeValue -> Sub.map Msg__Minimum (Minimum.page.subscriptions routeValue)
        State__NotFound routeValue -> Sub.map Msg__NotFound (NotFound.page.subscriptions routeValue)
        State__Preferences routeValue -> Sub.map Msg__Preferences (Preferences.page.subscriptions routeValue)
        State__Time routeValue -> Sub.map Msg__Time (Time.page.subscriptions routeValue)
        State__Top routeValue -> Sub.map Msg__Top (Top.page.subscriptions routeValue)
        State__URLParsing routeValue -> Sub.map Msg__URLParsing (URLParsing.page.subscriptions routeValue)

program : Program Root.Flags Model Msg
program =
    application
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlRequest = UrlRequest
        , onUrlChange = Navigate
        }


