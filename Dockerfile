FROM joedwards32/cs2

USER root
RUN apt-get update && apt-get install -y \
    libcurl4 \
    curl \
    && rm -rf /var/lib/apt/lists/*

USER steam
