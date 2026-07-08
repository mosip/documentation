import re
import sys
import os

LABELS = {
    "info":    "ℹ️  Note",
    "warning": "⚠️  Warning",
    "danger":  "❗  Important",
    "success": "✅  Tip",
}

def convert_hints(text):
    pattern = re.compile(
        r'\{%\s*hint\s+style="(\w+)"\s*%\}(.*?)\{%\s*endhint\s*%\}',
        re.DOTALL
    )
    def replace(m):
        label = LABELS.get(m.group(1), m.group(1).title())
        body  = m.group(2).strip()
        lines = [f"> {line}" for line in body.splitlines()]
        return f"> **{label}**\n>\n" + "\n".join(lines) + "\n"

    return pattern.sub(replace, text)

def resolve_image_paths(text, file_path):
    """Replace relative image paths with absolute paths so pandoc finds them when piped via stdin."""
    file_dir = os.path.dirname(os.path.abspath(file_path))

    def replace(m):
        alt = m.group(1)
        src = m.group(2)
        if src.startswith(("http://", "https://")) or os.path.isabs(src):
            return m.group(0)
        return f'![{alt}]({os.path.normpath(os.path.join(file_dir, src))})'

    return re.sub(r'!\[([^\]]*)\]\(([^)]+)\)', replace, text)

for path in sys.argv[1:]:
    with open(path) as f:
        content = f.read()
    content = resolve_image_paths(content, path)
    content = convert_hints(content)
    sys.stdout.write(content)
    sys.stdout.write("\n\n")
