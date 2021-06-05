ARG TF_VERSION

FROM "hashicorp/terraform:${TF_VERSION}" as terraform

ENV EXEC_PATH=/usr/local/bin
ENV PROVIDER=all

# Install base toolset
RUN apk --no-cache add \
  bash \
  build-base \
  curl \
  gnupg \
  groff \
  inotify-tools \
  jq \
  parallel \
  py-pip \
  python3 \
&& pip install awscli

# install tflint for linting terraform code https://github.com/terraform-linters/tflint
RUN curl -L "$(curl -Ls https://api.github.com/repos/terraform-linters/tflint/releases/latest | grep -o -E "https://.+?_linux_amd64.zip")" -o tflint.zip \
&& unzip tflint.zip \
&& rm tflint.zip \
&& chmod +x ./tflint \
&& mv tflint $EXEC_PATH/tflint

RUN curl -Lo ./terraform-docs https://github.com/segmentio/terraform-docs/releases/download/v0.9.1/terraform-docs-v0.9.1-$(uname | tr '[:upper:]' '[:lower:]')-amd64 \
&& chmod +x ./terraform-docs \
&& mv ./terraform-docs $EXEC_PATH/terraform-docs

RUN curl -LO https://github.com/GoogleCloudPlatform/terraformer/releases/download/$(curl -s https://api.github.com/repos/GoogleCloudPlatform/terraformer/releases/latest | grep tag_name | cut -d '"' -f 4)/terraformer-${PROVIDER}-linux-amd64 \
&& chmod +x terraformer-${PROVIDER}-linux-amd64 \
&& mv terraformer-${PROVIDER}-linux-amd64 $EXEC_PATH/terraformer

# install tfenv
COPY ./.terraform-version /$USER/.tfenv/version

RUN git clone https://github.com/tfutils/tfenv.git ~/.tfenv \
&& ln -s ~/.tfenv/bin/* /usr/local/bin \
&& echo 'trust-tfenv: yes' > ~/.tfenv/use-gpgv \
&& tfenv install $(cat $USER/.tfenv/version)

# install tgenv
RUN git clone https://github.com/cunymatthieu/tgenv.git ~/.tgenv && ln -s ~/.tgenv/bin/* /usr/local/bin

# install terraform-landscape https://github.com/coinbase/terraform-landscape
RUN apk --no-cache add \
  ruby-bundler \
  ruby-json \
  diffutils \
&& gem install --no-document --no-document terraform_landscape