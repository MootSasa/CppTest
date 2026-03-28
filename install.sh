#!/bin/bash

REPO_RAW="https://raw.githubusercontent.com/MootSasa/CppTest/main"

BIN_DIR="$HOME/bin"
MAN_DIR="$HOME/.local/share/man/man1"
PROMPTS_DIR="$HOME/.config/cpptest/prompts"
COMPLETION_DIR="$HOME/.zsh/completion"

TLDR_DIR_1="$HOME/.local/share/tldr/pages/common"
TLDR_DIR_2="$HOME/.local/share/tealdeer/pages/custom"
TLDR_DIR_3="$HOME/.tldr/pages/common"

echo "Installing CppTest..."

mkdir -p "$BIN_DIR" "$MAN_DIR" "$PROMPTS_DIR" "$TLDR_DIR_1" "$TLDR_DIR_2" "$TLDR_DIR_3"

echo "Downloading core files..."
curl -fsSL "$REPO_RAW/cpptest" -o "$BIN_DIR/cpptest"
curl -fsSL "$REPO_RAW/uncpptest" -o "$BIN_DIR/uncpptest"
curl -fsSL "$REPO_RAW/cpptest.1" -o "$MAN_DIR/cpptest.1"

echo "Downloading tldr page..."
curl -fsSL "$REPO_RAW/cpptest.md" -o "/tmp/cpptest.md" 2>/dev/null || true
if [ -f "/tmp/cpptest.md" ]; then
    cp "/tmp/cpptest.md" "$TLDR_DIR_1/"
    cp "/tmp/cpptest.md" "$TLDR_DIR_2/"
    cp "/tmp/cpptest.md" "$TLDR_DIR_3/"
    rm -f "/tmp/cpptest.md"
fi

echo "Downloading AI prompts..."
curl -fsSL "$REPO_RAW/prompts/standard.json" -o "$PROMPTS_DIR/standard.json"
curl -fsSL "$REPO_RAW/prompts/interactive.json" -o "$PROMPTS_DIR/interactive.json"

echo "Installing zsh completion..."
mkdir -p "$COMPLETION_DIR"
curl -fsSL "$REPO_RAW/_cpptest" -o "$COMPLETION_DIR/_cpptest"

chmod +x "$BIN_DIR/cpptest" "$BIN_DIR/uncpptest"

if ! grep -q 'export PATH="$HOME/bin:$PATH"' "$HOME/.bashrc"; then echo 'export PATH="$HOME/bin:$PATH"' >> "$HOME/.bashrc"; fi
if ! grep -q 'export MANPATH="$HOME/.local/share/man:$MANPATH"' "$HOME/.bashrc"; then echo 'export MANPATH="$HOME/.local/share/man:$MANPATH"' >> "$HOME/.bashrc"; fi

# Setup zsh completion
if [ -z "$ZSH_VERSION" ]; then
  # For bash users, suggest they add completion to their zshrc if they use zsh
  echo ""
  echo "Для автодополнения в zsh добавьте следующие строки в ваш ~/.zshrc:"
  echo "  fpath+=~/.zsh/completion"
  echo "  autoload -Uz compinit"
  echo "  compinit"
  echo "  compdef _cpptest cpptest"
else
  # For zsh, setup completion now
  fpath+=~/.zsh/completion
  autoload -Uz compinit
  compinit
  compdef _cpptest cpptest
fi

echo "Done! Please restart your terminal."
