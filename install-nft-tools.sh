#!/usr/bin/env bash

# install-nft-tools.sh - Clone, install, or uninstall nft-tools
# Usage: install-nft-tools.sh install|uninstall [repo-url]

set -e

ACTION="$1"
REPO_URL="${2:-https://github.com/Zhuul/nft-tools.git}"
SRC_DIR="/usr/local/src/nft-tools"
CONF_DIR="/etc"
BIN_DIR="/usr/local/bin"

# Backup config file to .bak.TIMESTAMP
backup_conf() {
    local file="$1"
    if [ -f "$file" ]; then
        local ts=$(date +%Y%m%d%H%M%S)
        mv "$file" "${file}.bak.${ts}"
        echo "Backed up $file to ${file}.bak.${ts}"
    fi
}

install_tools() {
    echo "==> Cloning repository into $SRC_DIR"
    if [ -d "$SRC_DIR/.git" ]; then
        git -C "$SRC_DIR" pull
    else
        git clone "$REPO_URL" "$SRC_DIR"
    fi

    echo "==> Installing configuration files"
    for conf in nft-blocklist.conf nft-blockmon.conf; do
        backup_conf "$CONF_DIR/$conf"
        cp "$SRC_DIR/conf/$conf" "$CONF_DIR/$conf"
        echo "Installed $CONF_DIR/$conf"
    done

    echo "==> Installing executables"
    for binfile in nft-blocklist nft-blockmon; do
        cp "$SRC_DIR/bin/$binfile" "$BIN_DIR/$binfile"
        chmod +x "$BIN_DIR/$binfile"
        echo "Installed $BIN_DIR/$binfile"
    done

    echo "==> Running uninstall/install in tools to ensure clean state"
    "$BIN_DIR/nft-blocklist" --uninstall || true
    "$BIN_DIR/nft-blockmon" --uninstall || true
    "$BIN_DIR/nft-blocklist" --install
    "$BIN_DIR/nft-blockmon" --install

    echo "Installation complete."
}

uninstall_tools() {
    echo "==> Uninstalling tools"
    "$BIN_DIR/nft-blocklist" --uninstall || true
    "$BIN_DIR/nft-blockmon" --uninstall || true

    echo "==> Removing executables"
    rm -f "$BIN_DIR/nft-blocklist" "$BIN_DIR/nft-blockmon"

    echo "==> Backing up and removing config files"
    for conf in nft-blocklist.conf nft-blockmon.conf; do
        backup_conf "$CONF_DIR/$conf"
        rm -f "$CONF_DIR/$conf"
        echo "Removed $CONF_DIR/$conf"
    done

    echo "Uninstallation complete."
}

case "$ACTION" in
    install)
        install_tools
        ;;
    uninstall)
        uninstall_tools
        ;;
    *)
        echo "Usage: $0 install|uninstall [repo-url]"
        exit 1
        ;;
esac
