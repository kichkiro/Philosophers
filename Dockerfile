FROM bitnami/minideb:bookworm

RUN apt-get update && \
	apt-get install -y build-essential && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app

COPY project/ philosophers/

WORKDIR /usr/src/app/philosophers/philo

RUN make

WORKDIR /usr/src/app/philosophers/philo_bonus

RUN make

ENTRYPOINT [ "tail", "-f" ]
