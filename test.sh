docker build -t app:latest .
docker run -d -p 3000:3000 --name myapp-dev myapp:latest
docker run -d --name myapp-test myapp:latest npm test
docker run -d -p 80:3000 --name myapp-prod myapp:latest
docker run -d -p 3000:3000 -v /path/to/local/dir:/usr/src/app --name app-myapp-dev my
app:latest
docker network create network-myapp
docker run -d --network network-myapp --name dv-myapp myapp:latest
docker run -d --network network-myapp --name dv-myapp-db myapp:latest
