#!/bin/bash

# Update package list and install necessary packages
apt update
apt -y install ocl-icd-opencl-dev
apt -y install nano
apt -y install htop
apt -y install nvtop
apt -y install cmake

# Clone the repository and build the project
git clone https://github.com/shanhaicoder/XENGPUMiner.git
cd XENGPUMiner
chmod +x build.sh
./build.sh

# Update the configuration file
sed -i 's/account = 0xDc0fB0865cb93EC9C4a22939a6A8972760F38FA4/account = 0xDc0fB0865cb93EC9C4a22939a6A8972760F38FA4/g' config.conf

# Install Python requirements
pip install -U -r requirements.txt

nohup python3 miner.py --gpu=true > miner.log 2>&1 &

nohup ./xengpuminer > xengpuminer.log 2>&1 &
nohup ./xengpuminer -d1 > xengpuminer.log 2>&1 &
nohup ./xengpuminer -d2 > xengpuminer.log 2>&1 &
nohup ./xengpuminer -d3 > xengpuminer.log 2>&1 &
nohup ./xengpuminer -d4 > xengpuminer.log 2>&1 &
nohup ./xengpuminer -d5 > xengpuminer.log 2>&1 &
nohup ./xengpuminer -d6 > xengpuminer.log 2>&1 &
nohup ./xengpuminer -d7 > xengpuminer.log 2>&1 &
