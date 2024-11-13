FROM python:3.13-slim

WORKDIR /app

RUN python -m venv venv
RUN chmod +x /app/venv/bin/activate

ENV PATH="/app/venv/bin:$PATH"

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
COPY . .

EXPOSE 5000
CMD ["python", "app.py"]