FROM debian:8
MAINTAINER André Ligné "andre.ligne@gmail.com"

# Install the dependencies
RUN apt-get update
RUN apt-get install -y curl g++ libssl-dev make

# Fetch znc using version 1.6.2
WORKDIR /tmp
RUN curl -O http://znc.in/releases/znc-1.6.2.tar.gz
RUN tar -xvzf znc-1.6.2.tar.gz

# Build and install znc
WORKDIR /tmp/znc-1.6.2
RUN ./configure
RUN make
RUN make install

# Add a user for running the service
RUN useradd -M znc

# Copy over the configuration files
COPY znc/ /var/znc
RUN chown -R znc /var/znc

# Run znc as the `znc` user
USER znc
EXPOSE 4769
ENTRYPOINT /usr/local/bin/znc -frd /var/znc
