#There is absolutely no need of a docker file for a static html file but since this website is hosted on render and it requires a dockerfile i created this dockerfile.


# Use nginx as base image
FROM nginx:alpine

# Remove default nginx static assets
RUN rm -rf /usr/share/nginx/html/*

# Copy static assets to nginx directory
COPY . /usr/share/nginx/html/

# Copy nginx configuration
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Set environment variables
ENV EMAIL_PUBLIC_KEY=""
ENV EMAIL_SERVICE_ID=""
ENV EMAIL_TEMPLATE_ID=""

# Expose port 80
EXPOSE 80

# Start nginx server
CMD ["nginx", "-g", "daemon off;"]