#!/bin/sh
set -e
source /venv/bin/activate

if [[ ! -z "${EXTRA_PACKAGES}" ]]; then
    echo "${EXTRA_PACKAGES}"
    echo "Ensuring extra packages are installed: ${EXTRA_PACKAGES}"
    pip install ${EXTRA_PACKAGES}
fi

if [ ! -f ./conf.py ]; then
    echo "== Sphinx docs is not initialized =="
    echo " - Map a volume to /docs to work on existing documentaiton"
    echo " - Run sphinx-quickstart to create a new set of documentation"
    tail -F /dev/null
fi
exec sphinx-autobuild . _build_html -H 0.0.0.0 --poll
