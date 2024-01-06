FROM ubuntu:22.04 AS build

RUN apt-get update && apt-get install -y --no-install-recommends make gcc libaio-dev g++
WORKDIR /src
COPY . .
RUN make STATIC=1

FROM ubuntu:22.04 AS run
COPY --from=build /src/bin/diskspd /usr/bin