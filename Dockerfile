FROM pypy:3.9

# install dev-tools to build scipy and scikit-learn
RUN apt-get -y update \
 && apt-get install -y -qq --no-install-recommends \
    gfortran \
    libopenblas-dev \
    libgomp1 \
    ca-certificates \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
 && rm -rf /tmp/* /var/tmp/*

RUN pypy3 -m pip install --upgrade pip  

# install requirements (scipy and scikit)
COPY requirements.txt ./
RUN pypy3 -m pip install -r requirements.txt --no-cache

