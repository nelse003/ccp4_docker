FROM ubuntu

RUN apt-get -qq update
#RUN apt-get -qq -y install vim tar sudo gcc g++ gfortran m4 tk8.4 tcl8.4 python2.7 git wget bzip2 tar expect

RUN sudo echo Europe/London >/etc/timezone && \
RUN sudo dpkg-reconfigure -f noninteractive tzdata

RUN apt-get -qq -y install vim tar sudo gcc g++ gfortran m4 python2.7 git wget bzip2 tar expect
RUN wget http://devtools.fg.oisin.rc-harwell.ac.uk/nightly/ccp4-linux64-latest.tar.bz2
RUN bunzip2 ccp4-linux64-latest.tar.bz2
RUN mkdir ./ccp4
RUN tar -xf ccp4-linux64-latest.tar -C ./ccp4 --strip-components=1

ADD ccp4.setup-sh ./ccp4/bin
#RUN /bin/bash -c "source /ccp4/bin/ccp4.setup-sh"

ADD pandda_update /
RUN /pandda_update

#CMD ["source", "/ccp4/bin/ccp4.setup-sh"] 
#CMD ["ccp4-python", "-m", "pip", "uninstall", "panddas"]
#CMD ["ccp4-python", "-m", "pip", "install", "panddas"]

CMD ["ccp4/start"]
