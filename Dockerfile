FROM ruby:3.0-bullseye as base
WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

ENV RAILS_ENV=production

EXPOSE 3000
CMD ["rails", "server"]