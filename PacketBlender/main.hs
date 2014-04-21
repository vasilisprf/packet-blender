import Network.Pcap
import System.IO
import Control.Monad
import System.Environment(getArgs)
import PacketBlender.Doodad


mainLoop device = do
    -- listen for 10000 bytes of samples over 10ms in promiscuous mode
    f <- openLive device 10000 True 10000
    callfun f
    mainLoop device

main = do
    -- the one and only argument is the name of the interface
    args <- getArgs
    mainLoop $ args !! 0
