module Thing exposing (Model, update, view, init, Msg)

import Html exposing (..)
import Html.App as App
import Html.Attributes exposing (..)
import Html.Events exposing (..)

-- MODEL

type alias Model =
  { name : String
  }

-- UPDATE

type Msg
  = ModifyName String
  | Remove

-- HINT FROM SPORTO
-- you can return a tuple with three values from the child
-- the third value is a message for the parent
-- or a command using the parent types
-- so the child would return something like (Model, Cmd, RootCmd)
-- ^^ Use that pattern instead of passing in context

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    ModifyName name ->
      ({ model | name = name }, Cmd.none)
    Remove ->
      (model, Cmd.none)

-- VIEW

view : Model -> Html Msg
view model =
  div
    [ class "character" ]
    [ label
        [ for "character-name" ]
        [ text model.name ]
    , input
        [
          class "character-name"
        , type' "text"
        , value (model.name)
        , onInput ModifyName
        ] []
    , button
        [ onClick Remove ]
        [ text "Remove" ]
    ]

init : Model
init =
  { name = "A name" }
