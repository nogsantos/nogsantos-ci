FROM alpine

ARG TERRAFORM_VERSION=0.13.5

RUN apk --update --no-cache add libc6-compat python3-dev py3-pip curl -q

# WORKDIR /usr/local/bin

RUN curl https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -o terraform_${TERRAFORM_VERSION}_linux_amd64.zip

RUN  unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip

RUN mv terraform /usr/local/bin

RUN rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip

RUN curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"

RUN chmod +x kubectl 

RUN mv kubectl /usr/local/bin

