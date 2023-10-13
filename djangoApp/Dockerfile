# A light official Python runtime as a base image
FROM python:3.8-slim-buster

# Set necessary environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set the working directory to /app
RUN mkdir /app
WORKDIR /app

# Copy the requirements file into the container at /app
COPY requirements.txt .

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt

# Copy the rest of the application code into the container at /app
COPY . .

# Expose port 8000 for the Django app to listen on
EXPOSE 8000

# Migrate the database models
RUN python3 manage.py makemigrations --noinput
RUN python3 manage.py migrate --noinput

# Start the Django app when the container launches
CMD ["nohup","python3","manage.py","runserver","0.0.0.0:8000"]
