FROM python:3.8

RUN apt-get update && apt-get install -y \
    sqlite3 \
    && rm -rf /var/lib/apt/lists/*


WORKDIR /app


RUN pip install Flask
RUN pip install Flask-HTTPAuth

COPY . .

EXPOSE 8080

ENV FLASK_APP=src/softdes.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_RUN_PORT=8080

CMD ["sh", "setup.sh"]
