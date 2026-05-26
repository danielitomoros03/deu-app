# syntax = docker/dockerfile:1

# Make sure RUBY_VERSION matches the Ruby version in .ruby-version
ARG RUBY_VERSION=3.1.2
FROM docker.io/library/ruby:$RUBY_VERSION-slim AS base

# Rails app lives here
WORKDIR /rails

# Install base packages
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y curl libjemalloc2 libpq5 libvips sqlite3 && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

# Set production environment
ENV RAILS_ENV="production" \
    BUNDLE_DEPLOYMENT="1" \
    BUNDLE_PATH="/usr/local/bundle" \
    BUNDLE_WITHOUT="development"

# Throw-away build stage to reduce size of final image
FROM base AS build

# Install packages needed to build gems + Node.js 20 (Vite 5 requires >= 18)
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential git pkg-config libpq-dev ca-certificates gnupg && \
    curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install --no-install-recommends -y nodejs && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

# Upgrade RubyGems to satisfy nokogiri >= 1.18 requirement (needs >= 3.3.22)
RUN gem update --system 3.5.23 --no-document

# Install application gems
COPY Gemfile Gemfile.lock ./
RUN bundle install && \
    rm -rf ~/.bundle/ "${BUNDLE_PATH}"/ruby/*/cache "${BUNDLE_PATH}"/ruby/*/bundler/gems/*/.git && \
    bundle exec bootsnap precompile --gemfile

# Install frontend dependencies for Vite asset compilation
COPY package*.json ./
RUN npm ci

# Copy application code
COPY . .
RUN chmod +x bin/*

# Precompile bootsnap code for faster boot times
RUN bundle exec bootsnap precompile app/ lib/

# Precompiling assets for production without requiring secret RAILS_MASTER_KEY
RUN SECRET_KEY_BASE_DUMMY=1 ./bin/rails assets:precompile

# Final stage for app image
FROM base

# Copy built artifacts: gems, application
COPY --from=build "${BUNDLE_PATH}" "${BUNDLE_PATH}"
COPY --from=build /rails /rails

# Create platform symlinks: Bundler constructs paths with x86_64-linux but gems
# are installed as x86_64-linux-gnu (different naming since nokogiri 1.17+).
RUN find /usr/local/bundle/ruby/*/gems -maxdepth 1 -name '*-x86_64-linux-gnu' -type d | \
    while read d; do target="${d%-gnu}"; [ ! -e "$target" ] && ln -s "$d" "$target"; done && \
    find /usr/local/bundle/ruby/*/specifications -name '*-x86_64-linux-gnu.gemspec' | \
    while read s; do target="${s%-gnu.gemspec}.gemspec"; [ ! -e "$target" ] && ln -s "$s" "$target"; done

# Run and own only the runtime files as a non-root user for security
RUN groupadd --system --gid 1000 rails && \
    useradd rails --uid 1000 --gid 1000 --create-home --shell /bin/bash && \
    chown -R rails:rails db log storage tmp
USER 1000:1000

# Entrypoint prepares the database.
ENTRYPOINT ["/rails/bin/docker-entrypoint"]

# Start the server by default, this can be overwritten at runtime
EXPOSE 3000
CMD ["./bin/rails", "server"]
