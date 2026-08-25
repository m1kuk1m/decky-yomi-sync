#!/usr/bin/env bash
set -e

PLUGIN_NAME="decky-yomi-sync"
REPO="m1kuk1m/decky-yomi-sync"
PLUGINS_DIR="${HOME}/homebrew/plugins"
TEMP_ZIP="/tmp/${PLUGIN_NAME}.zip"

echo "=== Installing YomiDeck (decky-yomi-sync) ==="

mkdir -p "${PLUGINS_DIR}"

LATEST_RELEASE_URL=$(curl -s "https://api.github.com/repos/${REPO}/releases/latest" | grep "browser_download_url.*${PLUGIN_NAME}.zip" | cut -d : -f 2,3 | tr -d \")

if [ -z "${LATEST_RELEASE_URL}" ]; then
    echo "Fallback to default release URL..."
    LATEST_RELEASE_URL="https://github.com/${REPO}/releases/latest/download/${PLUGIN_NAME}.zip"
fi

echo "Downloading from: ${LATEST_RELEASE_URL}"
curl -L "${LATEST_RELEASE_URL}" -o "${TEMP_ZIP}"

echo "Extracting to ${PLUGINS_DIR}..."
unzip -o "${TEMP_ZIP}" -d "${PLUGINS_DIR}/"
rm -f "${TEMP_ZIP}"

echo "=== YomiDeck installed successfully! Please reload Decky Loader or restart Steam. ==="
