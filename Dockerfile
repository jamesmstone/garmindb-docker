FROM python:3.12.5-slim

RUN pip3 install --no-cache-dir garmindb yacron

ADD crontab.yml /crontab.yml

CMD ["yacron", "-c", "/crontab.yml"]
