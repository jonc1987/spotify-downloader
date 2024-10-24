# Use an official Python runtime as a base image
FROM python:3.10-slim

# Set the working directory
WORKDIR /app

# Copy the requirements and install them
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Install ffmpeg
RUN apt-get update && apt-get install -y ffmpeg

# Run spotDL command on container start (e.g., download a song)
CMD ["spotdl", "download", "https://open.spotify.com/track/3uUuGVFu1V7jTQL60S1r8z?si=afeb051425674185"]

