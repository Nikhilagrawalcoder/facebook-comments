# Use the official Python 3.9 slim image as the base image
FROM python:3.9-slim

# Install Chromium and necessary dependencies
RUN apt-get update && apt-get install -y chromium

# Copy the application files
WORKDIR /app
COPY . /app

# Install the Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the ChromeDriver binary into the container
COPY chromium-driver/ /app/chromium-driver/

# Set the environment variable for ChromeDriver binary
ENV CHROME_BIN=/usr/bin/chromium

# Expose the app port
EXPOSE 10000

# Start the Flask application
CMD ["python", "app.py"]
