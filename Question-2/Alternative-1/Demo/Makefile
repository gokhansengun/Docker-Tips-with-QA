up:
	docker-compose up -d web
	sleep 1
	docker-compose scale web=3
	sleep 1
	docker-compose up -d lb

ps:
	docker-compose ps

clean:
	docker-compose down -v --rmi local

rm:
	docker-compose rm -f

logs:
	docker-compose logs -f
