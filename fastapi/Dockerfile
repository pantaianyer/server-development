# This is a dockerfile for FastAPI server deployments
# Project: https://gitlab.com/richardnagy/container-environments/server-deployments

FROM python:3.10

# Expose api ports (http, https)
EXPOSE 80 443

# Move source (except files in .dockerignore)
WORKDIR /app
COPY . .

# Install dependencies
RUN pip install --no-cache-dir --upgrade -r requirements.txt
#RUN pip install --no-cache-dir --upgrade -r pip.lock

# Start command
ENTRYPOINT [ "uvicorn", "server:app", ]
CMD [ "--host", "0.0.0.0", "--port", "80" ]

#ENTRYPOINT [ "python3", "server.py" ]
#CMD [ "0.0.0.0", "80" ]

#ENTRYPOINT [ "python3", "." ]
#CMD [ "0.0.0.0", "80" ]
