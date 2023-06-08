#!/usr/bin/env bash
python3 distill.py --dataroot database/maps \
  --distiller inception \
  --log_dir logs/pix2pix/map2sat/inception/student/4p6B \
  --restore_teacher_G_path logs/pix2pix/map2sat/inception/teacher/checkpoints/best_net_G.pth \
  --restore_pretrained_G_path logs/pix2pix/map2sat/inception/teacher/checkpoints/best_net_G.pth \
  --restore_D_path logs/pix2pix/map2sat/inception/teacher/checkpoints/best_net_D.pth \
  --real_stat_path real_stat/maps_A.npz \
  --nepochs 500 --nepochs_decay 1000 \
  --teacher_netG inception_9blocks --student_netG inception_9blocks \
  --pretrained_ngf 64 --teacher_ngf 64 --student_ngf 32 \
  --num_threads 80 \
  --eval_batch_size 2 \
  --batch_size 80 \
  --gpu_ids 0,1,2,3 \
  --norm batch \
  --norm_affine \
  --norm_affine_D \
  --norm_track_running_stats \
  --channels_reduction_factor 6 \
  --kernel_sizes 1 3 5 \
  --direction BtoA \
  --lambda_distill 1.3 \
  --prune_cin_lb 16 \
  --target_flops 4.6e9 \
  --distill_G_loss_type ka