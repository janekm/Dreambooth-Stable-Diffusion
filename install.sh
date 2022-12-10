#!/bin/bash
echo "Container Started"
source /venv/bin/activate
killall python

pip install lark piexif
pip install gradio --upgrade
apt -y update
apt -y install wget curl unzip vim screen tmux

cd /workspace

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
./aws/install

cd /workspace
git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git webui

curl "https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz" -o "ngrok-v3-stable-linux-amd64.tgz"
tar xfvz ngrok-v3-stable-linux-amd64.tgz
./ngrok config add-authtoken ${NGROK_TOKEN}


cd /workspace/webui
mv ../stable-diffusion-webui/repositories .
mv ../stable-diffusion-webui/model.ckpt models/Stable-diffusion/
cd /workspace
git clone https://github.com/Stability-AI/stablediffusion.git /workspace/webui/repositories/stable-diffusion-stability-ai

cd /workspace/webui/models/Stable-diffusion/
wget https://raw.githubusercontent.com/lawfordp2017/diffusers/main/scripts/convert_diffusers_to_original_stable_diffusion.py
cp /workspace/webui/repositories/stable-diffusion-stability-ai/configs/stable-diffusion/v2-inference-v.yaml /workspace/webui/models/Stable-diffusion/768-v-ema.yaml
cd /workspace

pip install pytorch-lightning==1.6.5
pip install test-tube
pip install -e git+https://github.com/CompVis/taming-transformers.git@master#egg=taming-transformers
pip install -e git+https://github.com/openai/CLIP.git@main#egg=clip
pip install pillow==9.0.1
pip install torchmetrics==0.6.0
pip install -qq diffusers["training"]==0.3.0 transformers ftfy
pip install captionizer
pip install torchsde
pip install gradio==3.9
pip install safetensors
pip install open_clip_torch
apt -y install git-lfs
git lfs install

pip install bitsandbytes
pip install transformers==4.22.0
pip install accelerate==0.15.0
pip install git+https://github.com/huggingface/diffusers.git
pip install k_diffusion==0.0.12
pip install pillow==9.3.0

# python webui.py --port 3000 --listen --disable-safe-unpickle
cd /workspace/webui/repositories/k-diffusion/
git pull

cd /workspace/

aws s3 cp s3://sd-training-data/dataset.tgz .
aws s3 cp s3://sd-models-1/epoch120.tar .
# git clone https://huggingface.co/stabilityai/stable-diffusion-2-1

sleep infinity