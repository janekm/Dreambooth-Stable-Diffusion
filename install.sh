killall python

pip install lark piexif
apt -y update
apt -y install wget curl unzip vim screen

cd /workspace

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
./aws/install

cd /workspace
git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git webui

aws s3 cp s3://sd-models-1/wlop.ckpt models/Stable-diffusion/

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

sleep infinity