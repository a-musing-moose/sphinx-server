#!/bin/sh
set -e
source /venv/bin/activate

if [[ ! -z "${EXTRA_APK}" ]]; then
    echo "Ensuring extra alpine packages are installed: ${EXTRA_APK}"
    apk add --no-cache ${EXTRA_APK}
fi

if [[ ! -z "${EXTRA_EDGE_APK}" ]]; then
    echo "Ensuring extra alpine packages are installed: ${EXTRA_EDGE_APK}"
    apk add --no-cache \
        --repository http://dl-cdn.alpinelinux.org/alpine/edge/main \
        --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing \
        ${EXTRA_EDGE_APK}
fi

if [[ ! -z "${EXTRA_PACKAGES}" ]]; then
    echo "Ensuring extra packages are installed: ${EXTRA_PACKAGES}"
    pip install -U pip
    pip install ${EXTRA_PACKAGES}
fi

if [ ! -f ./conf.py ]; then
    echo "== Sphinx docs is not initialized =="
    echo " - Map a volume to /docs to work on existing documentaiton"
    echo " - Run sphinx-quickstart to create a new set of documentation"
    tail -F /dev/null
fi
exec sphinx-autobuild . _build_html -H 0.0.0.0 --poll
