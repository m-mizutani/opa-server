FROM openpolicyagent/opa:0.35.0-rootless

COPY policy /policy
COPY config.yml /

ENTRYPOINT [ \
    "/opa", "run", "-s", \
    "-c", "config.yml", \
    "--authorization",  "basic", \
    "--ignore", "testdata", \
    "--ignore", "*_test.rego", \
    "/policy" \
]
