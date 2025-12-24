#!/bin/bash

# Tickets CAD - Docker Startup Script for Snap Docker

echo "🚀 Starting Tickets CAD Development Environment..."

# Check if running with Snap Docker
if pgrep -f "snap.docker" > /dev/null; then
    echo "✅ Snap Docker detected"
else
    echo "❌ Docker daemon not running. Please start Docker first."
    exit 1
fi

# For Snap Docker, we need to use sudo for all docker commands
echo "📦 Building Docker containers..."
sudo docker-compose build --no-cache

echo "🚀 Starting containers..."
sudo docker-compose up -d

# Wait for containers to be ready
echo "⏳ Waiting for containers to start..."
sleep 10

# Check if containers are running
if sudo docker-compose ps | grep -q "Up"; then
    echo "✅ Containers are running!"
    echo ""
    echo "🌐 Access the application at: http://localhost:8080"
    echo "🗄️  Access PhpMyAdmin at: http://localhost:8081"
    echo "📊 Access database at: localhost:3306"
    echo ""
    echo "💡 Installation URL: http://localhost:8080/install.php"
    echo ""
    echo "📋 Database credentials:"
    echo "   Host: db"
    echo "   Database: tickets_db"
    echo "   User: tickets_user"
    echo "   Password: tickets_password"
    echo ""
    echo "📝 To view logs: sudo docker-compose logs -f"
    echo "🛑 To stop: sudo docker-compose down"
else
    echo "❌ Failed to start containers. Check logs with: sudo docker-compose logs"
fi