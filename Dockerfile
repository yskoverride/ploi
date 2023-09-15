# Use an official Python runtime as a parent image
FROM python:3.8-slim

# Set the working directory in docker
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends build-essential supervisor && \
    apt-get clean && \
    pip install rasa

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

ENV PORT=5005

EXPOSE 5005

# Start processes
CMD ["/usr/bin/supervisord"]