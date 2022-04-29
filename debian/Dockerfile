ARG DOCKER_IMAGE=debian:bookworm
ARG CT_VERSION_GIT=master

FROM $DOCKER_IMAGE

ARG VERSION="1.0.0"
ENV VERSION=$VERSION

ENV CT_ALLOW_BUILD_AS_ROOT_SURE=1
ENV CT_PREFIX=/usr/src/myapp

LABEL author="Bensuperpc <bensuperpc@gmail.com>"
LABEL mantainer="Bensuperpc <bensuperpc@gmail.com>"

ENV DEBIAN_FRONTEND=noninteractive 

RUN apt-get update && apt-get -y install \
	build-essential \
    clang \
    libomp-dev \
    clang-tidy \
    clang-format \
    clang-tools \
    clangd \
    ninja-build \
    python3-distutils \
    python3-dev \
    python3-pip \
    distcc \
	bison \
	flex \
	autoconf \
	automake \
    cmake \
    mold \
    cppcheck \
    gdb \
    valgrind \
    lcov \
    gcovr \
    texinfo \
    unzip \
    libtool-bin \
    libncurses5-dev \
    libgl-dev \
    libglew-dev \
    libgl1-mesa-dev \
    libegl1-mesa-dev \
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
    libssl-dev \
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
    libvulkan-dev \
    qt6-base-dev \
    libqt6charts6-dev \
    libqt6opengl6-dev \
    libqt6webenginewidgets6 \
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
    qtwebengine6-dev-tools \
    qtwebengine6-dev \
    qml6-module-qtquick \
    qml6-module-qtqml \
    qml6-module-qtwebengine \
    qml6-module-qtquick-controls \
    qml6-module-qtquick-dialogs \
    qml6-module-qtquick-layouts \
    qml6-module-qtquick-localstorage \
    qml6-module-qt3d-animation \
    qml6-module-qt3d-core \
    qml6-module-qt3d-extras \
    qml6-module-qtcore \
    qml6-module-qtcharts \
    qml6-module-qtmultimedia \
    qml6-module-qtquick-window \
    qml6-module-qtwayland-compositor \
    libgd-perl \
    nvidia-cuda-toolkit \
    nvidia-cuda-dev \
    nvidia-cuda-toolkit-gcc \
	&& apt-get -y autoremove --purge && \
	rm -rf /var/lib/apt/lists/*

RUN git clone --recurse-submodules --remote-submodules https://github.com/crosstool-ng/crosstool-ng.git \
    && cd /crosstool-ng \
    && git checkout ${CT_VERSION_GIT} \
    && ./bootstrap \
    && ./configure --prefix=/usr/local \
    && make -j$(nproc) \
    && make install \
    && rm -rf /crosstool-ng \
    && cd / \
    && ct-ng --version

LABEL org.label-schema.schema-version="1.0" \
	  org.label-schema.build-date=$BUILD_DATE \
	  org.label-schema.name="bensuperpc/dev-environment" \
	  org.label-schema.description="dev-environment" \
	  org.label-schema.version=$VERSION \
	  org.label-schema.vendor="Bensuperpc" \
	  org.label-schema.url="http://bensuperpc.com/" \
	  org.label-schema.vcs-url="https://github.com/bensuperpc/dev-environment" \
	  org.label-schema.vcs-ref=$VCS_REF \
	  org.label-schema.docker.cmd="docker build -t bensuperpc/dev-environment -f Dockerfile ."

VOLUME [ "/usr/src/myapp" ]
WORKDIR /usr/src/myapp
# CMD ["ct-ng"]
