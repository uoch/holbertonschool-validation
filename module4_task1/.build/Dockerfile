FROM golang:1.15.8-buster

# Install golangci-lint
ENV GOLANGCI_LINT_VERSION=1.42.0
RUN curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin "v${GOLANGCI_LINT_VERSION}"

# Install Hugo
ENV HUGO_VERSION=0.88.1
RUN apt-get update && apt-get install -y wget \
    && wget -O hugo.tar.gz https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz \
    && tar -xf hugo.tar.gz -C /tmp/ \
    && mv /tmp/hugo /usr/local/bin/hugo \
    && rm -rf hugo.tar.gz

# Set working directory
WORKDIR /app

# Copy project files
COPY . .

# Define entry point
CMD ["make", "build"]
