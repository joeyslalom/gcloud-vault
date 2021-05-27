# https://cloud.google.com/sdk/docs/downloads-docker
FROM gcr.io/google.com/cloudsdktool/cloud-sdk:339.0.0

RUN apt-get install software-properties-common -y && \
    curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add - && \
    apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" && \
    apt-get update && apt-get install vault && \ 
    setcap cap_ipc_lock= /usr/bin/vault # https://github.com/hashicorp/vault/issues/10048
