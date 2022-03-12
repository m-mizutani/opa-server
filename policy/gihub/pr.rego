package github.notify

notify[msg] {
    input.name == "pull_request"
    input.event.action == "opened"
    msg := {
        "channel": "#github-notify",
        "text": "New Pull Request",
        "body": input.event.pull_request.body,
    }
}

notify[msg] {
    input.name == "pull_request"
    input.event.action == "opened"
    not input.event.pull_request.body
    msg := {
        "channel": "#github-notify",
        "text": "New Pull Request (empty body)",
    }
}
