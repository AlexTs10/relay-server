# Dockerfile for Node.js WebSocket Server
# Use Node.js official image with explicit platform
FROM --platform=linux/amd64 node:18-alpine

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose the port used by WebSocket
EXPOSE 8081

# Set environment variables
ENV OPENAI_API_KEY=sk-proj----

# Start the WebSocket server
CMD ["node", "index.js"]
