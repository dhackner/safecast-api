FROM django:1.9.4

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install build-essential binutils libproj-dev python-dev libyaml-dev
RUN apt-get -y install postgresql-9.4-postgis-2.1 postgresql-contrib postgis libpq-dev gdal-bin libgeos-dev libgeos-c1 python-gdal
ENV GEOS_LIBRARY_PATH '/usr/lib/libgeos_c.so'


RUN pip install --upgrade pip

ADD . /usr/src/app
WORKDIR /usr/src/app
RUN pip install -r /usr/src/app/requirements.txt
