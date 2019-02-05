sources: build
	./Build dist

build:
	perl Build.PL

clean: build
	./Build distclean
	@rm -f nagios-plugins-rabbitmq-*.tar.gz RabbitMQ-API-*.tar.gz _build

install:
	mkdir -p $(DESTDIR)/usr/lib/nagios/plugins-rabbitmq
	cp scripts/* $(DESTDIR)/usr/lib/nagios/plugins-rabbitmq/
	rsync -a etc $(DESTDIR)

deb:
	docker build -t builder .
	docker run -it -v "$(pwd)/out":/out builder

#test:
#	./Build test
