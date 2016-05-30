import ListofThing
import Html.App as Html

main =
  Html.program
    { view = ListofThing.view
    , update = ListofThing.update
    , init = ListofThing.init
    , subscriptions = \_ -> Sub.none
    }
