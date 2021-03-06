#!/bin/bash

set -e

export TAR_FILE=`conda build conda/recipes/blazingsql-dev/ --python=$PYTHON --output`

LABEL_OPTION="--label main --label cuda"$CUDA_VER
echo "LABEL_OPTION=${LABEL_OPTION}"

if [ -z "$MY_UPLOAD_KEY" ]; then
    echo "No upload key"
    return 0
fi

test -e ${TAR_FILE}
echo "Upload pyblazing"
echo ${TAR_FILE}

anaconda -t ${MY_UPLOAD_KEY} upload -u ${CONDA_UPLOAD} ${LABEL_OPTION} --force ${TAR_FILE}

