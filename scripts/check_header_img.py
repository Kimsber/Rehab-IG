"""Check that void images in the IG header are XML-compatible."""

from html.parser import HTMLParser
from pathlib import Path
import sys


class ImageTags(HTMLParser):
    def __init__(self):
        super().__init__()
        self.unclosed = []

    def handle_starttag(self, tag, attrs):
        if tag == "img":
            self.unclosed.append((self.getpos()[0], self.get_starttag_text()))

    def handle_startendtag(self, tag, attrs):
        pass


paths = [Path("rehabig/includes/fragment-header.html")]
generated_template = Path("template/includes/fragment-header.html")
if generated_template.exists():
    paths.append(generated_template)
if "--rendered" in sys.argv:
    paths.append(Path("output/Bundle-ChildBundle.html"))

failed = False
for path in paths:
    parser = ImageTags()
    parser.feed(path.read_text(encoding="utf-8"))
    for line, tag in parser.unclosed:
        print(f"{path}:{line}: non-self-closing image: {tag}")
        failed = True

if failed:
    sys.exit(1)
print("Header image tags are self-closing")
