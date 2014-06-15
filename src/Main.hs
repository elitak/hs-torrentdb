module Main where

import Data.BEncode
import Data.ByteString.Lazy as BS
import Data.Map
import Control.Monad
import Prelude as P

main = do
    torrent <- BS.readFile "sample.torrent"
    let Just bdata = bRead torrent
    let BDict outer = bdata
    let BDict info = outer ! "info"
    let BList files = info ! "files"
    forM files $ \(BDict fileInfo) -> do
        let BList [BString path] = fileInfo ! "path"
        let BInt length = fileInfo ! "length"
        P.putStr $ show length ++ " "
        BS.putStrLn path
