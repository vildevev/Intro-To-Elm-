import Char
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events as E exposing (onInput, onClick)
import String exposing (any)

main =
  Html.beginnerProgram
    { model = model
    , view = view
    , update = update
    }



-- MODEL


type alias Model =
  { name : String
  , age : String
  , password : String
  , passwordAgain : String
  }


model : Model
model =
  Model "" "" "" ""



-- UPDATE


type Msg
    = Name String
    | Age String
    | Password String
    | PasswordAgain String


update : Msg -> Model -> Model
update msg model =
  case msg of
    Name name ->
      { model | name = name }

    Age age -> 
      { model | age = age }

    Password password ->
      { model | password = password }

    PasswordAgain password ->
      { model | passwordAgain = password }

       




-- VIEW


view : Model -> Html Msg
view model =
  div []
    [ input [ type_ "text", placeholder "Name", onInput Name ] []
    , input [ type_ "age", placeholder "Age", onInput Age] []
    , input [ type_ "password", placeholder "Password", onInput Password ] []
    , input [ type_ "password", placeholder "Re-enter Password", onInput PasswordAgain ] []
    , viewValidation model
    ]


viewValidation : Model -> Html msg
viewValidation model =
  let
    (color, message) =
      if model.password == model.passwordAgain && String.length model.password > 8 && any Char.isDigit model.password && any Char.isUpper model.password && any Char.isLower model.password then
        ("green", "OK")
      else if any Char.isDigit model.age then 
        ("green", "OK")
      -- Add submit button
      else
        ("red", "Passwords do not match!")
  in
    div [ style [("color", color)] ] [ text message ]
