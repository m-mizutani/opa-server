package system.authz

default allow = false

# https://www.openpolicyagent.org/docs/latest/security/#:~:text=OPA%20provides%20the%20following%20input%20document%20when%20executing%20the%20authorization%20policy%3A

allow {
    allowed_method
    allowed_path
}

# Check method
allowed_method {
    input.method == "GET"
}
allowed_method {
    input.method == "POST"
}

# Check path
allowed_path {
    input.path[0] == "v1"
    input.path[1] == "data"
}