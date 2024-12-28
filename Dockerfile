FROM    --platform=linux/amd64 ubuntu:22.04

# installing docker
RUN     apt-get -y update
RUN     apt-get -y install \
        ca-certificates \
        curl \
        gnupg \
        lsb-release

RUN     mkdir -p /etc/apt/keyrings
RUN     curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg

RUN     echo \
        "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

RUN     apt-get -y update
RUN     apt-get -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin

# installing kubectl
RUN     apt-get update
RUN     apt-get install -y apt-transport-https ca-certificates curl 
# RUN     curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://dl.k8s.io/apt/doc/apt-key.gpg
# RUN     echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | tee /etc/apt/sources.list.d/kubernetes.list
RUN     curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.28/deb/Release.key | gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
RUN     echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.28/deb/ /' | tee /etc/apt/sources.list.d/kubernetes.list
RUN     apt-get update
# RUN     apt-get install -y kubectl
RUN     apt install -y kubeadm=1.28.1-1.1 kubelet=1.28.1-1.1 kubectl=1.28.1-1.1

# installing other dependencies
RUN     apt-get install conntrack

# installing minikube
RUN     curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
        && chmod +x minikube

RUN     mkdir -p /usr/local/bin/
RUN     install minikube /usr/local/bin/

CMD     tail -F /dev/null
