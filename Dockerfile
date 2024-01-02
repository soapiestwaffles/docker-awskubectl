FROM amazon/aws-cli:2.15.6

# Install Kubectl
COPY kubernetes.repo /etc/yum.repos.d/kubernetes.repo
RUN yum install -y kubectl && yum clean all

ENTRYPOINT []
