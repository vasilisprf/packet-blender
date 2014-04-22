module PacketBlender.Doodad( callfun ) where

import Network.Pcap                                   
import System.IO
import Control.Monad
import Foreign.Ptr
import Data.Word

callfun :: PktHdr -> Ptr Word8 -> IO ()
callfun p q = do
    print $ hdrSeconds p  
    print $ hdrCaptureLength p
    print $ hdrWireLength p
    print q 
