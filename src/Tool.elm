-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at http://mozilla.org/MPL/2.0/


module Tool exposing (..)

import Element exposing (Element)
import Html.Lazy exposing (lazy2)
import Icons


type Tool
    = Move
    | Contour
    | BBox
    | Outline
    | Stroke
    | Point


allAnnotationTools : List Tool
allAnnotationTools =
    [ Contour, BBox, Outline, Stroke, Point ]


svgElement : Float -> Tool -> Element style variation msg
svgElement size tool =
    let
        svgIcon =
            case tool of
                Move ->
                    Icons.move

                Contour ->
                    Icons.contour

                BBox ->
                    Icons.boundingBox

                Outline ->
                    Icons.outline

                Stroke ->
                    Icons.stroke

                Point ->
                    Icons.point
    in
    lazy2 Icons.sized size svgIcon
        |> Element.html