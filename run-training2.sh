python "main.py" \
 --base configs/stable-diffusion/v1-finetune_unfrozen.yaml \
 -t \
 --actual_resume "par_15_a.ckpt" \
 --reg_data_root "/workspace/Dreambooth-Stable-Diffusion/woman_unsplash_3500" \
 -n "lalisa" \
 --gpus 0, \
 --data_root "/workspace/Dreambooth-Stable-Diffusion/train6" \
 --max_training_steps 7373 \
 --no-test \
 --token "notoken"