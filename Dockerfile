FROM ubuntu:latest
FROM python:3.12
FROM django
WORKDIR /app
COPY /rep1/cards /app
COPY /rep1/flashcards /app
COPY /rep1/manage.py /app
COPY /rep1/requirements.txt /app
COPY /rep1/venv /app
COPY /rep1/pip1 /app
ENTRYPOINT ["source", "/venv/bin/activate"]
ENTRYPOINT ["pip", "install", "--no-index", "--find-links=/pip1", "-r", "requirements.txt"]
ENTRYPOINT ["python", "manage.py", "makemigrations"]
ENTRYPOINT ["python","manage.py", "migrate"]
ENTRYPOINT ["python", "manage.py", "runserver"]