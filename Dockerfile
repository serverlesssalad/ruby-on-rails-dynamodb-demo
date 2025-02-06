# Use the lighter official Ruby base image
FROM ruby:3.2-slim

# Set working directory
WORKDIR /app

# Copy Gemfile and Gemfile.lock first to leverage caching of dependencies
COPY Gemfile Gemfile.lock ./

# Install dependencies
RUN bundle install

# Copy the rest of the application code
COPY . .

# Set the entrypoint
ENTRYPOINT ["bin/docker-entrypoint"]