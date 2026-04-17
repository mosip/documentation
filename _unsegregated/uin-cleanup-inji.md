# Dummy/Mock UIN Scan Report

Generated: 2026-04-16 11:43:57 IST

## Quick Run (rg)

```bash
cd /Users/keshavsingh/Office/mosipiodocs/mosipiodocs && dirs=(); for d in docs _unsegregated unsegregated; do [ -d "$d" ] && dirs+=("$d"); done; rg -n -i --hidden --no-ignore --glob '**/*.{md,json,yml,yaml,properties}' --glob '!_unsegregated/uin-dummy-report.md' --glob '!_unsegregated/uin-cleanup-inji.md' '(dummy|mock|sample|test).{0,40}\b(uin|vid)\b|\b(uin|vid)\b.{0,40}(dummy|mock|sample|test)|"?(uin|vid)"?\s*[:=]\s*"?[0-9]{8,16}"?|\buin\b.{0,30}[0-9]{8,16}|[0-9]{8,16}.{0,30}\buin\b' "${dirs[@]}" | rg -i -v 'expiry|millisec|maximum|maxItems|minvalue|maxvalue|nano|timestamp|phone|contactNumber|image-|roadmap|sequence|storage|vcpu|ram|jira|issue|release|lastUpdated|refreshRate|readlimit|policy|qr-code-specification|version|zip|packet|tmp/' | sort -u
```

## Command to generate this report
```bash
cd /Users/keshavsingh/Office/mosipiodocs/mosipiodocs && {
  echo "# Dummy/Mock UIN Scan Report";
  echo "";
  echo "Generated: $(date '+%Y-%m-%d %H:%M:%S %Z')";
  echo "";
  echo "## Matches";
  dirs=();
  for d in docs _unsegregated unsegregated; do
    [ -d "$d" ] && dirs+=("$d");
  done;
  if command -v rg >/dev/null 2>&1; then
    rg -n -i --hidden --no-ignore \
      --glob '**/*.{md,json,yml,yaml,properties}' \
      --glob '!_unsegregated/uin-dummy-report.md' \
      --glob '!_unsegregated/uin-cleanup-inji.md' \
      '(dummy|mock|sample|test).{0,40}\b(uin|vid)\b|\b(uin|vid)\b.{0,40}(dummy|mock|sample|test)|"?(uin|vid)"?\s*[:=]\s*"?[0-9]{8,16}"?|\buin\b.{0,30}[0-9]{8,16}|[0-9]{8,16}.{0,30}\buin\b' \
      "${dirs[@]}" |
    rg -i -v 'expiry|millisec|maximum|maxItems|minvalue|maxvalue|nano|timestamp|phone|contactNumber|image-|roadmap|sequence|storage|vcpu|ram|jira|issue|release|lastUpdated|refreshRate|readlimit|policy|qr-code-specification|version|zip|packet|tmp/' |
    sort -u;
  else
    find "${dirs[@]}" -type f \
      \( -name '*.md' -o -name '*.json' -o -name '*.yml' -o -name '*.yaml' -o -name '*.properties' \) -print0 |
    xargs -0 grep -nEi '(dummy|mock|sample|test).{0,40}\b(uin|vid)\b|\b(uin|vid)\b.{0,40}(dummy|mock|sample|test)|"?(uin|vid)"?[[:space:]]*[:=][[:space:]]*"?[0-9]{8,16}"?|\buin\b.{0,30}[0-9]{8,16}|[0-9]{8,16}.{0,30}\buin\b' |
    grep -Eiv 'expiry|millisec|maximum|maxitems|minvalue|maxvalue|nano|timestamp|phone|contactNumber|image-|roadmap|sequence|storage|vcpu|ram|jira|issue|release|lastUpdated|refreshRate|readlimit|policy|qr-code-specification|version|zip|packet|tmp/' |
    grep -Eiv '^_unsegregated/(uin-dummy-report.md|uin-cleanup-inji.md):' |
    sort -u;
  fi
} > _unsegregated/uin-dummy-report.md
```



## Matches
docs/_files/id-authentication-config-files/id-authentication-default.properties:369:## For example if UIN is 1234567890 and mask count is 6, masked UIN will be: XXXXXX7890
docs/id-lifecycle-management/supporting-components/commons/id-generator.md:20:* Number of digits to check for reverse digits group limit, as specified in `mosip.kernel.uin.length.reverse-digits-limit` configuration. For example if limit is 5 and UIN is 4345665434, then first 5 digits will be 43456, reverse 65434.
docs/id-lifecycle-management/supporting-components/commons/id-generator.md:21:* Number of digits to check for digits group limit in id, as specified in `mosip.kernel.uin.length.digits-limit` configuration. For example if limit is 5 and UIN is 4345643456, then 5 digits group will be 43456.
docs/interoperability/integrations/mosip-token-seeder/mts-developer-guides/mosip-token-seeder-api-1.md:166:    "vid": "456564345214",
docs/interoperability/integrations/mosip-token-seeder/mts-developer-guides/mosip-token-seeder-api-1.md:213:    "vid": "456564345214",
docs/interoperability/integrations/print-service/verified-credentials.md:37:    "VID": "5429581983246107",
docs/interoperability/integrations/print-service/verified-credentials.md:48:    "UIN": "2178026904",
docs/interoperability/integrations/test/old/_crvs-docs-observation.md:314:  "uin": "1234567890",
docs/verified-credentials.md:37:    "VID": "5429581983246107",
docs/verified-credentials.md:48:    "UIN": "2178026904",


## Harvested IDs (Strict Key-Value)

### UIN

- 1234567890
- 2178026904

### VID

- 456564345214
- 5429581983246107

### Additional UIN values found in sentence-style examples:

4345643456
4345665434



## Approach Used

1. Scope the scan to documentation/helper folders only (`docs`, `_unsegregated`, `unsegregated`) to avoid unrelated source artifacts.
2. Restrict file types to text formats where UIN/VID examples usually exist (`.md`, `.json`, `.yml`, `.yaml`, `.properties`).
3. Run an `rg`-first search (with `grep` fallback if `rg` is unavailable):
   - detect `dummy/mock/sample/test` near `UIN` or `VID`.
   - detect explicit key-value patterns such as `UIN: 123...` or `"VID": "123..."`.
   - detect proximity patterns where `UIN` appears near long numeric tokens.
4. Apply a noise-filter pass to remove common false-positive lines (timestamps, cache-expiry values, max limits, roadmap tables, phone-like fields, etc.).
5. Exclude this report file from matching to avoid self-reference loops.
6. Sort and de-duplicate (`sort -u`) so repeated hits from duplicated content blocks collapse to unique lines.
7. Persist output into this markdown file for repeatable scans and easy review.

### Notes

- This is a heuristic scan, so results are "likely candidates" and may include valid examples used for docs illustrations.
- Current run parity check: `rg` and `grep` produced the same candidate set (10 matches).
- If you want stricter output, keep only lines that include the words `dummy`, `mock`, `sample`, or `test` and remove generic numeric-UIN proximity patterns.
