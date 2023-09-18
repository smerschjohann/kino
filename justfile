
build-kino:
    #!/bin/bash
    mkdir -p cache

    # first build:
    sudo rpm-ostree compose image -i --cachedir=cache fedora-kino.yaml fedora-kino.ociarchive

upload-container:
    #!/bin/bash
    echo "NOTE: assuming credentials are already present"

    rpm-ostree compose container-encapsulate --repo=repo fedora/39/x86_64/kino



