{-|
Module      : Collision
Description : Collision detection
Copyright   : (c) Truong Dung, 2017
License     : GPL-3
Maintainer  : checkraiser11@gmail.com
Stability   : experimental
Portability : POSIX
-}
module Collision(wallBounce2) where 

import Pong(PongGame, ballLoc, ballVel)

-- | Detect a collision with a paddle. Upon collisions,
-- change the velocity of the ball to bounce it off the paddle.
-- paddleBounce :: PongGame -> PongGame
wallBounce2 :: Int -> PongGame -> PongGame
wallBounce2 width game = game { ballVel = (vx, vy') }
  where
    -- Radius. Use the same thing as in `render`.
    radius = 10

    -- The old velocities.
    (vx, vy) = ballVel game

    vy' = if wallCollision2 width (ballLoc game) radius
          then
             -- Update the velocity.
             -vy
           else
            -- Do nothing. Return the old velocity.
            vy

type Radius = Float 
type Position = (Float, Float)

-- | Given position and radius of the ball, return whether a collision occurred.
wallCollision2 :: Int -> Position -> Radius -> Bool 
wallCollision2 width (_, y) radius = topCollision || bottomCollision
  where
    topCollision    = y - radius <= -fromIntegral width / 2 
    bottomCollision = y + radius >=  fromIntegral width / 2
