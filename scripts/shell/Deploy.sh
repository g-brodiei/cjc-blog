#!/bin/bash

if [ "$PROD_ENVIRONMENT" = true ]; then
  echo "Ready to deploy, this is production site"
  cd /app

  # Wait for the database connection
  echo "Waiting for database connection..."
  /app/scripts/shell/wait-for-it.sh -t 60 clenrzrww0022qy9bvkq44on6:3306 || exit 1
  echo "Database connection established."

  # Run the deploy command
  if command -v drush >/dev/null 2>&1; then
    echo "Drush is installed, running deploy script..."
    cd /app
    drush deploy -vvv -y
  else
    echo "Drush is not installed, please install it and try again."
  fi

else
  echo "Not a production environment, skipping deployment."
fi
