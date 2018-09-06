build:
	docker build -t phpunit:latest .
	docker tag phpunit:latest royge/phpunit:latest
	docker build -t phpunit:php5.6 ./php5.6
	docker tag phpunit:php5.6 royge/phpunit:php5.6

push:
	docker push royge/phpunit:latest
	docker push royge/phpunit:php5.6

prepare:
	curl -LO https://storage.googleapis.com/container-structure-test/latest/container-structure-test-linux-amd64 && chmod +x container-structure-test-linux-amd64 && sudo mv container-structure-test-linux-amd64 /usr/local/bin/container-structure-test

test:
	container-structure-test test \
		--image phpunit:latest \
		--config test-config.yaml
	container-structure-test test \
		--image phpunit:php5.6 \
		--config php5.6/test-config.yaml
