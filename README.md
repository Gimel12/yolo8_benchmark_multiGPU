# Installing the conda environment 
```bash
cd /home/bizon/
conda env create -f environment.yml
conda activate testenv
```

# Download the data
```bash
wget https://www.dropbox.com/s/2x0qzq5q0wq0y5o/data.zip # replace the link with the correct one
unzip data.zip
```

# Run the code
```bash
./run_yolo_test.sh
```
