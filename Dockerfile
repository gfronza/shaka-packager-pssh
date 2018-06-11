FROM google/shaka-packager:latest

RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN python get-pip.py
RUN pip install six

WORKDIR src/packager/third_party/protobuf/python

ENV PATH /shaka_packager/src/out/Release:$PATH
RUN python setup.py build

WORKDIR /shaka_packager/src/packager/tools/pssh

COPY pssh-box.py pssh-box.py
COPY entrypoint.sh entrypoint.sh

ENTRYPOINT ["sh", "/shaka_packager/src/packager/tools/pssh/entrypoint.sh"]