# Stage 1: Build the Hugo site
FROM hugomods/hugo:go-git-0.145.0 AS builder

# Copy Hugo site files
COPY . .

# Build the site
ARG HUGO_BASEURL
ARG HUGO_OPTS=""
RUN hugo ${HUGO_OPTS} -b ${HUGO_BASEURL}

# Stage 2: Serve with nginx
FROM nginx:stable-alpine
WORKDIR /usr/share/nginx/html


# Copy the generated site from the builder stage
COPY --from=builder /src/public .

# Expose the default port
EXPOSE 80/tcp