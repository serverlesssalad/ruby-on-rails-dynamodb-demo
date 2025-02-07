# Use the official Ruby base image with the lighter version
FROM ruby:3.1.2-alpine

# Set the working directory
WORKDIR /app

# Copy the Gemfile and Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Install dependencies
RUN bundle install --without development test

# Copy the rest of the application files
COPY . .

# Expose the port the app runs on
EXPOSE 3000

# Set the entrypoint
ENTRYPOINT ["bin/docker-entrypoint"]