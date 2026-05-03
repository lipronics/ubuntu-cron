FROM ubuntu:24.04

ENV TZ=Europe/Amsterdam \
    DEBIAN_FRONTEND="noninteractive" \
    PIPX_HOME=/opt/pipx \
    PIPX_BIN_DIR=/usr/local/bin

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
    apt update && \
    apt install -y \
        barcode \
        build-essential \
        composer \
        cron \
        curl \
        fonts-freefont-ttf \
        gcc \
        ghostscript \
        locales \
        mysql-client \
        nodejs \
        nano \
        npm \
        php-cli \
        php-curl \
        php-dev \
        php-gd \
        php-intl \
        php-mbstring \
        php-mysql \
        php-pear \
        php-redis \
        php-soap \
        php-ssh2 \
        pipx \
        python3-pip \
        python3-pymysql \
        python3-requests \
        sudo \
        unoconv \
        unzip \
        wget \
        zip \
        && \
    apt clean && \
    locale-gen nl_NL.utf8 && \
    \
    wget https://www.lisaas.com/download/genbarcode-0.4.tar.gz && \
    tar -xvzf genbarcode-0.4.tar.gz && \
    cd genbarcode-0.4/ && \
    make && \
    make install && \
    \
    pipx ensurepath && \
    pipx install unoserver==2.0.1 && \
    npm install bower -g
