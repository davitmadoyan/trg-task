FROM python:3.8-slim-buster

RUN mkdir work_repo
RUN cd work_repo

WORKDIR /work_repo

ADD hello_world.py .
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

CMD ["python", "-u", "hello_world.py"]
