FROM python:3.7.1-stretch

MAINTAINER Joel Nitta <joelnitta@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
  time \
  bwa \
  exonerate \
  ncbi-blast+ \
  parallel \
  samtools \
  && apt-get clean && apt-get purge \
  && pip3 install biopython \
  && mkdir /apps

# Silence parallel citation warning
RUN mkdir /root/.parallel \
  && touch /root/.parallel/will-cite

WORKDIR /apps

# SPAdes is available as a debian package, but doesn't work for HybPiper.
# Use linux binary instead.
RUN wget http://cab.spbu.ru/files/release3.13.0/SPAdes-3.13.0-Linux.tar.gz \
  && tar xf SPAdes-3.13.0-Linux.tar.gz \
  && rm SPAdes-3.13.0-Linux.tar.gz

ENV PATH="$PATH:/apps/SPAdes-3.13.0-Linux/bin/"

# Clone hybpiper and checkout most recent commit at time of building docker image
RUN git clone https://github.com/joelnitta/HybPiper.git \
  && cd HybPiper \
  && git checkout 58907ae6366f7fdbdf548486adee120d6e54ed21 \
  && chmod +x *.py

ENV PATH="$PATH:/apps/HybPiper/"

WORKDIR /home

ENTRYPOINT /bin/bash
