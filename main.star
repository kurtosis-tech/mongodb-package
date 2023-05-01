NAME_ARG = "name"
USER_ARG = "user"
PASSWORD_ARG = "password"
IMAGE_ARG = "image"
ENV_VARS_ARG = "env_vars"

PORT_NAME = "mongodb"
PORT_NUMBER = 27017
PROTOCOL_NAME = "mongodb"

def run(plan, args):
    service_name = args.get(NAME_ARG, "mongoDB")
    image = args.get(IMAGE_ARG, "mongo:6.0.5")
    user = args.get(USER_ARG, "root")
    password = args.get(PASSWORD_ARG, "password")
    env_var_overrides = args.get(ENV_VARS_ARG, {})

    env_vars = {
        "MONGO_INITDB_ROOT_USERNAME": user,
        "MONGO_INITDB_ROOT_PASSWORD": password,
    }
    env_vars |= env_var_overrides

    # Add the server
    service = plan.add_service(
        name=service_name,
        config=ServiceConfig(
            image=image,
            ports={
                PORT_NAME: PortSpec(
                    number=PORT_NUMBER,
                    application_protocol=PROTOCOL_NAME
                ),
            },
            env_vars=env_vars,
        ),
    )

    url = "{protocol}://{user}:{password}@{hostname}:{port}/".format(
        protocol = PROTOCOL_NAME,
        user = user,
        password = password,
        hostname = service.hostname,
        port = PORT_NUMBER,
    )

    return struct(
        service=service,
        url=url,
    )
