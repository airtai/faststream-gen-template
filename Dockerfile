FROM python:3.9-slim-bullseye

SHELL ["/bin/bash", "-c"]
WORKDIR /project

ADD app /project/app
COPY requirements.txt /project/

RUN pip install --no-cache-dir -r /project/requirements.txt

CMD ["faststream", "run", "--workers", "1", "app.application:app"]
