# Base
FROM node:16-alpine

WORKDIR /app

# Dependencies installation
COPY package*.json ./
RUN npm ci && npm cache clean --force

# Build commands
COPY . .
RUN npm run build

# Application configs
USER node
ENV PORT=4000
EXPOSE 4000

ENTRYPOINT [ "npm", "run" ]

CMD ["start"]