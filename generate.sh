#!/bin/bash

# Set variables for file paths
OPENAPI_FILE="../onrampfunds/app/models/partner/api/openapi.yml"
OUTPUT_FILE="index.html"

# Check if the OpenAPI file exists
if [ ! -f "$OPENAPI_FILE" ]; then
  echo "Error: OpenAPI file not found at $OPENAPI_FILE"
  exit 1
fi

# Generate the documentation
echo "Generating documentation from $OPENAPI_FILE..."
npx @redocly/cli build-docs "$OPENAPI_FILE" --output "$OUTPUT_FILE"

# Check if the output file was created
if [ -f "$OUTPUT_FILE" ]; then
  echo "Documentation generated successfully: $OUTPUT_FILE"
else
  echo "Error: Failed to generate documentation."
  exit 1
fi
