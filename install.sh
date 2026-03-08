#!/bin/bash

REPO_RAW="https://raw.githubusercontent.com/MootSasa/CppTest/main"

BIN_DIR="$HOME/bin"
MAN_DIR="$HOME/.local/share/man/man1"
TLDR_DIR="$HOME/.local/share/tldr/pages/common"

echo "Installing CppTest..."

mkdir -p "$BIN_DIR" "$MAN_DIR" "$TLDR_DIR"

echo "Downloading files..."
curl -fsSL "$REPO_RAW/cpptest" -o "$BIN_DIR/cpptest"
curl -fsSL "$REPO_RAW/uncpptest" -o "$BIN_DIR/uncpptest"
curl -fsSL "$REPO_RAW/cpptest.1" -o "$MAN_DIR/cpptest.1"
curl -fsSL "$REPO_RAW/cpptest.md" -o "$TLDR_DIR/cpptest.md" 2>/dev/null || true

chmod +x "$BIN_DIR/cpptest" "$BIN_DIR/uncpptest"

if ! grep -q 'export PATH="$HOME/bin:$PATH"' "$HOME/.bashrc"; then
    echo 'export PATH="$HOME/bin:$PATH"' >> "$HOME/.bashrc"
fi
if ! grep -q 'export MANPATH="$HOME/.local/share/man:$MANPATH"' "$HOME/.bashrc"; then
    echo 'export MANPATH="$HOME/.local/share/man:$MANPATH"' >> "$HOME/.bashrc"
fi

echo "Done! Please restart your terminal or run: source ~/.bashrc"
