FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y \
    aspell \
    && rm -rf /var/lib/apt/lists/*

COPY spellcheck.sh /spellcheck.sh
RUN chmod +x /spellcheck.sh  # ✅ Important line

WORKDIR /workspace

ENTRYPOINT ["/spellcheck.sh"]
