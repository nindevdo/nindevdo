ARG TF_VERSION

FROM boltops/terraspace:alpine as terraform

ENV EXEC_PATH=/usr/local/bin
ENV PROVIDER=all

# Install base toolset
RUN apk --no-cache add \
  aws-cli \
  bash \
  build-base \
  cmake \
  curl \
  diffutils \
  gnupg \
  groff \
  inotify-tools \
  jq \
  parallel \
  py-pip \
  python3 \
  ruby-bundler \
  ruby-dev \
  ruby-json \
  ruby-unf_ext \
  zlib-dev

#Install tflint for linting terraform code https://github.com/terraform-linters/tflint
RUN curl -L "$(curl -Ls https://api.github.com/repos/terraform-linters/tflint/releases/latest | grep -o -E "https://.+?_linux_amd64.zip")" -o tflint.zip \
&& unzip tflint.zip \
&& rm tflint.zip \
&& chmod +x ./tflint \
&& mv tflint $EXEC_PATH/tflint

#Install terraform-docs for generating terraform documentation in automation
RUN curl -Lo ./terraform-docs https://github.com/segmentio/terraform-docs/releases/download/v0.9.1/terraform-docs-v0.9.1-$(uname | tr '[:upper:]' '[:lower:]')-amd64 \
&& chmod +x ./terraform-docs \
&& mv ./terraform-docs $EXEC_PATH/terraform-docs

#Install terraformer for importing terraform code
RUN curl -LO https://github.com/GoogleCloudPlatform/terraformer/releases/download/$(curl -s https://api.github.com/repos/GoogleCloudPlatform/terraformer/releases/latest | grep tag_name | cut -d '"' -f 4)/terraformer-${PROVIDER}-linux-amd64 \
&& chmod +x terraformer-${PROVIDER}-linux-amd64 \
&& mv terraformer-${PROVIDER}-linux-amd64 $EXEC_PATH/terraformer

RUN git clone https://github.com/tfutils/tfenv.git ~/.tfenv \
&& ln -s ~/.tfenv/bin/* ${EXEC_PATH} \
&& echo 'trust-tfenv: yes' > ~/.tfenv/use-gpgv \
&& tfenv install ${TF_VERSION} \
&& tfenv use ${TF_VERSION}

#Install tgenv
RUN git clone https://github.com/cunymatthieu/tgenv.git ~/.tgenv && ln -s ~/.tgenv/bin/* ${EXEC_PATH}

#Install terraform-landscape https://github.com/coinbase/terraform-landscape
RUN gem install --no-document --no-document terraform_landscape terraspace