#!/bin/bash
echo "Hello from inside a Docker container!"
echo "Hostname: $(hostname)"
echo "Date: $(date)"
while true; do
  echo "App is running..."
  sleep 5
done
