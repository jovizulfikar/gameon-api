DB_MIGRATION_PATH = db/migrations
DB_CONNECTION = postgresql://postgres:postgres@localhost:4321/gameon?sslmode=disable

COMPOSE_FILE = deployments/compose.dev.yaml
COMPOSE_NAMESPACE = gameon

migration:
	@read -p "Enter migration name: " name; \
	migrate create -ext sql -dir ${DB_MIGRATION_PATH} $${name}

migrate-up:
	migrate -path $(DB_MIGRATION_PATH) \
		-database ${DB_CONNECTION} \
		-verbose up

migrate-down:
	migrate -path $(DB_MIGRATION_PATH) \
		-database ${DB_CONNECTION} \
		-verbose down

compose-up:
	docker-compose -p ${COMPOSE_NAMESPACE} -f ${COMPOSE_FILE} up

compose-down:
	docker-compose -p ${COMPOSE_NAMESPACE} -f ${COMPOSE_FILE} down