ARG IMAGE_NAME="${IMAGE_NAME:-kinoite}"
ARG SOURCE_IMAGE="${SOURCE_IMAGE:-kinoite}"
ARG BASE_IMAGE="quay.io/fedora-ostree-desktops/${SOURCE_IMAGE}"
ARG FEDORA_MAJOR_VERSION="${FEDORA_MAJOR_VERSION:-38}"

FROM ${BASE_IMAGE}:${FEDORA_MAJOR_VERSION} AS main 

RUN rpm-ostree uninstall firefox firefox-langpacks && ostree container commit

RUN rpm-ostree install distrobox pip && ostree container commit
RUN rpm-ostree install zsh vim && ostree container commit
