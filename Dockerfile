FROM fedora
WORKDIR /srv
RUN dnf install -y fontconfig wget bzip2
RUN wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2
RUN tar -xjf phantomjs-2.1.1-linux-x86_64.tar.bz2
COPY ./src/start_phantomjs.sh /bin/start_phantomjs.sh
CMD ["/bin/start_phantomjs.sh"]
