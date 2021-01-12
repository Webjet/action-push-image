#!/bin/sh

## FUNCTION
sanitize() {
  if [ -z "${1}" ]; then
    >&2 echo "Unable to find the ${2}. Did you set with.${2}?"
    exit 1
  fi
}

#### MAIN
main(){

    sanitize "${INPUT_IMAGENAME}" "Image Name"
    sanitize "${INPUT_REPOSITORY}" "REGISTRY SUBPATH"

    PUSH_BODY="${INPUT_REGISTRY}/${INPUT_REPOSITORY}/${INPUT_IMAGENAME}:${INPUT_TAG}"
    echo "[INFO] PUSH IMAGE : docker push ${PUSH_BODY}"
    docker push ${PUSH_BODY}
    
}


main
