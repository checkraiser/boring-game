{-|
Module      : Main
Description : Test the game
Copyright   : (c) Truong Dung, 2017
License     : GPL-3
Maintainer  : checkraiser11@gmail.com
Stability   : experimental
Portability : POSIX
-}
module Main(main) where

import Graphics.Gloss

import Pong (PongGame, render, initialState)
import Animation(moveBall)
import Collision(wallBounce2)
import EventHandler(handleKeys)

width, height, offset :: Int
width = 300
height = 300
offset = 10

window :: Display
window = InWindow "Nice Window" (width, height) (offset, offset)

background :: Color
background = black

main1 :: IO ()
main1 = animate window background frame
  where
    frame :: Float -> Picture
    frame seconds = render $ moveBall seconds initialState

-- | Number of frames to show per second.
fps :: Int
fps = 120

main :: IO ()
main = play window background fps initialState render handleKeys update

-- | Update the game by moving the ball and bouncing off walls.
update :: Float -> PongGame -> PongGame
update seconds = (wallBounce2 width) . moveBall seconds