FROM selenium/standalone-chrome-debug:3.141.59-radium

USER root

COPY apt.conf /etc/apt/apt.conf

RUN sudo apt-get update
RUN sudo apt-get install -y python-pip
RUN pip install robotframework-seleniumlibrary
RUN pip install robotframework-pabot
