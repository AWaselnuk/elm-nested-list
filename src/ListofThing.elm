module ListofThing exposing (Model, update, view, init, Msg)

import Thing
import Html exposing (..)
import Html.App as App
import Html.Attributes exposing (..)
import Html.Events exposing (..)

-- MODEL

type alias ID = Int

type alias ThingList = List (ID, Thing.Model)

type alias Model =
  { uid : ID
  , thingList : ThingList
  }

init : (Model, Cmd Msg)
init =
  ({ uid = 1
  , thingList = [] }
  , Cmd.none)

-- UPDATE

type Msg
  = NoOp
  | AddThing Thing.Model
  | RemoveThing ID
  | ModifyThing ID Thing.Msg

update: Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    NoOp ->
      (model, Cmd.none)
    AddThing thing ->
      let
        newThingList = (model.uid, thing) :: model.thingList
      in
        ({ model |
             thingList = newThingList,
             uid = model.uid + 1 }
        , Cmd.none)
    RemoveThing id ->
      let
        newThingList = List.filter (\(thingID, _) -> thingID /= id) model.thingList
      in
        ({ model | thingList = newThingList }
        , Cmd.none)
    ModifyThing id thingMsg ->
      let
        updateThing (thingID, thingModel) =
          if id == thingID then
            (thingID, fst <| Thing.update thingMsg thingModel)
          else
            (thingID, thingModel)
        newThingList = List.map updateThing model.thingList
      in
        ({ model | thingList = newThingList }
        , Cmd.none)

-- VIEW

view : Model -> Html Msg
view model =
  div
    []
    [ addThingView model
    , div
        [ class "characters" ]
        (List.map indexedThingView model.thingList)
    ]

indexedThingView : (ID, Thing.Model) -> Html Msg
indexedThingView (id, model) =
  App.map (ModifyThing id) (Thing.view model)

addThingView : Model -> Html Msg
addThingView model =
  div
    []
    [ button
        [ onClick (AddThing (Thing.Model "new thing")) ]
        [ text "Add Thing"]
    ]
