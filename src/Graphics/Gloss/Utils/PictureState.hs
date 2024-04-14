module Graphics.Gloss.Utils.PictureState (
    PictureState(..)
) where

import Graphics.Gloss.Data.Picture (Picture)
import Graphics.Gloss.Data.Color (Color)
import Graphics.Gloss.Data.Point (Point)

data PictureState = MkPictureState
    { _color   :: Color
    , _coords  :: Point
    , _picture :: Picture
    } deriving (Eq, Show)
