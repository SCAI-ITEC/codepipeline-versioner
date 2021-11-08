#!/bin/bash

sam validate && \
sam build --cached && \
sam package --s3-bucket $CF_BUCKET --output-template-file packaged.yaml --s3-prefix ${REPO_PATH}${PACKAGE_NAME}-${VERSION} \
  && aws s3 cp packaged.yaml s3://${CF_BUCKET}/${REPO_PATH}${PACKAGE_NAME}-${VERSION}/
