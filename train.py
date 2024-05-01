import json
import os
os.environ['MKL_SERVICE_FORCE_INTEL'] = '1' ## comment this if using AMD CPUs 
import numpy as np
from ultralytics import YOLO

# Load configuration from JSON file
with open('config.json', 'r') as config_file:
    config = json.load(config_file)

batch_size = config['batch_size']
epochs = config['epochs']
devices = config['devices']

# Load a model
model = YOLO("yolov8l.yaml")  # build a new model from scratch
model = YOLO("yolov8l.pt")    # load a pretrained model

# Train the model
results = model.train(data="VisDrone.yaml", epochs=epochs, imgsz=1152,
                      batch=batch_size, device=devices, name='yolov8l_test', cache=False, close_mosaic=8,
                      project="yolov8l_20230618", flipud=0.4, fliplr=0.4,
                      degrees=10.487, translate=0.12953, scale=0.25, shear=0.18715, mixup=0.0, mosaic=1.0,
                      patience=40, resume=False, overlap_mask=True)
