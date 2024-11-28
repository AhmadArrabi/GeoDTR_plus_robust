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
#SBATCH --output=/gpfs2/scratch/aarrabi/geodtr_plus/%A.out 

export DATA_DIR="/gpfs2/scratch/xzhang31" 
export MODEL_PATH="/gpfs1/home/x/z/xzhang31/GeoDTR_plus/CVUSA_NP"

python test.py --data_dir=$DATA_DIR --verbose --model_path=$MODEL_PATH --no_polar
       