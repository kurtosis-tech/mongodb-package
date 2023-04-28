MONGO_DB_PROTOCOL_NAME = "mongodb"
MONGO_DB_PORT_ID = "mongodb"

MONGO_DB_DEFAULT_PORT_NUMBER = 27017
MONGO_DB_PORT_NUMBER_ARG = "MONGO_DB_PORT_NUMBER"

MONGO_DB_DEFAULT_IMAGE_TAG = "mongo:6.0.5"
MONGO_DB_IMAGE_TAG_ARG = "MONGO_DB_IMAGE_TAG"

ENV_VARS_ARG_NAME = "env_vars"

def run(plan, args):
    mongo_db_image = args.get(MONGO_DB_IMAGE_TAG_ARG, MONGO_DB_DEFAULT_IMAGE_TAG)
    mongo_db_port_number = args.get(MONGO_DB_PORT_NUMBER_ARG, MONGO_DB_DEFAULT_PORT_NUMBER)
    env_vars = args.get(ENV_VARS_ARG_NAME, {})

    #Add a mongo db server
    mongo_db_service = plan.add_service(
        name="mongoDB",
        config=ServiceConfig(
            image=mongo_db_image,
            ports={
                MONGO_DB_PORT_ID: PortSpec(
                    number=mongo_db_port_number,
                    application_protocol=MONGO_DB_PROTOCOL_NAME
                ),
            },
            env_vars=env_vars,h
        ),
    )

    return mongo_db_service
