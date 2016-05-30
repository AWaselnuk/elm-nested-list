import ThingList
import Html.App as Html

main =
  Html.program
    { view = ThingList.view
    , update = ThingList.update
    , init = ThingList.init
    , subscriptions = \_ -> Sub.none
    }
