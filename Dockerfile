FROM ubuntu:16.04
MAINTAINER Soo Lee (duplexa@gmail.com)
# This Dockerfile was adapted from the Dockerfile on https://github.com/dvera/shart

# 1. general updates & installing necessary Linux components
RUN apt-get update -y && apt-get install -y \
    bc \
    bzip2 \
    curl \
    g++ \
    git \
    less \
    libbz2-dev \
    libcurl4-openssl-dev \
    liblzma-dev \
    libncurses-dev \
    libssl-dev \
    libtbb-dev \
    littler \
    make \
    man \
    openjdk-8-jre \
    parallel \
    perl \
    python-dev \
    python-pip \
    r-base-dev \
    time \
    unzip \
    vim \
    wget \
    zlib1g-dev \
    libmysqlclient-dev \

RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash && \
    apt-get install -y git-lfs


# installing R & R libraries
# r-base, r-base-dev for R, libcurl4-openssl-dev, libssl-dev for devtools
RUN apt-get update -y && apt-get install -y \
    libcurl4-openssl-dev \
    libssl-dev \
    r-base \
    r-base-dev

RUN R -e 'install.packages("devtools", repos="http://cran.us.r-project.org")' && \
    R -e 'devtools::install_github("dvera/conifur")' && \
    R -e 'devtools::install_github("dvera/converge")' && \
    R -e 'devtools::install_github("dvera/gyro")' && \
    R -e 'devtools::install_github("dvera/travis")' && \
    R -e "install.packages(c('docopt','yaml'), repos = 'http://cran.us.r-project.org')"

# download tools
WORKDIR /usr/local/bin
COPY downloads.sh .
RUN . downloads.sh

# set path
ENV PATH=/usr/local/bin/repli-seq-pipeline/scripts:$PATH
ENV PATH=/usr/local/bin/samtools/:$PATH
ENV PATH=/usr/local/bin/bwa/:$PATH
ENV PATH=/usr/local/bin/bedtools2/bin/:$PATH
ENV PATH=/usr/local/bin/FastQC/:$PATH
ENV PATH=/usr/local/bin/pairix/bin/:$PATH
ENV PATH=/usr/local/bin/kentUtils/bin/:$PATH

# supporting UTF-8
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

# wrapper
COPY scripts/ .
RUN chmod +x run*.sh

# default command
CMD ["ls","/usr/local/bin/repli-seq-pipeline/scripts"]

