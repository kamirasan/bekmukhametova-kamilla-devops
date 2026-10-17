# Base image with Python
FROM python:3.12-slim

# Working directory inside the container
WORKDIR /app

# Copy the application code into the image
COPY app/ /app/

# Create a non-root user to run the app
RUN useradd --create-home appuser && chown -R appuser /app

# Default values (can be overridden with -e at docker run)
ENV STUDENT_NAME=Kamilla \
    STUDENT_SURNAME=Bekmukhametova \
    STUDENT_GROUP=IT2-2313 \
    STUDENT_ID=38239 \
    APP_PORT=8000

USER appuser

# The app listens on port 8000
EXPOSE 8000

# Command that starts the application
CMD ["python", "app.py"]
