FROM golang:1.15.8-alpine

SHELL ["/bin/ash", "-o", "pipefail", "-c"]

# Install golangci-lint
ENV GOLANGCI_LINT_VERSION=1.42.0

# Install Hugo
ENV HUGO_VERSION=0.88.1

# Install Hadolint
ENV HADOLINT_VERSION=2.6.0

# Install build dependencies
RUN apk add --no-cache \
    curl=7.79.1-r3 \
    build-base=0.5-r3 \
    zip=3.0-r9 \
    && curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b /usr/local/bin "v${GOLANGCI_LINT_VERSION}" \
    && curl -sSfL -o hugo.tar.gz https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz \
    && tar -xf hugo.tar.gz -C /tmp/ \
    && mv /tmp/hugo /usr/local/bin/hugo \
    && rm -rf hugo.tar.gz \
    && curl -sSfL -o hadolint "https://github.com/hadolint/hadolint/releases/download/v${HADOLINT_VERSION}/hadolint-Linux-x86_64" \
    && chmod +x hadolint \
    && mv hadolint /usr/local/bin/

# Install container-structure-test
RUN curl -LO https://storage.googleapis.com/container-structure-test/v1.10.0/container-structure-test-linux-amd64 \
    && chmod +x container-structure-test-linux-amd64 \
    && mv container-structure-test-linux-amd64 /usr/local/bin/container-structure-test

# Set working directory
WORKDIR /app

# Copy project files
COPY . .

# Define entry point
CMD ["make", "build"]
