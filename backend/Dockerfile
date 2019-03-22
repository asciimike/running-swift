FROM swift:latest

WORKDIR /build
COPY Sources ./Sources
COPY Package.swift .

RUN swift package clean
RUN swift build -c release

RUN mkdir /build/bin
RUN mv `swift build -c release --show-bin-path` /build/bin

EXPOSE 8080

ENTRYPOINT ./bin/release/Server
