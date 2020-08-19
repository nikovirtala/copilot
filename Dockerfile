FROM amazonlinux:latest

RUN yum -y update && \
  yum -y install shadow-utils tar gzip jq && \
  yum clean all && \
  rm -rf /var/cache/yum

RUN adduser \
  -d /copilot \
  -m \
  -r \
  -U \
  copilot

WORKDIR /tmp

RUN COPILOT_VERSION=${COPILOT_VERSION:-$(curl -s https://api.github.com/repos/aws/copilot-cli/releases/latest | jq -r .tag_name | sed 's/v//g')} \
  && curl -sSLO https://github.com/aws/copilot-cli/releases/download/v${COPILOT_VERSION}/copilot_${COPILOT_VERSION}_linux_amd64.tar.gz \
  && tar -zxvf copilot_${COPILOT_VERSION}_linux_amd64.tar.gz \
  && rm -f copilot_${COPILOT_VERSION}_linux_amd64.tar.gz \
  && chmod +x copilot \
  && mv copilot /usr/local/bin/copilot

WORKDIR /copilot

USER copilot

ENTRYPOINT ["copilot"]
