ARG DOCKER_IMAGE=debian:bookworm-slim
ARG CT_VERSION_GIT=master

FROM $DOCKER_IMAGE

ARG VERSION="1.0.0"
ENV VERSION=$VERSION

LABEL author="Bensuperpc <bensuperpc@gmail.com>"
LABEL mantainer="Bensuperpc <bensuperpc@gmail.com>"

ENV DEBIAN_FRONTEND=noninteractive 

RUN apt-get update && apt-get -y install \
	build-essential \
    libomp-dev \
    clang \
    libomp-dev \
    ninja-build \
    python3-distutils \
    python3-dev \
	bison \
	flex \
	autoconf \
	automake \
    cmake \
    cppcheck \
    gdb \
    cppcheck \
    valgrind \
    lcov \
	texinfo \
	unzip \
	libtool-bin \
	libncurses5-dev \
	byacc \
    autogen \
    bash \
    bc \
    bzip2 \
    ca-certificates \
    curl \
    dirmngr \
    file \
    gettext \
    gzip \
    gnupg \
    initramfs-tools \
    make \
    ncurses-dev \
    pkg-config \
    pax \
    python3-distutils \
    python3-dev \
    sed \
	meson \
	gawk \
	rsync \
	lzip \
    ssh \
    openssl \
    tar \
    wget \
    xz-utils \
    zip \
    zlib1g-dev \
	help2man \
	git \
    libboost-all-dev \
    libfmt-dev \
    libgtest-dev \
    libbenchmark-dev \
    catch2 \
    libsfml-dev \
    libsdl2-dev \
    libopencv-dev \
    qt6-base-dev \
    qt6-3d-dev \
    qt6-multimedia-dev \
    qt6-declarative-dev \
    qt6-connectivity-dev \
    qt6-quick3d-dev \
    qt6-wayland-dev \
    qt6-webengine-dev \
    qt6-webview-dev \
    qt6-positioning-dev \
    qt6-webview-plugins \
    qt6-qpa-plugins \
    qt6-image-formats-plugins \
    qt6-qmltooling-plugins \
    qt6-3d-defaultgeometryloader-plugin \
    qt6-image-formats-plugin-pdf \
	--no-install-recommends \
	&& apt-get -y autoremove --purge && \
	rm -rf /var/lib/apt/lists/*

RUN git clone --recurse-submodules --remote-submodules https://github.com/crosstool-ng/crosstool-ng.git \
    && cd crosstool-ng \
    && git checkout ${CT_VERSION_GIT} \
    && ./bootstrap \
    && ./configure --enable-local \
    && make -j$(nproc) \
    && ./ct-ng --version \
    && cd .. \
    && rm -rf crosstool-ng

LABEL org.label-schema.schema-version="1.0" \
	  org.label-schema.build-date=$BUILD_DATE \
	  org.label-schema.name="bensuperpc/crosstool-ng" \
	  org.label-schema.description="build crosstool-ng toolchain" \
	  org.label-schema.version=$VERSION \
	  org.label-schema.vendor="Bensuperpc" \
	  org.label-schema.url="http://bensuperpc.com/" \
	  org.label-schema.vcs-url="https://github.com/bensuperpc/docker-crosstool-ng" \
	  org.label-schema.vcs-ref=$VCS_REF \
	  org.label-schema.docker.cmd="docker build -t bensuperpc/crosstool-ng -f Dockerfile ."

ENV CT_ALLOW_BUILD_AS_ROOT_SURE=1
ENV CT_PREFIX=/usr/src/myapp

VOLUME [ "/usr/src/myapp" ]
WORKDIR /usr/src/myapp
CMD ["ct-ng"]