# Use an official Node.js runtime as a parent image
FROM node:14

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Change to the minify directory and install its dependencies
WORKDIR /usr/src/app/data/minify
COPY data/minify/package*.json ./
RUN npm install

# Copy the rest of the application code
WORKDIR /usr/src/app
COPY . .

# Expose the port the app runs on
EXPOSE 8080

# Define the command to run the application
CMD ["npm", "start"]