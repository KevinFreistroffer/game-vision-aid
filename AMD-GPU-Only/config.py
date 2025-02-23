# Configuration for BetterCam Screen Capture and YOLO model

# Screen Capture Settings
screenWidth = 640  # Increased resolution
screenHeight = 640  # Increased resolution

# Object Detection Settings
confidenceThreshold = 0.2  # Lowered confidence threshold
nmsThreshold = 0.4  # Non-max suppression threshold

# YOLO Model Settings
modelType = 'torch'  # Choose 'torch' or 'onnx' based on the model you want to load
torchModelPath = '../models/fn_v5.pt'  # Path to YOLOv5 PyTorch model
onnxModelPath = '../models/model_fn_v5v5320320Half.onnx'  # Path to YOLOv5 ONNX model

# BetterCam Settings
targetFPS = 30  # Reduced FPS for better stability
maxBufferLen = 256  # Reduced buffer length
region = None  # Region for capture (set to None for full screen)
useNvidiaGPU = False  # Set to False If you do not have NVidia GPU

# Colors for Bounding Boxes
boundingBoxColor = (0, 255, 0)  # Default bounding box color in BGR format
highlightColor = (0, 0, 255)  # Color for highlighted objects
