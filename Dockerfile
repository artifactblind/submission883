FROM debian:latest

WORKDIR /root

RUN apt update && apt install -y --force-yes vim sagemath

COPY ./ /root/

RUN  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

RUN ulimit -s 65536

RUN pip install -r /root/security/requirements.txt

WORKDIR /root

CMD ["/bin/bash", "--login"]
