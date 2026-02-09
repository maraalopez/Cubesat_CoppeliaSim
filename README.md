# Cubesat_CoppeliaSim 🚀

[![University](https://img.shields.io/badge/University-Alcalá-red)](https://www.uah.es)
[![Python](https://img.shields.io/badge/Python-3.x-blue)](https://www.python.org/)
[![Software](https://img.shields.io/badge/Simulation-CoppeliaSim-green)](https://www.coppeliarobotics.com/)

Attitude control is a critical subsystem in space missions, enabling satellite orientation and stabilization according to operational requirements for observation, communication, or navigation. Among various methods, reaction wheels provide an efficient and widely adopted solution for small and medium-sized satellites. Their operation relies on the principle of conservation of angular momentum: by accelerating or decelerating a wheel, a torque is generated that changes the satellite’s orientation.

Developed as part of the **Physics and Space Instrumentation** degree at the **Universidad de Alcalá**, this repository features a didactic model of an attitude control system based on reaction wheels, created using the **CoppeliaSim** simulation environment. 

---

## 📑 Table of Contents
- [Project Overview](#-project-overview)
- [Gamified Learning Levels](#-gamified-learning-levels)
- [Installation Guide](#-installation-guide)
- [User Manual](#-user-manual)
- [Alternative Interfaces & Future Work](#-alternative-interfaces--future-work)

---

## 🛰️ Project Overview
The model includes three orthogonally mounted reaction wheels, providing full three-axis control of the satellite’s attitude. 
* **Control Scheme:** A proportional-derivative (PD) controller adjusts wheel speeds in response to simulated angular deviations.
* **Visualization:** Interactive 3D visualization allows students to explore dynamic behavior and assess control strategies.
* **Documentation:** This repository serves as a complement to the article **"[Insert Article Name Here]"** included in the files.

## 🎮 Gamified Learning Levels
To make learning more engaging, the model is organized into three progressive "games":

1. **Joystick Control:** First contact with the model. Students learn to interact with the system through free movement of the joints.
2. **Detumbling:** The goal is to eliminate unwanted angular velocity.
   * *Level 1:* Target velocity is visible via joystick feedback.
   * *Level 2:* High difficulty—detumble the satellite by only observing the 3D model.
3. **Light Search:** Orient the satellite toward the Sun using an integrated camera sensor. This level uses keyboard input instead of a joystick.

---

## 🛠️ Installation Guide

### 1. CoppeliaSim
CoppeliaSim is required to open the 3D model. It was developed using the **Educational License**, available for download at:
🔗 [coppeliarobotics.com](https://www.coppeliarobotics.com/)

### 2. Python Environment
A Python interpreter is necessary for the control scripts.

#### **Windows**
1. Download the installer from [python.org](https://www.python.org/).
2. **Crucial:** During installation, check the box **"Add python.exe to PATH"**.
3. Verify installation in the terminal: `python --version`

#### **macOS**
Using Homebrew:
```bash
brew install python
python3 --version
```

#### **Linux**
```bash
sudo apt update
sudo apt install python3 python3-pip
python3 --version
```
### 3. Dependencies
The `pygame` library is required for joystick signal detection:

```Bash
pip install pygame
```
---

## 📖 User Manual
For the Python script to detect joystick or keyboard signals, the script's dialog box must remain in the foreground.

### Joystick Controls
Used for Joystick Control and Detumbling levels:
![Joystick](https://github.com/user-attachments/assets/aadec8d7-4505-4864-9d70-667d79a16cdc)

### Keyboard Controls
Used for the Light Search level:
![keyboard](https://github.com/user-attachments/assets/9e76d892-c848-4407-aa30-3e64bfd949b5)

---

## 🔗 Alternative Interfaces & Future Work
### MATLAB Integration
If you encounter issues with Python, an alternative approach using MATLAB is provided via the ZeroMQ API. The matlab folder contains the necessary files to connect with CoppeliaSim:
* `RemoteAPIClient.m`
* `RemoteAPIObject.m`
* `cbor.m`

### Future Implementations
* **Autonomous Software**: Developing a MATLAB-based autonomous search algorithm for the light-seeking game to center the light point automatically.
* **Image Processing** : An initial example of image processing is included in the folder (synchronousImageTransmission.m). The goal is to modify the control loop to implement autonomous searching software.

---

*Created for Universidad de Alcalá (UAH)*



