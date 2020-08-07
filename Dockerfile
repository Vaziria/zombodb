FROM postgres:11

RUN apt-get update
RUN apt-get install git make libz-dev gcc g++ libcurl4-openssl-dev postgresql-server-dev-11 -y

RUN git clone --depth 1 https://github.com/zombodb/zombodb.git

RUN cd zombodb &&  make clean install

RUN rm -rf zombodb 

RUN apt-get purge git make gcc g++ libz-dev libcurl4-openssl-dev postgresql-server-dev-11 -y

EXPOSE 5432

CMD ["postgres"]
