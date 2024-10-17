#!/bin/bash

# Set the repository URL
REPO_URL="https://github.com/OpenAsar/arrpc.git"

# Clone the repository if it doesn't exist
if [ ! -d "arrpc" ]; then
  echo "Cloning arrpc repository..."
  git clone $REPO_URL
else
  echo "Repository already cloned."
fi

# Navigate to the repository folder
cd arrpc || exit

# Install pkg globally if not already installed
echo "Installing pkg..."
npm install -g pkg

# Install project dependencies
echo "Installing project dependencies..."
npm install

# Check for vulnerabilities and fix them
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
