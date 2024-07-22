# pull official base image
FROM python:3.11.4-slim-buster

# set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# set work directory
WORKDIR /app

# update packages
RUN apt-get update

# install psycopg2 dependencies
RUN apt-get -y install libpq-dev gcc

# update pip
RUN pip install --upgrade pip
RUN pip install poetry poetry-plugin-export

# copy dependencies
COPY pyproject.toml /app/
COPY poetry.lock /app/

# install dependencies
RUN poetry export --without-hashes --with dev -f requirements.txt -o /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

# start script
COPY . /app/
COPY .env /app/
RUN chmod +x start.sh

CMD ["bash", "start.sh"]
