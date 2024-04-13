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

## License

Serval Copyright © 2023 Catalin C Mititiuc

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the [GNU General Public License](https://www.gnu.org/licenses/gpl.html) for more details.
