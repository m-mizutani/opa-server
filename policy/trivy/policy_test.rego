package trivy

test_vuln_deny_list {
    not _test_vuln_deny_list
}

_test_vuln_deny_list {
    tests := [
        {
            "title": "Should pass without critical vuln",
            "input": data.trivy.testdata.vuln_deny_list.pass,
            "exp": set(),
        },
        {
            "title": "Should fail with specified critical vuln",
            "input": data.trivy.testdata.vuln_deny_list.fail,
            "exp": {
                "GHSA-g2q5-5433-rhrf is really critical, prohibited to deploy"
            },
        },
    ]

    t := tests[_]
    got := fail with input as t.input
    t.exp != got
    print(sprintf("Test '%s' is failed. Expected '%v', but got '%v'", [t.title, t.exp, got]))
}
