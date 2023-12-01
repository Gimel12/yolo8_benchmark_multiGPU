import sys
import json
import subprocess
from PyQt5.QtWidgets import QApplication, QWidget, QVBoxLayout, QLabel, QLineEdit, QPushButton

class TrainingGUI(QWidget):
    def __init__(self):
        super().__init__()
        self.training_process = None  # Holds the subprocess for training
        self.initUI()

    def initUI(self):
        layout = QVBoxLayout()

        # Batch size input
        self.batch_size_label = QLabel("Batch Size:")
        self.batch_size_input = QLineEdit(self)
        layout.addWidget(self.batch_size_label)
        layout.addWidget(self.batch_size_input)

        # Epochs input
        self.epochs_label = QLabel("Epochs:")
        self.epochs_input = QLineEdit(self)
        layout.addWidget(self.epochs_label)
        layout.addWidget(self.epochs_input)

        # Devices input
        self.devices_label = QLabel("Devices (comma-separated, e.g., 0,1,2):")
        self.devices_input = QLineEdit(self)
        layout.addWidget(self.devices_label)
        layout.addWidget(self.devices_input)

        # Save Settings Button
        self.save_button = QPushButton('Save Settings', self)
        self.save_button.clicked.connect(self.save_settings)
        layout.addWidget(self.save_button)

        # Start Training Button
        self.start_button = QPushButton('Start Training', self)
        self.start_button.clicked.connect(self.start_training)
        layout.addWidget(self.start_button)

        # Stop Training Button
        self.stop_button = QPushButton('Stop Training', self)
        self.stop_button.clicked.connect(self.stop_training)
        layout.addWidget(self.stop_button)

        self.setLayout(layout)
        self.setWindowTitle('Training Configuration')
        self.setGeometry(300, 300, 300, 200)

    def save_settings(self):
        settings = {
            "batch_size": int(self.batch_size_input.text()),
            "epochs": int(self.epochs_input.text()),
            "devices": [int(device.strip()) for device in self.devices_input.text().split(',')]
        }
        with open('config.json', 'w') as config_file:
            json.dump(settings, config_file, indent=4)

    def start_training(self):
        self.save_settings()  # Save settings before starting training
        if self.training_process is None:  # If training is not already started
            self.training_process = subprocess.Popen(["python", "train.py"])

    def stop_training(self):
        if self.training_process is not None:  # If there is a training process
            self.training_process.terminate()  # Send termination request
            self.training_process.wait()  # Wait for the process to terminate
            self.training_process = None

def main():
    app = QApplication(sys.argv)
    ex = TrainingGUI()
    ex.show()
    sys.exit(app.exec_())

if __name__ == '__main__':
    main()
