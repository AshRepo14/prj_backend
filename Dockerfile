FROM python:3.8-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN pip install --upgrade pip
RUN pip install numpy
RUN pip install gunicorn

WORKDIR /app
COPY . /app

RUN pip install -r requirements.txt

COPY ./entrypoint.sh .
ENTRYPOINT [ "sh","/app/entrypoint.sh" ]

EXPOSE 8000