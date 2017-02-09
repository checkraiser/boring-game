{-|
Module      : Animation
Description : Move the ball
Copyright   : (c) Truong Dung, 2017
License     : GPL-3
Maintainer  : checkraiser11@gmail.com
Stability   : experimental
Portability : POSIX
-}
module Animation(moveBall) where 

import Pong(PongGame, ballLoc, ballVel)

-- | Update the ball position using its current velocity.
moveBall :: Float -- ^ The number of seconds since last update
         -> PongGame -- ^ The initial game state
         -> PongGame -- ^ A new game state with an updated ball position

moveBall seconds game = game { ballLoc = (x', y') }         
  where 
    -- Old locations and velocities
    (x, y) = ballLoc game 
    (vx, vy) = ballVel game 
    -- New locations.
    x' = x + vx * seconds
    y' = y + vy * seconds

