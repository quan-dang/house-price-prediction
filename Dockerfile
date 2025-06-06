FROM python:3.8

# Create a folder /app if it doesn't exist,
# the /app folder is the current working directory
WORKDIR /app

COPY ./requirements.txt /app

# Disable pip cache to shrink the image size a little bit,
# since it does not need to be re-installed
RUN pip install -r requirements.txt --no-cache-dir

# Copy necessary files to our app
COPY ./main.py /app

COPY ./models /app/models

# Set MODEL_DIR env variable
ENV MODEL_PATH=/app/models/model.pkl

# Port will be exposed, for documentation only
EXPOSE 30000

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "30000"]