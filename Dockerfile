# Use the official Python image from the Docker Hub
FROM python:3.10-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Install gunicorn
RUN pip install gunicorn

# Expose port 80 (adjust if your app uses a different port)
EXPOSE 8000

# Command to run the application using gunicorn for the Flask app and python for the bot
CMD ["sh", "-c", "gunicorn app:app & python3 bot.py"]
