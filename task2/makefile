THIS_FILE := $(lastword $(MAKEFILE_LIST))
.PHONY: list build up start stop destroy restart logs

ifndef PORT
$(info PORT undefined setting to 8080)
PORT=8080
endif

export MH_EXPOSE_PORT = ${PORT}
list:
	@LC_ALL=C $(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/(^|\n)# Files(\n|$$)/,/(^|\n)# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'

build:
	docker compose build

up:
	docker compose up -d

start:
	docker compose start

stop:
	docker compose stop

destroy:
	docker compose down

restart:
	docker compose stop
	docker compose up -d

logs:
	docker compose logs --tail=100
