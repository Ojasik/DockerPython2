FROM python:3.13-slim

WORKDIR /app

RUN python -m venv venv
ENV PATH="/venv/bin:$PATH"

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
COPY . .

EXPOSE 5000
CMD ["python", "app.py"]