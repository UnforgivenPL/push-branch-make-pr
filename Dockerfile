FROM ruby:2.6

COPY Gemfile Gemfile.lock push-branch.sh push-branch.rb ./
RUN bundle install
RUN chmod +x /push-branch.sh

ENTRYPOINT ["/push-branch.sh"]