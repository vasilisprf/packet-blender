module PacketBlender.Doodad( callfun ) where

import Network.Pcap                                   
import System.IO
import Control.Monad

callfun f = do
    ( p , q ) <- next f
    callfun2 f p q

callfun2 f p q
      | hdrWireLength p /= 0 = do
          print $ hdrSeconds p  
          print $ hdrCaptureLength p
          print $ hdrWireLength p
          print q 
          callfun f
      | otherwise = do
          return ()
