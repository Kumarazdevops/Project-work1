docker build -t myapp:latest .
docker run -d -p 3000:3000 --name myapp-dev myapp:latest
docker run -d --name myapp-test myapp:latest npm test
docker run -d -p 80:3000 --name myapp-prod myapp:latest
docker run -d -p 3000:3000 -v /path/to/local/dir:/usr/src/app --name myapp-dev myapp:latest
docker network create myapp-network
docker run -d --network myapp-network --name myapp-dev myapp:latest
docker run -d --network myapp-network --name myapp-db mydb:latest
