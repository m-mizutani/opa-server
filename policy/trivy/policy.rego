package trivy

vuln_deny_list = [
    "GHSA-g2q5-5433-rhrf", # npm: prc
    "GHSA-73qr-pfmq-6rp8", # npm: coa
]

fail[msg] {
    vuln := input.Results[_].Vulnerabilities[_]
    vuln.VulnerabilityID == vuln_deny_list[_]
    msg := sprintf("%s is really critical, prohibited to deploy", [vuln.VulnerabilityID])
}
