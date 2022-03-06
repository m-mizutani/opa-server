package github.notify

notify[msg] {
    input.name == "issues"
    input.event.action == "opened"
    msg := {
        "channel": "#github-notify",
        "text": "New issue",
        "body": input.event.issue.body,
    }
}
