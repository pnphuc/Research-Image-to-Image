#!/usr/bin/env bash
python distill.py --dataroot database/horse2zebra \
  --dataset_mode unaligned \
  --distiller inception \
  --gan_mode lsgan \
  --log_dir logs/cycle_gan/horse2zebra/inception/student/2p6B \
  --restore_teacher_G_path logs/cycle_gan/horse2zebra/inception/teacher/checkpoints/best_A_net_G_A.pth \
  --restore_pretrained_G_path logs/cycle_gan/horse2zebra/inception/teacher/checkpoints/best_A_net_G_A.pth \
  --restore_D_path logs/cycle_gan/horse2zebra/inception/teacher/checkpoints/best_A_net_D_A.pth \
  --real_stat_path real_stat/horse2zebra_B.npz \
  --nepochs 500 --nepochs_decay 500 \
  --teacher_netG inception_9blocks --student_netG inception_9blocks \
  --pretrained_ngf 64 --teacher_ngf 64 --student_ngf 20 \
  --ndf 64 \
  --num_threads 80 \
  --eval_batch_size 2 \
  --batch_size 80 \
  --gpu_ids 0,1,2,3 \
  --norm_affine \
  --norm_affine_D \
  --channels_reduction_factor 6 \
  --kernel_sizes 1 3 5 \
  --lambda_distill 1.0 \
  --lambda_recon 5 \
  --prune_cin_lb 16 \
  --target_flops 2.6e9 \
  --distill_G_loss_type ka
