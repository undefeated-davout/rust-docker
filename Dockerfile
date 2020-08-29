FROM centos:7

# yum
RUN yum update -y && \
    yum clean all
RUN yum groupinstall -y "Development tools"
RUN yum install -y \
            sudo \
            git \
            unzip \
            wget \
            curl

# Japanese Locale setting
RUN localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
ENV LANG="ja_JP.UTF-8" \
    LANGUAGE="ja_JP:ja" \
    LC_ALL="ja_JP.UTF-8"

# install Rust
RUN curl https://sh.rustup.rs -sSf | \
    sh -s -- --default-toolchain stable -y
RUN echo export PATH='$HOME/.cargo/bin:$PATH' >> ~/.bashrc

# make work dir
RUN mkdir /src
WORKDIR /src
