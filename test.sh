#!/bin/bash

#SBATCH --partition=dggpu
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --gres=gpu:1
#SBATCH --mem=16G
#SBATCH --cpus-per-task=8
#SBATCH --time=01-23:59:59
#SBATCH --job-name=geodtr
#SBATCH --mail-user=aarrabi@uvm.edu
#SBATCH --mail-type=ALL
#SBATCH --output=/gpfs2/scratch/aarrabi/geodtr_plus/%A_BOTH.out 

export DATA_DIR="/gpfs2/scratch/xzhang31" 
export MODEL_PATH="/gpfs2/scratch/aarrabi/geodtr_plus/1732016328_GeoDTR_CVUSA_convnext_False_robust_loss_mse_both"

python test.py --data_dir=$DATA_DIR \
 --model_path=$MODEL_PATH \
 --dataset CVUSA \
 --verbose \
 --no_polar \
 --backbone="convnext" \
 --fov=70 \
 --orientation="back"
       