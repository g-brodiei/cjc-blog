#!/bin/bash

if [ "$PROD_ENVIRONMENT" = true ]; then
  echo "Ready to deploy, this is production site"
  if command -v drush >/dev/null 2>&1; then
    echo "Drush is installed, running deploy script..."
    drush deploy -vvv -y
  else
    echo "Drush is not installed, please install it and try again."
  fi
else
  echo "Not a production environment, skipping deployment."
fi
