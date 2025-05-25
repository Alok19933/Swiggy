FROM node:16-slim

# Create and set ownership of working dir
RUN mkdir -p /app && chown -R node:node /app
WORKDIR /app

# Copy only needed files and install deps
COPY package*.json ./
RUN npm install

# Copy remaining files
COPY . .

# Drop privileges
USER node

CMD ["node", "server.js"]
