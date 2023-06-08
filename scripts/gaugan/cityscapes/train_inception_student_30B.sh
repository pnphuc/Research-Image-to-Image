#!/usr/bin/env bash
python distill.py --dataroot database/cityscapes-origin \
  --distiller spade \
  --log_dir logs/gaugan/cityscapes/inception/student/30B \
  --restore_teacher_G_path logs/gaugan/cityscapes/inception/teacher/checkpoints/best_net_G.pth \
  --restore_pretrained_G_path logs/gaugan/cityscapes/inception/teacher/checkpoints/best_net_G.pth \
  --restore_D_path logs/gaugan/cityscapes/inception/teacher/checkpoints/best_net_D.pth \
  --pretrained_netG inception_spade \
  --teacher_netG inception_spade --student_netG inception_spade \
  --real_stat_path real_stat/cityscapes_A.npz \
  --drn_path drn-d-105_ms_cityscapes.pth \
  --cityscapes_path database/cityscapes-origin \
  --table_path datasets/table.txt \
  --gpu_ids 0,1 --load_in_memory --no_fid \
  --teacher_ngf 64 --student_ngf 48 \
  --teacher_norm_G spadesyncbatch3x3 --student_norm_G spadesyncbatch3x3 \
  --batch_size 16 \
  --num_threads 16 \
  --nepochs 100 --nepochs_decay 100 \
  --channels_reduction_factor 6 \
  --kernel_sizes 1 3 5 \
  --lambda_distill 0.5 \
  --target_flops 3e10 \
  --prune_cin_lb 16 \
  --distill_G_loss_type ka
