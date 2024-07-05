FROM node:14
WORKDIR /app
COPY . .
RUN npm install
CMD ["npm", "start"]




# Build the Docker image
docker build -t app .

# Run a container for development
docker run -d --name app-dev -p 3000:3000 app

# Run a container for testing
docker run -d --name app-test -p 3001:3000 app

# Run a container for production
docker run -d --name app-prod -p 80:3000 app


docker run -d --name app-dev -p 3000:3000 -v $(pwd)/data:/app/data app



docker network create app-network
docker run -d --name app-dev --network app-network -p 3000:3000 app
docker run -d --name db --network app-network -e POSTGRES_PASSWORD=mysecretpassword postgres

