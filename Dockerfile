FROM amazon/aws-cli:latest

# Install Kubectl
COPY kubernetes.repo /etc/yum.repos.d/kubernetes.repo
RUN yum install -y kubectl && yum clean all

ENTRYPOINT []
