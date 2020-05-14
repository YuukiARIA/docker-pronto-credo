FROM elixir:1.9.1-slim

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      autoconf \
      bison \
      build-essential \
      ca-certificates \
      cmake \
      curl \
      git \
      libssl-dev \
      libyaml-dev \
      libreadline6-dev \
      zlib1g-dev \
      libncurses5-dev \
      libffi-dev \
      libgdbm-dev \
      pkg-config \
 && rm -rf /var/lib/apt/lists/* \
 && mkdir /tmp/ruby \
 && cd /tmp/ruby \
 && (curl -sSL https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.1.tar.gz | tar xz) \
 && cd ruby-2.7.1 \
 && ./configure --disable-install-rdoc \
 && make \
 && make install \
 && cd ~ \
 && rm -rf /tmp/ruby \
 && gem install -N pronto pronto-credo \
 && mix local.hex --force \
 && mix local.rebar --force \
 && mix archive.install hex bunt 0.2.0 --force \
 && mix archive.install hex credo 1.4.0 --force

WORKDIR /root

ENTRYPOINT ["pronto"]
