python "main.py" \
 --base configs/stable-diffusion/v1-finetune_unfrozen.yaml \
 -t \
 --actual_resume "model.ckpt" \
 --reg_data_root "/workspace/Dreambooth-Stable-Diffusion/outputs/txt2img-samples/samples/person_ddim" \
 -n meimei \
 --gpus 0, \
 --data_root "/workspace/Dreambooth-Stable-Diffusion/training_samples" \
 --max_training_steps 1600 \
 --class_word "person" \
 --no-test