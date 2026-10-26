"""Check the IG search page for the malformed tags reported in QA."""

from html.parser import HTMLParser
from pathlib import Path
import sys


class TagBalance(HTMLParser):
    void_tags = {"area", "base", "br", "col", "embed", "hr", "img", "input", "link", "meta", "param", "source", "track", "wbr"}

    def __init__(self):
        super().__init__()
        self.stack = []
        self.problems = []

    def handle_starttag(self, tag, attrs):
        if tag == "main":
            self.problems.append((self.getpos()[0], "Publisher rejects <main>"))
        if tag in self.void_tags:
            if not self.get_starttag_text().rstrip().endswith("/>"):
                self.problems.append((self.getpos()[0], f"non-self-closing <{tag}>"))
        else:
            self.stack.append((tag, self.getpos()[0]))

    def handle_startendtag(self, tag, attrs):
        pass

    def handle_endtag(self, tag):
        if self.stack and self.stack[-1][0] == tag:
            self.stack.pop()
        else:
            self.problems.append((self.getpos()[0], f"unexpected </{tag}>"))


path = Path("rehabig/content/searchform.html")
if not path.exists():
    path = Path("template/content/searchform.html")
if "--rendered" in sys.argv:
    path = Path("output/searchform.html")

parser = TagBalance()
parser.feed(path.read_text(encoding="utf-8"))
parser.problems.extend((line, f"unclosed <{tag}>") for tag, line in parser.stack)
for line, message in parser.problems:
    print(f"{path}:{line}: {message}")
if parser.problems:
    sys.exit(1)
print(f"{path}: tags balanced")
