#!/bin/bash

if [ ! -f ".adminer_installed" ]; then
    wget "https://github.com/vrana/adminer/releases/download/v${ADMINER_VERSION}/adminer-${ADMINER_VERSION}.php" -O index.php
    touch .adminer_installed
else
    echo "=> Adminer already installed"
fi

exec "$@"