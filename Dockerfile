FROM node:14
WORKDIR /app
COPY . .
RUN npm install
CMD ["npm", "start"]


RUN docker build -t app .

Run docker run -d --name app-dev -p 3000:3000 app

Run docker run -d --name app-test -p 3001:3000 app

Run docker run -d --name app-prod -p 80:3000 app
RUN docker run -d --name app-dev -p 3000:3000 -v $(pwd)/data:/app/data app

RUN docker network create app-network
RUN docker run -d --name app-dev --network app-network -p 3000:3000 app
RUN docker run -d --name db --network app-network -e POSTGRES_PASSWORD=mysecretpassword postgres
