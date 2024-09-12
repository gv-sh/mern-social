# Base image
FROM node:13.12.0

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Install netcat for the health check
RUN apt-get update && apt-get install -y netcat

# Expose the port the app runs on
EXPOSE 3000

# Create a shell script to wait for MongoDB and start the app
RUN echo '#!/bin/sh\n\
while ! nc -z mongo 27017; do\n\
  echo "Waiting for MongoDB..."\n\
  sleep 1\n\
done\n\
echo "MongoDB started"\n\
npm run development' > /app/wait-for-mongo.sh

RUN chmod +x /app/wait-for-mongo.sh

# Command to run the application
CMD ["/app/wait-for-mongo.sh"]

