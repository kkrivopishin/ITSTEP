# ITSTEP

<<<<<<< HEAD
My Test Repository in ITSTEP Courses  
This script allows you to install cmsWordPress based on the LAMP stack.  
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
=======
My Test Repository in ITSTEP Courses.   
This script allows you to install cmsWordPress based on the LAMP stack.   
Before starting the script, you should install command sudo. Also you should add user in the sudoers group under which the script will be executed.   
>>>>>>> 45a06ad4bd32ad0c2b8616faf3c237db5f8baf06
