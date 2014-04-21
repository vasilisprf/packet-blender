import Network.Pcap
import System.IO
import Control.Monad
import System.Environment(getArgs)
import PacketBlender.Doodad 

main = do
    args <- getArgs
    f <- openOffline $ args !! 0
    callfun f 
