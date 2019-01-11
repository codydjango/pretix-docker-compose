FROM python:3.6-alpine

COPY . /app

RUN apk add bash
#RUN pip install --upgrade pip && pip install --no-cache-dir django

SHELL ["/bin/bash", "-c"]
EXPOSE 8000
ENV DJANGO_SETTINGS_MODULE=settings

WORKDIR /app/pretix
ENTRYPOINT ["/app/pretix/docker-entrypoint.sh"]

#CMD ["bash"]
#ENTRYPOINT ["python", "manage.py"]
#CMD ["runserver", "0.0.0.0:8000"]
#RUN pip install -r requirements.txt