# Development environment

This repository allows you to setup a docker environment to run your code in without adding any dockerfiles to the code. The main use case for this repository was to get some older ruby projects working on M1 machines and to get code working on specific buildpacks.

## Getting started

```sh
git clone https://github.com/apricot13/simple_ror_environment && cd simple_ror_environment

# clone your code into the folder application
git clone project application

# create .env file in root from .env.example
# create .env file in your project copy info from root .env.example


# update your database.yml and development.rb files in your application
# see containers/ruby/initializers for examples

# update docker-compose.development.yml volume name (unless you're sharing a database with another instance)

# build the images (only need to do this once)
make build

# start the images
make start

# load the shell and run any database setup scripts and seed files
make shell

# run the application
make run
```

## .env files

The `.env` file in the root contains the information that docker will use to create things like the database etc.

You will need to use these values again in your projects `.env` file

```
DATABASE_URL=postgresql://db_user:db_password@postgres:5432/db_name?timeout=5000
PROJECT_NAME=project_name

# You would typically use rake secret to generate a secure token. It is
# critical that you keep this value private in production.
SECRET_TOKEN=<random string>
```

## Access the shell from the cli

```sh
# Access the shell for ruby container
make shell

# Acces the shell for postgres container
make shell c=postgres
```

## Notes

**Init method**
In the original repository there is an init method to create a new app from scratch, I've removed this in here since we already have our app and just need a development environment. I have however left in the initializers folder to have a reference for what changes we may need to make in our application code to get this environment working.

**nginx**
nginx isn't always needed I have left the dockerfiles in here but you can only run one nginx container at once on your machine anyway. Its useful though if you need a more complicated setup.
