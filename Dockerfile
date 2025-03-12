FROM httpd:2.4

# Copy an extra configuration file to the appropriate directory
COPY ./conf/extra-httpd.conf /usr/local/apache2/conf/extra/extra-httpd.conf

# Reference that extra conf in the main httpd.conf
RUN echo "Include conf/extra/extra-httpd.conf" >> /usr/local/apache2/conf/httpd.conf

# Enable the rewrite module
RUN sed -i 's/^#LoadModule rewrite_module/LoadModule rewrite_module/' /usr/local/apache2/conf/httpd.conf

# Expose port 80
EXPOSE 80

# Start the Apache HTTP Server
CMD ["httpd-foreground"]
