# Overview

This is a re-implementation of the paper ["GeoDTR+: Toward generic cross-view geolocalization via geometric disentanglement"](https://arxiv.org/abs/2308.09624). We extend this work by making it adaptable to limited FOV and non-north-aligned input ground images. 

# Usage

## Prerequisites
1. numpy
2. Pytorch >= 1.13
3. torchvision >= 0.12
4. tqdm
5. scipy
6. PIL

## datasets

### CVUSA

- We obtain the permission of CVUSA dataset from the owner by submit the [MVRL Dataset Request Form](https://mvrl.cse.wustl.edu/datasets/cvusa/).
- Please refer to the repo: [https://github.com/viibridges/crossnet](https://github.com/viibridges/crossnet)

## Training

```bash
python train.py \
--dataset CVUSA \
--save_suffix GIVE_A_SAVING_NAME \
--data_dir PATH_TO_YOUR_DATASET \
--geo_aug strong \
--sem_aug strong \
--robust_aug strong \
--robust_loss_mse \
--robust_loss \
--backbone CHOOSE_BETWEEN_resnet_OR_convnext \
--bottleneck
```

Toggling `--cf` for counterfactual learning schema, `--mutual` for contrastive hard sample generation, `--no_polar` for disable polar transformation, `--verbose` for progressive bar.
`--robust_aug` applies random augmentation of chanign the FOV and alignment. `--robust_loss` and `--robust_loss_mse` are the triplet and MSE losses between the augmented ground image and original. 

This code will create a folder named by `--save_suffix` to store weights. To resume training you can set `--resume_from` by giving the folder name. All parameters will be set automatically.

## Testing

For testing on CVUSA and CVACT please use `python test.py --model_path MODEL_FOLDER --dataset CVUSA_OR_CVACT`. Toggle `--verbose` for progressive bar.

# Citation

```
@ARTICLE{10636837,
  author={Zhang, Xiaohan and Li, Xingyu and Sultani, Waqas and Chen, Chen and Wshah, Safwan},
  journal={IEEE Transactions on Pattern Analysis and Machine Intelligence}, 
  title={GeoDTR+: Toward Generic Cross-View Geolocalization via Geometric Disentanglement}, 
  year={2024},
  volume={},
  number={},
  pages={1-19},
  keywords={Feature extraction;Layout;Training;Correlation;Transformers;Data mining;Accuracy;Visual Geolocalization;Cross-view Geolocalization;Image Retrieval;Metric Learning},
  doi={10.1109/TPAMI.2024.3443652}}
  ```