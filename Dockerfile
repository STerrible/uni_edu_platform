# Тут используем официальный образ Python 3.13
FROM python:3.13-slim

# Устанавливаем рабочую директорию
WORKDIR /app

# Тут копируем requirements и устанавливаем зависимости
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Тут копируем весь код приложения
COPY . .

# Тут открываем порт 8000 (внутри контейнера)
EXPOSE 8000

# Запуск (uvicorn без --reload для продакшена)
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]