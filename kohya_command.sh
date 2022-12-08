accelerate launch --num_cpu_threads_per_process 20 train_db_fixed.py \
    --v2 \
    --v_parameterization \
    --pretrained_model_name_or_path="/workspace/koh_data/train_out/epoch-000120" \
    --train_data_dir="/workspace/koh_data/train/" \
    --prior_loss_weight=1.0 \
    --output_dir="/workspace/koh_data/train_out/" \
    --resolution="768,768" \
    --train_batch_size=22 \
    --learning_rate="2e-6" \
    --max_train_steps=100000 \
    --xformers \
    --mixed_precision="bf16" \
    --save_every_n_epochs=20 \
    --logging_dir="/workspace/koh_data/train_log/" \
    --seed=494481440 \
    --lr_scheduler="constant_with_warmup" \
    --lr_warmup_steps=1000 \
    --wandb_project_name="bigtrain" \
    --log_images_every_n_epochs=2 \
    --log_image_base_checkpoint="/workspace/stable-diffusion-2" \
    --enable_bucket \
    --use_8bit_adam \
    --save_precision="bf16" \
    --stop_text_encoder_training=1 \
    --cache_latents

    --reg_data_dir="/workspace/koh_data/reg/" \


accelerate launch --num_cpu_threads_per_process 20 /workspace/kohya_diffusers_fine_tuning/script/fine_tune.py \
    --v2 \
    --pretrained_model_name_or_path="/workspace/stable-diffusion-2-1" \
    --in_json "/workspace/big_train_glamour_latents.json" \
    --train_data_dir="/workspace/webui/big_train_glamour_captioned/" \
    --output_dir="/workspace/koh_out" \
    --train_batch_size=4 \
    --dataset_repeats=1 \
    --learning_rate=5e-6 \
    --max_train_steps=200000 \
    --use_8bit_adam --xformers \
    --mixed_precision=bf16 \
    --save_every_n_epochs=2 \
    --seed=494481440 \
    --train_text_encoder \
    --wandb_project_name="glamour1" \
    --log_images_every_n_epochs=1