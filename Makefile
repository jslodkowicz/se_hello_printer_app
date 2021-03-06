.PHONY: test

deps:
	pip install -r requirements.txt; \
	pip install -r test_requirements.txt

lint:
	flake8 hello_world test

test:
	PYTHONPATH=. py.test --verbose -s
test_cov:
	PYTHONPATH=. py.test --verbose -s --cov=.
test_xunit:
	PYTHONPATH=. py.test -s --cov=. --cov-report xml --junit-xml=test_results.xml
run:
	PYTHONPATH=. FLASK_APP=hello_world flask run
docker_build:
	docker build -t hello_world_printer .
docker_run: docker_build
	docker run \
		--name hello_world_printer_dev \
		-p 5000:5000 \
		-d hello_world_printer
