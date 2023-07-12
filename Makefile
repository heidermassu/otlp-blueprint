IMAGE_NAME := otlp-blueprint

build-all: build-backend build-frontend

build-backend:
	docker build -t $(IMAGE_NAME)-backend -f Backend.dockerfile .

build-frontend:
	docker build -t $(IMAGE_NAME)-frontend -f Frontend.dockerfile .

build-and-push-all: build-all push-backend push-frontend

push-backend:
	docker login
	docker tag $(IMAGE_NAME)-backend:latest heiderhengstmann/$(IMAGE_NAME)-backend:latest
	docker push heiderhengstmann/$(IMAGE_NAME)-backend:latest
	docker tag $(IMAGE_NAME)-backend:latest heiderhengstmann/$(IMAGE_NAME)-backend:$(shell date +'%Y%m%d%H%M%S')
	docker push heiderhengstmann/$(IMAGE_NAME)-backend:$(shell date +'%Y%m%d%H%M%S')

push-frontend:
	docker tag $(IMAGE_NAME)-frontend:latest heiderhengstmann/$(IMAGE_NAME)-frontend:latest
	docker push heiderhengstmann/$(IMAGE_NAME)-frontend:latest
	docker tag $(IMAGE_NAME)-frontend:latest heiderhengstmann/$(IMAGE_NAME)-frontend:$(shell date +'%Y%m%d%H%M%S')
	docker push heiderhengstmann/$(IMAGE_NAME)-frontend:$(shell date +'%Y%m%d%H%M%S')
