FROM node:16-slim

# Create and set ownership of working dir
RUN mkdir -p /app && chown -R node:node /app
WORKDIR /app

# Copy only package descriptors and install dependencies
COPY package*.json ./
RUN npm install

# Copy only necessary app files, not everything
# Avoid recursively copying everything unless .dockerignore is used to filter
COPY . .

# IMPORTANT: Use a .dockerignore file to avoid copying secrets or unnecessary files
# Example: .env, .git, node_modules, coverage, etc.

# Drop root privileges — run as a safer non-root user
USER node

# Start the application
CMD ["node", "server.js"]
