#!/bin/bash
BIN_DIR="$HOME/bin"
MAN_DIR="$HOME/.local/share/man/man1"
REPO_DIR=$(dirname "$0")

echo "Installing CppTest..."
mkdir -p "$BIN_DIR"
mkdir -p "$MAN_DIR"

# Копируем файлы из папки репозитория
cp "$REPO_DIR/cpptest" "$BIN_DIR/"
cp "$REPO_DIR/uncpptest" "$BIN_DIR/"
cp "$REPO_DIR/cpptest.1" "$MAN_DIR/"

chmod +x "$BIN_DIR/cpptest"
chmod +x "$BIN_DIR/uncpptest"

if ! grep -q 'export PATH="$HOME/bin:$PATH"' "$HOME/.bashrc"; then
    echo 'export PATH="$HOME/bin:$PATH"' >> "$HOME/.bashrc"
fi
if ! grep -q 'export MANPATH="$HOME/.local/share/man:$MANPATH"' "$HOME/.bashrc"; then
    echo 'export MANPATH="$HOME/.local/share/man:$MANPATH"' >> "$HOME/.bashrc"
fi
echo "Done! Please restart terminal."
