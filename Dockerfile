# Stage 1: Build the Hugo site
FROM hugomods/hugo:base-0.145.0 AS builder

# Set working directory
WORKDIR /site

# Copy Hugo site files
COPY . .

# Build the site
RUN hugo --minify

# Stage 2: Serve with static-web-server
FROM joseluisq/static-web-server:2-debian

# Copy the generated site from the builder stage
COPY --from=builder /site/public /public

# Expose the default port
EXPOSE 80

# Use the default CMD from joseluisq/static-web-server
