# Use official Python image as base
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Install dependencies
RUN apt-get update && apt-get install -y \
    git wget ffmpeg libsm6 libxext6 libgl1-mesa-glx && \
    rm -rf /var/lib/apt/lists/*

# Clone YOLOv5 repo
RUN git clone https://github.com/ultralytics/yolov5.git 

# Install required Python packages
RUN pip install --no-cache-dir -r /app/yolov5/requirements.txt

# Install PyTorch and OpenCV separately
RUN pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu
RUN pip install opencv-python-headless

# Copy required files
COPY script.py /app/script.py
COPY image.png /app/image.png

# Run inference
CMD ["python", "/app/script.py"]
