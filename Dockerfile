FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y \
    aspell \
    && rm -rf /var/lib/apt/lists/*

COPY spellcheck.sh /spellcheck.sh
WORKDIR /workspace

ENTRYPOINT ["/spellcheck.sh"]
