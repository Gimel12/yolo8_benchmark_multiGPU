#!/bin/bash

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo "git is not installed. Please install git first."
    exit 1
fi

# Check if conda is installed
if ! command -v conda &> /dev/null; then
    echo "conda is not installed. Please install conda first."
    exit 1
fi

# Check if pip is installed
if ! command -v pip &> /dev/null; then
    echo "pip is not installed. Please install pip first."
    exit 1
fi

# Check if unzip is installed
if ! command -v unzip &> /dev/null; then
    echo "unzip is not installed. Please install unzip first."
    exit 1
fi

# Navigate to /home/bizon
cd /home/bizon/

# Check if repository exists. If not, clone it.
if [ ! -d "yolo8_benchmark_multiGPU" ]; then
    git clone https://github.com/technopremium/yolo8_benchmark_multiGPU.git
else
    echo "yolo8_benchmark_multiGPU already exists. Skipping clone."
fi

cd yolo8_benchmark_multiGPU

# Check and create conda environment
if ! conda info --envs | grep testenv &> /dev/null; then
    conda env create -f environment.yml
else
    echo "Conda environment 'testenv' already exists. Skipping environment creation."
fi

# Copy healthcheck.zip to /home/bizon/
if [ ! -f "/home/bizon/healthcheck.zip" ]; then
    cp healthcheck.zip /home/bizon/
else
    echo "healthcheck.zip already exists in /home/bizon/. Skipping copy."
fi

cd /home/bizon/

# Unzip healthcheck.zip if the healthcheck directory doesn't exist
if [ ! -d "healthcheck" ]; then
    unzip healthcheck.zip
else
    echo "healthcheck directory already exists. Skipping unzip."
fi

# ...

# ...

# Check if the alias already exists
if grep -q "dl-SOCram()" ~/.bashrc; then
    echo "Alias dl-SOCram already exists in ~/.bashrc. Skipping alias creation."
else
    # Create the alias command
    alias_command="dl-SOCram() {\
      read -p 'Enter GPUs to use (e.g., 0,1,2,3): ' GPUs;\
      read -p 'Enter batch size (e.g., 8): ' batch_size;\
      read -p 'Enter number of epochs (e.g., 60): ' epochs;\
      cd /home/bizon/healthcheck/ultralytics && conda activate testenv && python train_test.py --batch \$batch_size --device \$GPUs --epochs \$epochs;\
    }"

    # Append to .bashrc
    echo "$alias_command" >> ~/.bashrc

    # Source .bashrc to make the alias available immediately
    source ~/.bashrc

    echo "Function dl-SOCram has been added and is now available. Use it to run the model with your specified parameters."
fi


# Activate conda environment
#source /home/bizon/anaconda3/etc/profile.d/conda.sh
#conda activate testenv


# Final Instructions
echo "==============================================="
echo "Setup completed!"
echo "- To run the test, use the following command:"
echo -e "- Activate the environment with \033[1;31mconda activate testenv\033[0m ."
echo -e "- Function \033[1;31mdl-SOCram\033[0m has been added and is now available. Use it to run the model with your specified parameters."
echo "- This command trains the model with a batch size of 8 on device 0 (typically GPU 0) for 60 epochs."
echo "==============================================="

echo "==============================================="
echo "Parameters Explanation!"
echo -e "  \033[1;31m--batch\033[0m: Batch size for training. E.g., 8.The bigger the batch size, the more Vram the GPU will use."
echo -e "  \033[1;31m--device\033[0m: GPU devices to use. E.g., 0 or 0,1,2,3."
echo -e "  \033[1;31m--epochs\033[0m: Number of training iterations. E.g., 60."
echo "==============================================="

