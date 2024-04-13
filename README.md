# Serval

The world's simplest static-website generator!

## Build Docker image

    docker build -t serval_dev .

## Build static site

    docker run --rm -w /opt -v $PWD:/opt serval_dev mix build

## Run development server

### First, fetch the dependencies

    docker run --rm -w /opt -v $PWD:/opt serval_dev mix deps.get

### Start the server

    docker run --rm -it -w /opt -v $PWD:/opt -p 4000:4000 serval_dev mix run --no-halt

Visit `localhost:4000` to view.

## Run tests

    docker run --rm -w /opt -v $PWD:/opt serval_dev mix test