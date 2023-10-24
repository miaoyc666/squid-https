# PRODUCT_VERSION为版本信息，打包时通过外部环境变量传入，打包命令示例: make PRODUCT_VERSION=v1.0.1
PRODUCT_VERSION=v1.0.1
IMAGE=miaoyc/squid:${PRODUCT_VERSION}

image:
	docker build -f Dockerfile -t ${IMAGE} . --network host

push:
	docker push ${IMAGE}

.PHONY: image