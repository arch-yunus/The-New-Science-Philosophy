-- hanif_logic.hs
-- Part of The-New-Science-Philosophy (NSP-Core)
-- This module implements "Hanif Metrics" using Haskell's pure functional paradigm.
-- Purity and Immutability represents "Fitra" (The primordial nature).

module HanifLogic where

import Data.List (foldl')

-- | A representation of a Technology or Scientific Discovery
data Technology = Technology {
    name :: String,
    energyConsumption :: Double,    -- Scale 0.0 to 1.0 (lower is better)
    humanDignityImpact :: Double,   -- Scale 0.0 to 1.0 (higher is better)
    natureReciprocity :: Double,    -- Scale 0.0 to 1.0 (higher is better)
    openAccess :: Bool              -- Is it free from corporate monopoly?
} deriving (Show)

-- | Calculate the "Hanif Score" of a technology.
-- If any metric is below a certain threshold, the technology is "Fasad" (Corrupt).
calculateHanifScore :: Technology -> Either String Double
calculateHanifScore tech
    | humanDignityImpact tech < 0.5 = Left "Error: Technology devalues human soul."
    | energyConsumption tech > 0.8   = Left "Error: Excessive waste violates nature's balance."
    | not (openAccess tech)          = Left "Error: Locked knowledge creates corporate priesthood."
    | otherwise = Right score
  where
    score = (humanDignityImpact tech + natureReciprocity tech) / (1.0 + energyConsumption tech)

-- | Example: Assessing Modern Surveillance AI vs. Decentralized Solar Mesh
main :: IO ()
main = do
    let surveillanceAI = Technology "Surveillance AI" 0.9 0.1 0.2 False
    let solarMesh = Technology "Community Solar Mesh" 0.2 0.9 0.9 True
    
    putStrLn "--- Assessing Surveillance AI ---"
    print $ calculateHanifScore surveillanceAI
    
    putStrLn "\n--- Assessing Community Solar Mesh ---"
    print $ calculateHanifScore solarMesh
