# Dockerfile for a Node.js application
FROM node:22

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json (if available) to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Build the application (if applicable)
ENV PORT=3002

# Expose the port the app runs on
EXPOSE $PORT

# Run the application
CMD ["npm", "start"]