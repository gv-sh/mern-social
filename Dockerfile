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

# Install wait-for-it
RUN apt-get update && apt-get install -y wait-for-it

# Expose the port the app runs on
EXPOSE 3000

# Command to run the application
CMD ["sh", "-c", "wait-for-it mongo:27017 -t 60 -- npm run development"]


