# Docker to generate containers for assembly tests.
FROM ubuntu

# Eliminate LANG questions
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install bash python3-dev python3-pip 
RUN apt install python-is-python3

RUN pip3 install --upgrade pip

# Enable Jupyter
RUN pip3 install matplotlib scikit-learn==1.0 jupyter

ENV HOME=/home/jenkins
ENV PATH=.:$PATH:$HOME
ENV JUPYTER_PATH=$HOME

# Copy local scripts and modules
COPY *.py $HOME/
COPY *.ipynb $HOME/

WORKDIR $HOME

RUN chmod a+rx $HOME/*.*

CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0",  "--allow-root"]
