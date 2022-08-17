FROM python:3.9-slim-buster
#ADD app.py ./app
COPY . ./app
WORKDIR /app
RUN pip3 install Flask
EXPOSE 5000
CMD [ "python3", "./app.py" ]