module Graphics.Gloss.Utils.Scanners where

import Graphics.Gloss.Data.Color (rgbaOfColor, withAlpha, makeColor)

import Graphics.Gloss.Utils.PictureState

withinBound :: (Ord a, Num a) => a -> a -> a -> Bool
withinBound bound x y
    | x <= y    = x >= y - bound
    | otherwise = x <= y + bound

horizontalScanner :: Float -> Float -> Float -> [PictureState] -> [PictureState]
horizontalScanner h curFrame speed = map go
    where
        curY   = (0.5 * h) - ((curFrame / speed) * h)
        lineBound = 1.0
        onLine p = withinBound lineBound curY (snd (_coords p))
        alphaStep = 0.01
        dimmer p =
            let (r, g, b, a) = rgbaOfColor (_color p)
            in makeColor r g b (a - alphaStep)
        go p
            | onLine p  = p { _color = withAlpha 1.0 (_color p) }
            | otherwise = p { _color = dimmer p }
