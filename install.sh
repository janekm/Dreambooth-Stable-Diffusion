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

aws s3 cp s3://arn:aws:s3::296549613961:accesspoint/mf3qjau7cw8ey.mrap/testino1.ckpt /workspace/webui/models/Stable-diffusion

curl "https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz" -o "ngrok-v3-stable-linux-amd64.tgz"
tar xfvz ngrok-v3-stable-linux-amd64.tgz
./ngrok config add-authtoken ${NGROK_TOKEN}


cd /workspace/webui
mv ../stable-diffusion-webui/repositories .
mv ../stable-diffusion-webui/model.ckpt models/Stable-diffusion/

cd /workspace
git clone https://github.com/janekm/Dreambooth-Stable-Diffusion.git
cd Dreambooth-Stable-Diffusion
cp ../stable-diffusion-webui/models/Stable-diffusion/wlop.ckpt .
git clone https://github.com/djbielejeski/Stable-Diffusion-Regularization-Images-person_ddim.git
mkdir -p regularization_images/person_ddim
mv -v Stable-Diffusion-Regularization-Images-person_ddim/person_ddim/* regularization_images/person_ddim/ 

pip install pytorch-lightning==1.6.5
pip install test-tube
pip install -e git+https://github.com/CompVis/taming-transformers.git@master#egg=taming-transformers
pip install -e git+https://github.com/openai/CLIP.git@main#egg=clip
pip install pillow==9.0.1
pip install torchmetrics==0.6.0
pip install -qq diffusers["training"]==0.3.0 transformers ftfy
pip install captionizer



# python webui.py --port 3000 --listen --disable-safe-unpickle

sleep infinity