Inception<br>
A System Administration Exercise with Docker<br>

Summary<br>
This project is an exercise in system administration. The goal is to build and manage a small infrastructure using Docker.<br>
Version: 3<br>

Table of Contents<br>
Preamble<br>
Introduction<br>
General Guidelines<br>
Mandatory Part<br>
Bonus Part<br>
Submission and Peer-Evaluation<br>
1. Preamble<br>
Dive into system administration by building an infrastructure with Docker in a Virtual Machine.<br>

2. Introduction<br>
This project broadens your knowledge of Docker by requiring you to:<br>

Virtualize multiple Docker images<br>
Create and configure them in your own virtual machine<br>
3. General Guidelines<br>
Work only on a Virtual Machine.<br>
Place all configuration files in a srcs directory.<br>
Use a Makefile to automate the setup via docker-compose.yml.<br>
Write your own Dockerfiles (no pulling pre-built images except Alpine/Debian).<br>
Avoid using hacky solutions like infinite loops (e.g., tail -f).<br>
Store sensitive information securely (e.g., .env files or Docker secrets).<br>
4. Mandatory Part<br>
Set up an infrastructure consisting of:<br>

NGINX container:<br>
Must support TLSv1.2 or TLSv1.3<br>
WordPress container:<br>
Includes php-fpm, installed and configured<br>
MariaDB container:<br>
A database exclusively for WordPress<br>
Volumes:<br>
One for the WordPress database<br>
Another for the WordPress website files<br>
Docker Network:<br>
Establish connections between containers<br>
Domain Name:<br>
login.42.fr must redirect to your local IP (replace login with your username).<br>
Rules:<br>
Use Alpine or Debian as the container base.<br>
Use environment variables and avoid hardcoded passwords.<br>
The entry point to your infrastructure must be the NGINX container on port 443.<br>
The system must restart containers automatically in case of a crash.<br>
5. Bonus Part<br>
Enhance your infrastructure by:<br>

Adding an administration interface.<br>
Implementing monitoring tools to track the health of containers.<br>
6. Submission and Peer-Evaluation<br>
Ensure your project follows the directory structure shown below:<br>

project/<br>
│   Makefile<br>
├── secrets/<br>
│   ├── credentials.txt<br>
│   ├── db_password.txt<br>
│   ├── db_root_password.txt<br>
├── srcs/<br>
│   ├── docker-compose.yml<br>
│   ├── .env<br>
│   ├── requirements/<br>
│       ├── mariadb/<br>
│       │   ├── Dockerfile<br>
│       │   └── .dockerignore<br>
│       ├── nginx/<br>
│       │   ├── Dockerfile<br>
│       │   └── conf/<br>
│       ├── wordpress/<br>
│           ├── Dockerfile<br>
│           └── conf/<br>
```<br>

- Secure all credentials, API keys, and sensitive data locally, excluding them from Git.
- Use `.env` files for variables like domain names and credentials.

---

## Learning Objectives
- Master Docker and Docker Compose.
- Understand system administration principles.
- Implement best practices for containerized environments.

--- 

## Credits
This project is part of the **42 curriculum**. 












