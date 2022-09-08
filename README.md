# ITSTEP

My Test Repository in ITSTEP Courses  
This script allows you to install cms WordPress based on the LAMP stack.  
Before starting the script, you should install command sudo. Also you should add user in the sudoers group under which the script will be executed.

## How to build image for apache and run

```bash
cd apache-wp
docker build -t apache-wp . --platform linux/amd64
docker-compose up -D
```

## How to build image for nginx and run

```bash
cd nginx-wp
docker build -t nginx-wp . --platform linux/amd64
docker-compose up -D
```
