FROM python:3.13-slim

WORKDIR /app

RUN python -m venv venv
ENV PATH="/app/venv/bin:$PATH"

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
RUN pip show pytest
COPY . .

EXPOSE 5000
CMD ["python", "app.py"]