# syntax=docker/dockerfile:1

ARG fromImage

FROM $fromImage
WORKDIR /app

# Installing dependencies
RUN apt update -y
RUN apt install make gosu -y

COPY app/requirements.txt ./
COPY app/Makefile ./
COPY app/entrypoint.sh /usr/local/bin/entrypoint.sh

COPY app/jupyter-lab-default.json /opt/conda/share/jupyter/lab/settings/overrides.json

RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

RUN make compile

CMD make run
