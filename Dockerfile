FROM node:14
WORKDIR /app
COPY test.js .
RUN npm install
RUN docker build -t app .
CMD ["npm", "start"]


 
