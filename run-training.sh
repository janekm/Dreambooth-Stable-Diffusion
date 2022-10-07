git clone https://github.com/djbielejeski/Stable-Diffusion-Regularization-Images-person_ddim.git
mkdir -p regularization_images/person_ddim
mv -v Stable-Diffusion-Regularization-Images-person_ddim/person_ddim/* regularization_images/person_ddim/   
python "main.py" \
 --base configs/stable-diffusion/v1-finetune_unfrozen.yaml \
 -t \
 --actual_resume "enki.ckpt" \
 --reg_data_root "/workspace/Dreambooth-Stable-Diffusion/regularization_images/person_ddim" \
 -n "alina" \
 --gpus 0, \
 --data_root "/workspace/Dreambooth-Stable-Diffusion/training_samples" \
 --max_training_steps 2000 \
 --class_word "girl" \
 --token "alina" \
 --no-test