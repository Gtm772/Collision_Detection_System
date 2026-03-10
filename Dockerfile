# 1. Base Image: You MUST use ubuntu:22.04 to prevent dependency conflicts[cite: 116, 117].
FROM ubuntu:22.04

# Avoid getting stuck at user prompts during the build process
ENV DEBIAN_FRONTEND=noninteractive

# 2. Install system dependencies (e.g., Python, pip, and any necessary C++ build tools)
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# 3. Set your working directory inside the container
WORKDIR /app

# 4. Copy your project files into the container
COPY . /app

# 5. Install your backend dependencies
RUN pip3 install --no-cache-dir -r requirements.txt

# 6. Port Binding: Port 8000 MUST be exported for the grading scripts[cite: 118].
# EXPOSE 8000
# ^^^ will do this when API is ready

# 7. Execution: Your app MUST bind to 0.0.0.0, not just localhost.
# (This example assumes you are using Uvicorn to run a FastAPI app from backend/main.py)
# CMD ["uvicorn", "backend.main:app", "--host", "0.0.0.0", "--port", "8000"]
# ^^^ will do this when API is ready
