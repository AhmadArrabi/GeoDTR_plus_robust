#!/bin/bash

#SBATCH --partition=dggpu
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --gres=gpu:1
#SBATCH --mem=32G
#SBATCH --cpus-per-task=32
#SBATCH --time=01-23:59:59
#SBATCH --job-name=geodtr
#SBATCH --mail-user=aarrabi@uvm.edu
#SBATCH --mail-type=ALL
#SBATCH --output=/gpfs2/scratch/aarrabi/geodtr_plus/robust_aug_loss_mse_both.out 

export DATA_DIR="/gpfs2/scratch/xzhang31/CVUSA/dataset" 
export MODEL_PATH="/gpfs1/home/x/z/xzhang31/GeoDTR_plus/CVUSA_NP"

python train.py \
 --dataset CVUSA \
 --save_suffix="robust_loss_mse_both" \
 --data_dir=$DATA_DIR \
 --geo_aug strong \
 --sem_aug strong \
 --backbone="convnext" \
 --bottleneck \
 --no_polar \
 --verbose \
 --robust_aug="strong" \
 --robust_loss_mse \
 --robust_loss \
 --epochs=100 \
 --batch_size=16