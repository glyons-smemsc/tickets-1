# Tickets CAD - Docker Development Setup Guide

## Quick Start

1. **Add yourself to docker group** (one-time):
   ```bash
   sudo usermod -aG docker $USER
   # Then logout and log back in, or run:
   newgrp docker
   ```

2. **Build and start containers**:
   ```bash
   docker-compose build
   docker-compose up -d
   ```

3. **Access the application**:
   - Main application: http://localhost:8080
   - PhpMyAdmin: http://localhost:8081
   - Database: localhost:3306

## What This Gives You

- **Web Server**: Apache + PHP 8.2 with all required extensions
- **Database**: MySQL 8.0 with credentials pre-configured
- **Admin**: PhpMyAdmin for database management
- **Persistence**: Data survives container restarts

## Database Credentials

- **Host**: db (inside Docker) or localhost:3306 (from your machine)
- **Database**: tickets_db
- **User**: tickets_user
- **Password**: tickets_password
- **Root password**: tickets_root_password (for PhpMyAdmin)

## Installation Steps

Once containers are running:

1. Browse to: http://localhost:8080/install.php
2. Enter database credentials:
   - Host: db
   - Database: tickets_db
   - User: tickets_user
   - Password: tickets_password
3. Complete installation
4. Login with default credentials:
   - Username: Admin
   - Password: admin

## Development Workflow

- Code changes reflect immediately (volume mounted)
- Database data persists in Docker volume
- Apache error logs go to `logs/` directory
- All services restart with: `docker-compose restart`

## Useful Commands

```bash
# View logs
docker-compose logs -f web
docker-compose logs -f db

# Stop services
docker-compose down

# Rebuild (after Dockerfile changes)
docker-compose build --no-cache

# Access containers directly
docker exec -it tickets-cad-web bash
docker exec -it tickets-cad-db mysql -u tickets_user -p tickets_db
```