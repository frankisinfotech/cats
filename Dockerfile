FROM ruby:3.0.0

# Set environment variables
ENV RACK_ENV=production \
    PORT=8000 \
    WEB_CONCURRENCY=1 \
    MAX_THREADS=1

# Set the working directory inside the container
WORKDIR /app

# Copy the application files to the container
COPY . .

# Install Bundler and the application dependencies
RUN gem install bundler && \
    bundle install --jobs 4 --retry 3

# Expose the port the application runs on
EXPOSE 8000

# Command to run the application
CMD ["bundle", "exec", "puma"]
