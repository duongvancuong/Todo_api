FROM ruby:2.4.1
# Install dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
# Set an environment variable where the Rails app is installed to inside of Docker image:
ENV RAILS_ROOT /myapp
RUN mkdir -p $RAILS_ROOT
# Set working directory, where ther commends will be ran:
WORKDIR $RAILS_ROOT
# Gem:
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN gem install bundler
RUN bundle install

COPY docker/rails/puma.rb docker/rails/puma.rb
# Copy the main application.
COPY . .
EXPOSE 8082

# The default command that gets ran will be to start the Puma Server
CMD bash docker/wait_for_db.sh && bundle exec rails db:create db:migrate && bundle exec puma -C docker/rails/puma.rb
