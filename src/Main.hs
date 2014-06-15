module Main where

import Prelude hiding (readFile)
import Data.BEncode
import Data.ByteString.Lazy hiding (putStrLn)
--import Data.Maybe

main = do
    torrent <- readFile "sample.torrent"
    let Just info = bRead torrent
    print info
