# Serval

The world's simplest static-website generator!

## Build Docker image

    docker build -t serval_dev .

## Build static site

    docker run --rm -w /opt -v $PWD:/opt serval_dev mix build

## Run tests

    docker run --rm -w /opt -v $PWD:/opt serval_dev mix test