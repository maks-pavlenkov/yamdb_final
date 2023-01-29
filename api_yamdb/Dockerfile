FROM python:3.9.5-slim-buster

WORKDIR /app

COPY api_yamdb/requirements.txt .

RUN pip3 install -r requirements.txt --no-cache-dir

COPY . .

CMD ["sh", "start_server.sh"]
