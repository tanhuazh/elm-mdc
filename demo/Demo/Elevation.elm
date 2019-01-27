module Demo.Elevation exposing (Model, Msg(..), defaultModel, update, view)

import Demo.Helper.Hero as Hero
import Demo.Helper.ResourceLink as ResourceLink
import Demo.Page as Page exposing (Page)
import Html exposing (Html, text)
import Material
import Material.Elevation as Elevation
import Material.Options as Options exposing (cs, css, styled, when)
import Material.Typography as Typography


type alias Model m =
    { mdc : Material.Model m
    , transition : Bool
    , elevation : Int
    }


defaultModel : Model m
defaultModel =
    { transition = False
    , elevation = 1
    , mdc = Material.defaultModel
    }


type Msg m
    = Mdc (Material.Msg m)


update : (Msg m -> m) -> Msg m -> Model m -> ( Model m, Cmd m )
update lift msg model =
    case msg of
        Mdc msg_ ->
            Material.update (lift << Mdc) msg_ model


view : (Msg m -> m) -> Page m -> Model m -> Html m
view lift page model =
    let
        heroSurface options =
            styled Html.figure
                (css "width" "120px"
                    :: css "height" "48px"
                    :: css "min-width" "200px"
                    :: css "min-height" "100px"
                    :: css "margin" "24px"
                    :: css "background-color" "#212121"
                    :: css "color" "#f0f0f0"
                    :: css "display" "flex"
                    :: css "align-items" "center"
                    :: css "justify-content" "center"
                    :: options
                )
                << List.singleton
                << Html.figcaption []
    in
    page.body "Elevation"
        "Elevation is the relative depth, or distance, between two surfaces along the z-axis."
        [ Hero.view []
            [ heroSurface
                [ Elevation.z0
                ]
                [ text "Flat 0dp" ]
            , heroSurface
                [ Elevation.z8
                ]
                [ text "Raised 8dp" ]
            , heroSurface
                [ Elevation.z16
                ]
                [ text "Raised 16dp" ]
            ]
        , styled Html.h2
            [ Typography.headline6
            , css "border-bottom" "1px solid rgba(0,0,0,.87)"
            ]
            [ text "Resources"
            ]
        , ResourceLink.view
            { link = "https://material.io/go/design-elevation"
            , title = "Material Design Guidelines"
            , icon = "images/material.svg"
            , altText = "Material Design Guidelines icon"
            }
        , ResourceLink.view
            { link = "https://material.io/components/web/catalog/elevation/"
            , title = "Documentation"
            , icon = "images/ic_drive_document_24px.svg"
            , altText = "Documentation icon"
            }
        , ResourceLink.view
            { link = "https://github.com/material-components/material-components-web/tree/master/packages/mdc-elevation"
            , title = "Source Code (Material Components Web)"
            , icon = "images/ic_code_24px.svg"
            , altText = "Source Code"
            }
        , Page.demos
            [ styled Html.div
                [ cs "elevation-demo-container"
                , css "display" "flex"
                , css "flex-flow" "row wrap"
                , css "justify-content" "space-between"
                ]
                (List.map
                    (\z ->
                        styled Html.figure
                            [ case z of
                                0 ->
                                    Elevation.z0

                                1 ->
                                    Elevation.z1

                                2 ->
                                    Elevation.z2

                                3 ->
                                    Elevation.z3

                                4 ->
                                    Elevation.z4

                                5 ->
                                    Elevation.z5

                                6 ->
                                    Elevation.z6

                                7 ->
                                    Elevation.z7

                                8 ->
                                    Elevation.z8

                                9 ->
                                    Elevation.z9

                                10 ->
                                    Elevation.z10

                                11 ->
                                    Elevation.z11

                                12 ->
                                    Elevation.z12

                                13 ->
                                    Elevation.z13

                                14 ->
                                    Elevation.z14

                                15 ->
                                    Elevation.z15

                                16 ->
                                    Elevation.z16

                                17 ->
                                    Elevation.z17

                                18 ->
                                    Elevation.z18

                                19 ->
                                    Elevation.z19

                                20 ->
                                    Elevation.z20

                                21 ->
                                    Elevation.z21

                                22 ->
                                    Elevation.z22

                                23 ->
                                    Elevation.z23

                                _ ->
                                    Elevation.z24
                            , css "min-width" "200px"
                            , css "min-height" "100px"
                            , css "margin" "15px"
                            , css "justify-content" "space-around"
                            , css "align-items" "center"
                            , css "display" "inline-flex"
                            ]
                            [ styled Html.figcaption
                                [ css "text-align" "center"
                                ]
                                [ text (String.fromInt z ++ "dp") ]
                            ]
                    )
                    (List.range 0 24)
                )
            ]
        ]
