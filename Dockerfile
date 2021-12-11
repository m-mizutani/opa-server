FROM openpolicyagent/opa:0.34.2-rootless

COPY policy /policy
COPY config.yml /

ENTRYPOINT [ \
    "/opa", "run", "-s", \
    "-c", "config.yml", \
    "--authorization",  "basic", \
    "--ignore", "testdata", \
    "/policy" \
]