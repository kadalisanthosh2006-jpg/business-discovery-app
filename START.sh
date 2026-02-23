#!/bin/bash

# Quick Start Script for Local Business Discovery App

echo ""
echo "========================================"
echo "Local Business Discovery Web App"
echo "Quick Start Script"
echo "========================================"
echo ""

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "ERROR: Node.js is not installed!"
    echo "Please download and install Node.js from: https://nodejs.org/"
    exit 1
fi

echo "✓ Node.js is installed"
echo ""

# Navigate to backend directory
cd backend

# Install dependencies if node_modules doesn't exist
if [ ! -d "node_modules" ]; then
    echo "Installing backend dependencies..."
    npm install
    echo ""
fi

# Seed the database if it doesn't exist
if [ ! -f "business.db" ]; then
    echo ""
    echo "Seeding database with sample data..."
    node seed.js
    echo ""
fi

# Start the server
echo ""
echo "========================================"
echo "Starting Server..."
echo "========================================"
echo ""
echo "🚀 Server running at: http://localhost:5000"
echo "📱 Open this URL in your browser"
echo ""
echo "Press Ctrl+C to stop the server"
echo ""

node server.js
