FROM ubuntu:latest

RUN apt update -y && apt install -y curl
RUN apt install -y gnupg
RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
RUN echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list
RUN apt update -y && apt install -y \
	telnet net-tools dnsutils tcpdump inetutils-ping vim wget ssh kubectl python python-pip tmux
RUN pip install awscli
COPY .tmux.conf /root/.tmux.conf

CMD tail -f /dev/null

