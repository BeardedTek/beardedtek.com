# Stage 1: Build the Hugo site
FROM hugomods/hugo:go-git-0.145.0 AS builder

# Copy Hugo site files
COPY . .

# Build the site
ARG HUGO_BASEURL
RUN hugo --minify -b ${HUGO_BASEURL}

# Stage 2: Serve with static-web-server
FROM joseluisq/static-web-server:2-debian

# Copy the generated site from the builder stage
COPY --from=builder /src/public /public

# Expose the default port
EXPOSE 80

# Use the default CMD from joseluisq/static-web-server
