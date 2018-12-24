# docker-javascript-div
load a specific DIV container from a Javascript website using phantomjs 2.1.1 X64

# created
20181224

# developed
by bevute@

# install podman first
I use podman for creating and running docker images.
https://podman.io/

# create docker image with podman
sudo podman build -t phantomjs:div .

# run docker container
sudo podman run --rm -it -e URL_ENV="$URL" -e DIV_ENV="$DIV_TAG" phantomjs:div

# run wrapper script
bin/extract-div URL DIV_TAG

# example javascript URL
/bin/extract-div https://www.javascript.com/try content

