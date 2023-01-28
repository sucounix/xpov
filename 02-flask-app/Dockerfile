FROM python:3.9-slim-bullseye AS build

WORKDIR /app

RUN pip install --upgrade pip

RUN pip install 'poetry==1.1.6'

COPY poetry.lock .
COPY pyproject.toml .

RUN poetry export --without-hashes --format requirements.txt -o requirements.txt

FROM python:3.10.0-slim-bullseye AS app

WORKDIR /app

RUN pip install --upgrade pip && \
    pip install --no-cache-dir gunicorn

RUN apt-get update && \
    apt-get install python3-dev \
                    libpq-dev \
                    gcc \
                    gnupg \
                    postgresql-client \
                    curl \
                    wget \
                    apt-transport-https -y && \
    rm -rf /var/lib/apt/lists/*

COPY --from=build /app/requirements.txt .

RUN pip install -r requirements.txt

COPY . .

ENV PYTHONPATH=/app
ENV WORKERS=1
ENV ENV=development

RUN adduser --shell /bin/sh appuser && \
  chown -R appuser:appuser .

#USER appuser
EXPOSE 5000

# TODO: remove migration
HEALTHCHECK CMD curl --fail http://localhost:5000/api/docs || exit 1

CMD ["sh", "-c", "gunicorn --bind=0.0.0.0:5000 --workers=$WORKERS --env ENV=$ENV --preload wsgi:app"]
