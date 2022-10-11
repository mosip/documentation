# Functional Test Report

## Scope and Objective
Verifying the LTS bug fixes and performing regression for the same.

## Testing tools
* Manual testing for bug validation.
* DSL automation/ API test rig: Java, Selenium

## Test deliverables
* Test report with results
* Feature health report

## Verified Configuration
* Tested in environments supporting 2 languages: Eng, Ara
* Features tested on V2 as well as V3 console

## Functional test results by modules

Below are the test metrics by performing functional tests:

| Total | Passed | Failed | Skipped |
|-------|--------|--------|---------|
| 690   | 632    | 50     |  8      |

### Tests execution for bugs verification and sanity testing

|  Module     | Total | Passed | Failed | Skipped |
|-------------|-------|--------|--------|---------|
| Pre-Reg    |   70    | 63       | 6       | 1        |
| Reg Client |    107   |    99    |     8   |    0     |
| Reg proc    |  143     |   138     |    5    |    0     |
| Resident    |   85    |     77  |     8   |        0 |
| Admin       |   114   | 90       | 17       |     7  |
|   IDA       |  122     |   117     |   5     |    0     |
|   PMS       |    49   |   48     |    1    |       0  |

### API Test Automation Metrics

|  Module     | Total | Passed | Failed | Skipped |
|-------------|-------|--------|--------|---------|
| Pre-Reg    | 212    | 205       | 7   | 0        |
| Resident   | 306    |   279     |  27     |  0       |
| Admin   | 903    |   897     |    6   |        0 |
| IDA  |  358   |  354      |   4    |     0    |
| PMS   | 457    |   456     |    1   |    0     |

_Note_: The number of failed test cases is cumulative of issues in released software as well the issues in the test automation scripts.


