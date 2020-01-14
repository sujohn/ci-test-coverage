#!/bin/sh
set -e

if which llvm-cov >/dev/null; then
    echo "[INFO] llvm-cov already available"
    exit
fi

echo "[INFO] installing llvm-cov..."

export HOMEBREW_NO_INSTALL_CLEANUP=1

brew install llvm

if [ -n "$ZSH_VERSION" ]; then
    echo 'export PATH="/usr/local/opt/llvm/bin:$PATH"' >> ~/.zshrc
    source ~/.zshrc
else
    echo 'export PATH="/usr/local/opt/llvm/bin:$PATH"' >> ~/.bash_profile
    source ~/.bash_profile
fi

