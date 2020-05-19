.PHONY: docker
docker: Dockerfile
	docker build -t pronto-credo .
