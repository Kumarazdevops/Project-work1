FROM node:14
WORKDIR /app
COPY . .
COPY test.sh
RUN npm install
CMD ["npm", "start"]


 
