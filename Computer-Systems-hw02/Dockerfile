# Dockerfile

# Базовий образ з Python
FROM python:3.10-slim

# Встановлюємо робочу директорію
WORKDIR /app

# Копіюємо залежності
COPY requirements.txt .

# Встановлюємо залежності(можна розбити на 2 частини щоб при пересборці меньше качало)
RUN apt-get update && apt-get install -y --no-install-recommends \
build-essential \
libpq-dev \
&& rm -rf /var/lib/apt/lists/* \
&& pip install --no-cache-dir -r requirements.txt

# Копіюємо весь проект 
COPY . .

# Mіняємо localhost на db
RUN sed -i 's/localhost/db/g' conf/db.py

# Відкриваємо порт
EXPOSE 8000

# ENTRYPOINT
ENTRYPOINT ["uvicorn"]

# CMD — аргументи за замовчуванням
CMD ["main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]


