#!/bin/bash

# Install pkg globally if not already installed
echo "Installing pkg..."
npm install -g pkg

# Install project dependencies
echo "Installing project dependencies..."
npm install

# Check for vulnerabilities
echo "Checking for vulnerabilities..."
npm audit fix

# Generate the Windows executable using pkg
echo "Generating arrpc.exe..."
pkg src/index.js --targets node18-win-x64 --output arrpc.exe

# Check if the executable was created
if [ -f "arrpc.exe" ]; then
    echo "Executable arrpc.exe created successfully!"
else
    echo "Failed to create the executable."
fi
