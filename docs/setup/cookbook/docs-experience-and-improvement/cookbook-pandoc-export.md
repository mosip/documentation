# Cookbook → DOCX Export (pandoc)

Run from the project root (`mosipiodocs/`).

```bash
pandoc \
  docs/setup/cookbook/planning.md \
  docs/setup/cookbook/infrastructure-and-requirements.md \
  docs/setup/cookbook/pilot-design.md \
  docs/setup/cookbook/training.md \
  docs/setup/cookbook/platform-readiness.md \
  docs/setup/cookbook/field-operations.md \
  docs/setup/cookbook/authentication-and-credentials.md \
  docs/setup/cookbook/go-live.md \
  docs/setup/cookbook/closure.md \
  docs/setup/cookbook/references.md \
  --from gfm \
  --to docx \
  --toc \
  --toc-depth=3 \
  -o docs/setup/cookbook/mosip-functional-pilot-guide.docx
```

## Flags

| Flag | Purpose |
|---|---|
| `--from gfm` | GitHub Flavored Markdown — ensures pipe tables render correctly |
| `--to docx` | Output format |
| `--toc` | Inserts a Word table of contents at the top |
| `--toc-depth=2` | TOC covers `##` headings (section titles within each page) |
| `-o _temp/mosip-functional-pilot-guide.docx` | Output path |

## File order

Follows the TOC in `docs/summary.md` (lines 272–282).

## Notes

- `{% hint style="info" %}` / `{% endhint %}` GitBook tags pass through as literal text in the docx. To strip them before conversion, pre-process with:

```bash
for f in docs/setup/cookbook/*.md; do
  sed '/^{%/d' "$f"
done | pandoc --from gfm --to docx --toc --toc-depth=2 -o _temp/mosip-functional-pilot-guide.docx
```

- To apply a custom Word style template, add `--reference-doc=your-template.docx`.



## Updated command — with hint rendering and images

Preprocesses `{% hint %}` blocks into blockquotes and resolves relative image paths to absolute before handing off to pandoc. Use this instead of the raw pandoc command above.

```bash
python3 docs/setup/cookbook/preprocess_hints.py \
  docs/setup/cookbook/planning.md \
  docs/setup/cookbook/infrastructure-and-requirements.md \
  docs/setup/cookbook/pilot-design.md \
  docs/setup/cookbook/training.md \
  docs/setup/cookbook/platform-readiness.md \
  docs/setup/cookbook/field-operations.md \
  docs/setup/cookbook/authentication-and-credentials.md \
  docs/setup/cookbook/go-live.md \
  docs/setup/cookbook/closure.md \
  docs/setup/cookbook/references.md \
| pandoc \
  --from gfm \
  --to docx \
  --toc \
  --toc-depth=3 \
  -o docs/setup/cookbook/mosip-functional-pilot-guide.docx
```

### What the preprocessor does

| Feature | Behaviour |
|---|---|
| `{% hint style="info" %}` | Converted to a `> **ℹ️ Note**` blockquote |
| `{% hint style="warning" %}` | Converted to a `> **⚠️ Warning**` blockquote |
| `{% hint style="danger" %}` | Converted to a `> **❗ Important**` blockquote |
| `{% hint style="success" %}` | Converted to a `> **✅ Tip**` blockquote |
| Relative image paths | Resolved to absolute filesystem paths so pandoc embeds images when piped via stdin |
