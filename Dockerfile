FROM joedwards32/cs2

USER root
RUN apt update && apt install -y \
  libcurl4 \
  curl \
  && rm -rf /var/lib/apt/lists/*

USER steam
