#!/usr/bin/env bash

set -Ee

SRC_DIR="$( cd "$(dirname "$(dirname "${BASH_SOURCE[0]}")")"/ && pwd )"
DEPENDS_ON=( klipper )
TARGET_DIR="${HOME}/klipper/klippy/extras"
PKGLIST=""

function run() {
    echo "Installing ADXL345 Probe, please check the docs after installing on how to configure the extension"
    if [ -d "${TARGET_DIR}" ]; then
        echo -n "Linking extension... "
        if ln -sf "${SRC_DIR}/adxl345_probe.py" "${TARGET_DIR}/adxl345_probe.py" &> /dev/null; then
            echo "Installed component"
        else
            echo "Failed installing component"
        fi
    fi
    sudo systemctl restart "klipper.service"
}


run
exit 0
