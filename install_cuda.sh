wget https://repo.anaconda.com/miniconda/Miniconda3-py310_22.11.1-1-Linux-x86_64.sh
bash Miniconda3-py310_22.11.1-1-Linux-x86_64.sh -b
source miniconda3/bin/activate
conda install -n base -c xformers -c pytorch -c nvidia/label/cuda-11.6.2 pytorch=1.13 pytorch-cuda=11.6 xformers
pip install opencv-python-headless
git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git
cd stable-diffusion-webui
git clone https://github.com/crowsonkb/k-diffusion.git repositories/k-diffusion
git clone https://github.com/CompVis/taming-transformers.git repositories/taming-transformers
git clone https://github.com/sczhou/CodeFormer.git repositories/CodeFormer
git clone https://github.com/Stability-AI/stablediffusion.git repositories/stable-diffusion-stability-ai
pip install open-clip-torch
pip install git+https://github.com/openai/CLIP.git
pip install triton
pip install fastapi