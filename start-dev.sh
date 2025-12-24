#!/bin/bash

# Tickets CAD - Docker Startup Script

echo "🚀 Starting Tickets CAD Development Environment..."

# Check if user is in docker group
if ! groups $USER | grep -q docker; then
    echo "⚠️  Adding $USER to docker group..."
    echo "You'll need to enter your password:"
    sudo usermod -aG docker $USER
    echo "✅ Added to docker group. Please run: newgrp docker OR logout and log back in"
    exit 1
fi

# Build and start containers
echo "📦 Building Docker containers..."
docker-compose build --no-cache

echo "🚀 Starting containers..."
docker-compose up -d

# Wait for containers to be ready
echo "⏳ Waiting for containers to start..."
sleep 10

# Check if containers are running
if docker-compose ps | grep -q "Up"; then
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
    echo "📝 To view logs: docker-compose logs -f"
    echo "🛑 To stop: docker-compose down"
else
    echo "❌ Failed to start containers. Check logs with: docker-compose logs"
fi