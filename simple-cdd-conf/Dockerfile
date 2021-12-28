FROM debian:stable
RUN echo "deb http://deb.debian.org/debian stable main" > /etc/apt/sources.list
RUN echo "deb-src http://deb.debian.org/debian stable main" >> /etc/apt/sources.list
RUN echo "deb http://security.debian.org/debian-security stable-security main" >> /etc/apt/sources.list
RUN echo "deb http://deb.debian.org/debian stable-updates main" >> /etc/apt/sources.list
RUN echo "deb-src http://deb.debian.org/debian stable-updates main" >> /etc/apt/sources.list
RUN echo force-unsafe-io > /etc/dpkg/dpkg.cfg.d/force-unsafe-io
RUN echo 'Acquire::EnableSrvRecords "false";' > /etc/apt/apt.conf.d/90srvrecords
RUN apt-get update && apt-get dist-upgrade --yes
RUN apt-get install --yes --no-install-recommends \
    build-essential \
    debconf-utils \
    devscripts \
    ca-certificates \
    dh-make \
    dosfstools \
    fakeroot \
    mtools \
    simple-cdd
RUN mkdir -p /build-iso
WORKDIR /build-iso
COPY . /build-iso
RUN groupadd -g 999 appuser && \
    useradd -r -m -u 999 -g appuser appuser
RUN chown -R appuser:appuser /build-iso
USER appuser
CMD /build-iso/build && echo "Finished build custom Debian image."


