ARG TF_VERSION

FROM boltops/terraspace:alpine as terraform

ENV EXEC_PATH=/usr/local/bin
ENV PROVIDER=all

# Install base toolset
RUN apk --no-cache add \
  aws-cli \
  bash \
  # build-base \
  # cmake \
  curl \
  # diffutils \
  gnupg
  # groff \
  # inotify-tools \
  # jq \
  # parallel \
  # py-pip \
  # python3 \
  # ruby-bundler \
  # ruby-dev \
  # ruby-json \
  # ruby-unf_ext \
  # zlib-dev

#Install terraform-docs for generating terraform documentation in automation
RUN curl -Lo ./terraform-docs https://github.com/segmentio/terraform-docs/releases/download/v0.9.1/terraform-docs-v0.9.1-$(uname | tr '[:upper:]' '[:lower:]')-amd64 \
&& chmod +x ./terraform-docs \
&& mv ./terraform-docs $EXEC_PATH/terraform-docs

RUN git clone https://github.com/tfutils/tfenv.git ~/.tfenv \
&& ln -s ~/.tfenv/bin/* ${EXEC_PATH} \
&& echo 'trust-tfenv: yes' > ~/.tfenv/use-gpgv \
&& tfenv install ${TF_VERSION} \
&& tfenv use ${TF_VERSION}