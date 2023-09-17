# Use an official Python runtime as a parent image
FROM python:3.8-slim
#installation of prerequsites
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends build-essential supervisor && \
    apt-get clean && \
    pip install rasa

# Set the working directory in docker
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . .

USER 1001

ENTRYPOINT [ "rasa" ]

CMD [ "run", "--enable-api" , "--port" , "5005"]