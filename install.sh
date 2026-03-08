#!/bin/bash
BIN_DIR="$HOME/bin"
MAN_DIR="$HOME/.local/share/man/man1"
TLDR_DIR="$HOME/.local/share/tldr/pages/common"
REPO_DIR=$(dirname "$0")

echo "Installing CppTest..."
mkdir -p "$BIN_DIR" "$MAN_DIR" "$TLDR_DIR"

cp "$REPO_DIR/cpptest" "$BIN_DIR/"
cp "$REPO_DIR/uncpptest" "$BIN_DIR/"
cp "$REPO_DIR/cpptest.1" "$MAN_DIR/"
cp "$REPO_DIR/cpptest.md" "$TLDR_DIR/" 2>/dev/null || true

chmod +x "$BIN_DIR/cpptest" "$BIN_DIR/uncpptest"

if ! grep -q 'export PATH="$HOME/bin:$PATH"' "$HOME/.bashrc"; then echo 'export PATH="$HOME/bin:$PATH"' >> "$HOME/.bashrc"; fi
if ! grep -q 'export MANPATH="$HOME/.local/share/man:$MANPATH"' "$HOME/.bashrc"; then echo 'export MANPATH="$HOME/.local/share/man:$MANPATH"' >> "$HOME/.bashrc"; fi

echo "Done! Run 'tldr --update' to see the new page."
echo "Please restart terminal."
