FROM python:3.12.5-slim

RUN apt-get update -y
RUN apt-get install -y git make

RUN git clone https://github.com/tcgoetz/GarminDB.git
WORKDIR GarminDB
RUN git checkout develop
RUN pip3 install --no-cache-dir yacron setuptools
RUN sed 's/fitfile>=1.1.10//g' -i requirements.txt
RUN pip3 install git+https://github.com/tcgoetz/Fit.git@develop
RUN python setup.py install

ADD crontab.yml /crontab.yml
WORKDIR /

CMD ["yacron", "-c", "/crontab.yml"]
