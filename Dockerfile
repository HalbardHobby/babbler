FROM ruby:2.7
RUN apt-get update -qq
RUN apt-get install -y nodejs
RUN apt-get install -y npm
RUN apt-get install -y postgresql-client
RUN gem install rails

WORKDIR /babbler

COPY Gemfile Gemfile.lock ./
RUN bundle install
RUN npm install --global yarn

COPY . .

EXPOSE 3000

CMD ["bundle", "exec", "rails", "s", "-p", "3000", "-b", "0.0.0.0"]
