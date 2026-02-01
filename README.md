*This project has been created as part of the 42 curriculum by sishizaw.*

# **Description**
This project, "Inception," aims to broaden knowledge of system administration by using Docker to virtualize several Docker images in a personal virtual machine. The infrastructure consists of a multi-container setup including NGINX (with TLS v1.2/v1.3), WordPress with php-fpm, and MariaDB.

## Main Design Choices

- Operating System: All containers are built using the Debian Bookworm stable version to ensure performance and stability.
- Orchestration: Docker Compose is used to manage the services and networks.
- Security: No passwords are stored in the Dockerfiles; instead, environment variables and a .env file are utilized to manage credentials securely.
- Persistence: Data is persisted using Docker named volumes mapped to the host machine at /home/sishizaw/data.

## Comparisons

- Virtual Machines vs Docker: Virtual Machines virtualize the hardware and include a full OS, whereas Docker virtualizes the OS kernel, making it more lightweight and faster.
- Secrets vs Environment Variables: While environment variables are easy to implement, Docker Secrets are more secure as they are not exposed via docker inspect and are stored in memory.
- Docker Network vs Host Network: A dedicated Docker bridge network isolates container communication, whereas the Host Network shares the host's IP and ports, offering less isolation.
- Docker Volumes vs Bind Mounts: Named volumes are managed by Docker and are more portable and reliable for persistence than Bind Mounts, which depend on the host's specific file structure.

# **Instructions**

1. Domain Setup: Map sishizaw.42.fr to your local IP address in the /etc/hosts file.
2. Configuration: Create a srcs/.env file with the required credentials (database names, users, and passwords).
3. Build and Run: Execute make at the root of the project to set up directories and build/start the containers.
4. Cleaning: Use make fclean to stop containers and remove all volumes and data for a completely fresh start.

# **Resources***
- Docker Documentation
- NGINX SSL/TLS Guide
- AI Usage: AI was used to assist in designing the database initialization logic in setup.sh and organizing the directory structure for the Dockerfiles. All AI-generated logic was reviewed, tested, and understood before integration.