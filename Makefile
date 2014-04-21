LIBS=PacketBlender/Doodad.hs
MAIN_OPTS=-hidir tmp/main -odir tmp/main
TEST_OPTS=-hidir tmp/test -odir tmp/test

all: bin/main

# binaries
bin/main: PacketBlender/main.hs $(LIBS)
	mkdir -p bin
	ghc PacketBlender/main.hs -o bin/main $(MAIN_OPTS)

bin/test: PacketBlender/test.hs $(LIBS)
	mkdir -p bin
	ghc PacketBlender/test.hs -o bin/test $(TEST_OPTS)

# actions

setup:
	cabal update
	cabal install pcap

# run this as root
run: bin/main
	./bin/main any

test: bin/test
	./bin/test tests/testdata.pcap

.PHONY: clean

clean:
	rm -rf bin/main bin/test tmp/*

gettestdata:
	sudo tcpdump -i enp2s0 -w tests/testdata.pcap
