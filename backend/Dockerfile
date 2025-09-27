FROM python:3.11-slim

WORKDIR /app

RUN apt-get update && apt-get install -y gcc libssl-dev \
    && apt-get purge -y gcc libssl-dev \
    && apt-get install -y netcat-openbsd \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

RUN echo '#!/bin/bash\n\
until nc -z $MYSQL_HOST $MYSQL_PORT; do\n\
  echo "Waiting database..."\n\
  sleep 1\n\
done\n\
echo "DATABASE is available"\n\
exec "$@"' > /wait-for.sh && chmod +x /wait-for.sh

COPY . .

RUN pip install --no-cache-dir -r requirements.txt

CMD ["/wait-for.sh", "python", "run.py"]
