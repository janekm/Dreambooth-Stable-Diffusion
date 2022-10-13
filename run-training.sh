python "main.py" \
 --base configs/stable-diffusion/v1-finetune_unfrozen.yaml \
 -t \
 --actual_resume "guweiz1.ckpt" \
 --reg_data_root "/workspace/Dreambooth-Stable-Diffusion/regularization_images/person_ddim" \
 -n "gunslinger" \
 --gpus 0, \
 --data_root "/workspace/Dreambooth-Stable-Diffusion/training_samples" \
 --max_training_steps 1818 \
 --class_word "person" \
 --token "gunslinger" \
 --no-test