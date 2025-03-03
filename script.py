import torch
import cv2
import numpy as np
from PIL import Image
from pathlib import Path
from matplotlib import pyplot as plt

# Load YOLOv5 model
model = torch.hub.load('ultralytics/yolov5', 'yolov5s', pretrained=True)

# Load image
img_path = "image.png"
img = Image.open(img_path)

# Perform inference
results = model(img)

# Print results
results.print()

# Save and show results
results.save()

# Display image with bounding boxes
plt.imshow(np.array(img))
plt.axis("off")
plt.show()
