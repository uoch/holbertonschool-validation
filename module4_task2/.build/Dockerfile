FROM golang:1.15.8-alpine

# Install golangci-lint
ENV GOLANGCI_LINT_VERSION=1.42.0
RUN apk add --no-cache curl && \
    curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b /usr/local/bin "v${GOLANGCI_LINT_VERSION}"

# Install Hugo
ENV HUGO_VERSION=0.88.1
RUN apk add --no-cache wget && \
    wget -qO hugo.tar.gz https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz && \
    tar -xf hugo.tar.gz -C /tmp/ && \
    mv /tmp/hugo /usr/local/bin/hugo && \
    rm -rf hugo.tar.gz

# Install Hadolint
ENV HADOLINT_VERSION=2.6.0
RUN apk add --no-cache --virtual .build-deps wget && \
    wget -qO hadolint "https://github.com/hadolint/hadolint/releases/download/v${HADOLINT_VERSION}/hadolint-Linux-x86_64" && \
    chmod +x hadolint && \
    mv hadolint /usr/local/bin/ && \
    apk del .build-deps

# Set working directory
WORKDIR /app

# Copy project files
COPY . .

# Define entry point
CMD ["make", "build"]