FROM python:3.8-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN pip install --upgrade pip
RUN pip install numpy
RUN pip install gunicorn
# testing
RUN ls -lah
RUN pwd
RUN tree -L 2
RUN ls -la $(pwd)

WORKDIR /app
# testing
RUN pwd
RUN ls -lah $(pwd)

COPY . /app

RUN pwd
RUN ls -lah $(pwd)
RUN tree -L 2

RUN pip install -r requirements.txt

RUN pwd
RUN ls -la $(pwd)

COPY ./entrypoint.sh .
ENTRYPOINT [ "sh","/app/entrypoint.sh" ]

EXPOSE 8000
