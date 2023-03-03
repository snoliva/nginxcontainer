FROM nginx:1.21.6-alpine
LABEL maintainer="snoliva.a@gmail.com"

# Delete default file config nginx site
RUN rm /etc/nginx/conf.d/default.conf
# Create folder sites-available and enabled
RUN mkdir -p /etc/nginx/conf.d/sites-available
RUN mkdir -p /etc/nginx/conf.d/sites-enabled
# Add config file site
COPY default.conf /etc/nginx/conf.d/sites-available/
# COPY ./conf.d/redirect.conf /etc/nginx/conf.d/sites-available/
# Create symbolic link
RUN ln -s /etc/nginx/conf.d/sites-available/default.conf /etc/nginx/conf.d/sites-enabled
# RUN ln -s /etc/nginx/conf.d/sites-available/redirect.conf /etc/nginx/conf.d/sites-enabled

RUN rm /etc/nginx/nginx.conf
COPY nginx.conf /etc/nginx/
COPY index.html /var/www/html/

# Advance configuration and ssl certificate

# COPY ./ssl/xxx.crt /etc/ssl/private/
# COPY ./ssl/certificate.ca-bundle /etc/ssl/private/
# COPY ./ssl/file.key /etc/ssl/private/

# COPY common.conf /etc/nginx/
# COPY ssl.conf /etc/nginx/
# COPY common_location.conf /etc/nginx/
