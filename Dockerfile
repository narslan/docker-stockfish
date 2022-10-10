FROM bitnami/minideb:latest
RUN git clone https://github.com/official-stockfish/Stockfish.git
WORKDIR /Stockfish
RUN make net
RUN build ARCH=x86-64-modern
FROM bitnami/minideb:latest  
WORKDIR /Stockfish/
COPY --from=0 /Stockfish ./
