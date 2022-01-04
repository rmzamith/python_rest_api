FROM python:3.7

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install libsasl2-dev python-dev libssl-dev gettext-base -y

COPY ./app /app
WORKDIR /app

RUN pip install -r requirements.txt

RUN apt purge -y libsasl2-dev python-dev libldap2-dev libssl-dev gettext-base && \
    apt autoremove -y

CMD ["./server.py"]