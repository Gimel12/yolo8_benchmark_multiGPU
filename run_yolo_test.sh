#!/bin/bash

#conda activate testenv

LOG_FILE="test_log.txt"
cd /home/bizon/healthcheck/ultralytics

#conda run -n testenv python train_test.py  | tee output.log

# Activate the Conda environment, run the command, and capture the output
{
    /home/bizon/anaconda3/etc/profile.d/conda.sh
    conda activate testenv
    python train_test.py

} | tee -a "$LOG_FILE"

# Deactivate the Conda environment
conda deactivate