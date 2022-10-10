FROM bitnami/minideb:latest
RUN apt update; apt -y install git g++ make curl 
RUN git clone https://github.com/official-stockfish/Stockfish.git
WORKDIR /Stockfish/src
RUN make net
RUN make build ARCH=x86-64-modern
FROM bitnami/minideb:latest
COPY --from=0 /Stockfish/src/stockfish ./
COPY --from=0 /Stockfish/src/*.nnue ./