FROM lambci/lambda:python3.6

USER root

ENV APP_DIR /var/task

WORKDIR $APP_DIR

COPY requirements.txt .
COPY lib ./lib

RUN mkdir -p $APP_DIR/lib
RUN pip3 install -r requirements.txt -t /var/task/lib
