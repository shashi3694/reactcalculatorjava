# Use an official Node.js runtime as a base image
FROM node:18

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json first
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose the port your app runs on
EXPOSE 3000

# Edited from this line Add a group and user
RUN groupadd -r appgroup && useradd -r -g appgroup -m -s /bin/bash appuser

# Set permissions (optional but good practice)
WORKDIR /app
COPY . .
RUN chown -R appuser:appgroup /app

# Switch to non-root user
USER appuser

# TO this line Run the app
CMD ["node", "server.js"]


# Start the app
CMD ["node", "server.js"]
