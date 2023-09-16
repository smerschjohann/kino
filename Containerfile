ARG IMAGE_NAME="${IMAGE_NAME:-kinoite}"
ARG SOURCE_IMAGE="${SOURCE_IMAGE:-kinoite}"
ARG BASE_IMAGE="quay.io/fedora-ostree-desktops/${SOURCE_IMAGE}"
ARG FEDORA_MAJOR_VERSION="${FEDORA_MAJOR_VERSION:-38}"
FROM ${BASE_IMAGE}:${FEDORA_MAJOR_VERSION} AS main 


# note: we use seperate RUN commands here, which will allow caching on local podman runs,
# the CI pipeline squashes all layers into a single one, so that BASE + this build is uploaded to GHCR

RUN rpm-ostree install distrobox
RUN rpm-ostree install pip
RUN rpm-ostree uninstall firefox firefox-langpacks
RUN ostree container commit

