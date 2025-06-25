FROM python:3.13-slim

WORKDIR /app

# Копируем только requirements.txt сначала для кэширования
COPY requirements.txt .

# Устанавливаем зависимости
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Копируем остальные файлы проекта
COPY . .

# Устанавливаем пакет (если он setup как пакет)
RUN if [ -f "setup.py" ]; then pip install --no-cache-dir .; fi

ENTRYPOINT ["mtslinker"]

