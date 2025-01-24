#!/bin/bash

set -e
set -x  # Enable debugging for detailed output

# Get the directory where the script resides
scriptDirectory="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Adjust the base directory for the search (go one level up from scriptDirectory)
baseDirectory="${scriptDirectory}/.."

# Search for all pubspec.yaml files in the base directory
for pubspec in $(find "${baseDirectory}" -maxdepth 1 -name pubspec.yaml | sort); do
    projectDir=$(dirname "${pubspec}")
    echo "Processing project: ${projectDir}"

    (
        cd "${projectDir}"

        # Show outdated dependencies
        echo "Checking outdated dependencies in ${projectDir}:"
        flutter pub outdated || echo "No outdated dependencies found in ${projectDir}."

        # Upgrade dependencies
        echo "Upgrading dependencies in ${projectDir}:"
        dart pub upgrade --major-versions || echo "Failed to upgrade dependencies in ${projectDir}."

        # Apply changes
        echo "Applying changes in ${projectDir}:"
        flutter pub get || echo "Failed to apply changes in ${projectDir}."

        echo "Completed processing ${projectDir}."
    )
done
