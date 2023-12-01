# Automated mode 
```bash
/bin/bash -c "$(curl -fsSL https://bizon-vm.s3.amazonaws.com/Install_yolo_training.sh)"
```


# Installing the conda environment, downloading dataset and running the code `Manually`
```bash
cd /home/bizon/
git clone https://github.com/technopremium/yolo8_benchmark_multiGPU.git
cd yolo8_benchmark_multiGPU
conda env create -f environment.yml
conda activate testenv 
cp healthcheck.zip /home/bizon/
cd /home/bizon/
unzip healthcheck.zip
cd /home/bizon/healthcheck/ultralytics
```

# Parameters to run the training 
```bash
python train_test.py --batch 8 --device 0 --epochs 60
```
# IPMI tool monitoring installation
```bash
sudo apt install ipmitool
sudo modprobe ipmi_si
sudo ipmitool sdr
chmod +x monitor.sh
```

# Fix for multi GPUs 

```
cd healthcheck/ultralytics
sudo vim setup_and_train.py
```

Add

```
def get_user_input():
    device_input = input("Please enter devices for training (e.g., 0 1 2): ")
    device = [int(d) for d in device_input.split()]
    batch = int(input("Please enter batch size (e.g., 8): "))
    epochs = int(input("Please enter number of epochs (e.g., 80): "))
    return batch, epochs, device

def modify_and_run_training(batch, epochs, device):
    with open("train_test_old.py", "r") as file:
        content = file.read()

    # Replace parameter values in the content
    content = content.replace('batch=8', f'batch={batch}')
    content = content.replace('epochs=80', f'epochs={epochs}')
    content = content.replace('device=[0,1]', f'device={device}')

    # Save the modified content
    with open("train_test_temp.py", "w") as file:
        file.write(content)

    # Execute the modified script
    import subprocess
    subprocess.run(["python3", "train_test_temp.py"])

if __name__ == "__main__":
    batch, epochs, device = get_user_input()
    modify_and_run_training(batch, epochs, device)
```

# GUI app 
```
# Start the environment:
conda activate testenv
# Run the gui
Python3 gui.py

# If permission issues:
sudo chown 777 config.json
sudo chmod 777 config.json
```





