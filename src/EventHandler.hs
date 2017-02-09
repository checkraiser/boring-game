{-|
Module      : EventHandler
Description : Handle the input events
Copyright   : (c) Truong Dung, 2017
License     : GPL-3
Maintainer  : checkraiser11@gmail.com
Stability   : experimental
Portability : POSIX
-}
module EventHandler(handleKeys) where 

import Graphics.Gloss
import Graphics.Gloss.Interface.Pure.Game
import Pong(PongGame, ballLoc)

-- | Respond to key events.
handleKeys :: Event -> PongGame -> PongGame

-- For an 's' keypress, reset the ball to the center.
handleKeys (EventKey (Char 's') _ _ _) game =
  game { ballLoc = (0, 0) }

-- Do nothing for all other events.
handleKeys _ game = game