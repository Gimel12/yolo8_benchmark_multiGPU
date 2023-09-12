# Installing the conda environment, downloading dataset and running the code
```bash
cd /home/bizon/
#wget https://www.dropbox.com/scl/fi/i0bta55fjdudgxt3lkyjt/healthcheck.zip?rlkey=hsqii5eob90bpu865zliyda8s&dl=0 # replace the link with the correct one
#mv xxxxx 
unzip yolo_dataset.zip
git clone https://github.com/technopremium/yolo8_benchmark_multiGPU.git
cd yolo8_benchmark_multiGPU
conda env create -f environment.yml
conda activate testenv 
pip install opencv-python
cd /home/bizon/healthcheck/ultralytics
```

# Parameters to run the training 
```bash
python train_test.py --batch 16 --device 0 1 --epochs 100
```

