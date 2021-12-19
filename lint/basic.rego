package regolint

# Check file path
fail[msg] {
    file := input.files[_]
    count(file.path) <= 1
    msg := sprintf("%s: .rego file at top level is not allowed", [concat("/", file.path)])
}
