FROM ubuntu:24.04
WORKDIR /qwfwd
RUN apt-get update && apt-get install -y gettext wget \
  && rm -rf /var/lib/apt/lists/*

COPY files .

RUN wget https://builds.quakeworld.nu/qwfwd/releases/latest/linux/aarch64/qwfwd

RUN mv qwfwd qwfwd.bin && chmod +x qwfwd.bin

COPY scripts/entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]

