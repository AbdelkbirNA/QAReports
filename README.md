# QAReports — API & UI test automation with a CI/CD pipeline

A test automation framework built from scratch: Robot Framework drives both the
API and browser layers, Docker makes runs reproducible, Jenkins orchestrates
them, and Allure turns the result into a report someone who didn't write the
tests can read.

**[View the latest test report →](https://abdelkbirna.github.io/QAReports/report.html)**

## What's here

| Path | What it is |
|---|---|
| `api_tests/` | API test suites and their resource files |
| `ui_tests/` | Browser test suites (Selenium via SeleniumLibrary) |
| `Jenkinsfile` | Pipeline: checkout → prepare → run in Docker → publish Allure |
| `Dockerfile` | Test runner image |
| `Dockerfile.allure` | Allure report generator |
| `docker-compose.yml` | Runs the suite and the report service together |
| `report.html`, `log.html`, `output.xml` | Robot Framework output from the last run |
| `output/` | Allure results and generated reports |

## Stack

Robot Framework 7.0 · SeleniumLibrary 6.3 · RequestsLibrary 0.9.5 ·
Selenium 4.18 · Docker · Jenkins · Allure

## Running it

```bash
pip install -r requirements.txt
robot --outputdir output/robot api_tests/tests ui_tests/tests
```

Or containerised, which is how CI runs it:

```bash
docker compose up --build
```

## Why it's built this way

The point wasn't to write tests — it was to make the answer to *"is this build
safe?"* one command long. Docker means the suite behaves the same on a laptop
and on the Jenkins agent. Allure means a failure arrives as a readable report
with history, not a wall of console output.

---

Built by [Abdelkbir Nainiaa](https://qa.abdelkbirnainiaa.me) — QA Automation Engineer
