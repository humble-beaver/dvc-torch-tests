#!/bin/bash
#LOCAL_ROOT=/home/lazye/Documents/ica/under-sea/models/PyTorchVideoCompression/DVC
ROOT=/uts/models/dvc-torch
export PYTHONPATH=$PYTHONPATH:$ROOT
CUDA_VISIBLE_DEVICES=0 python -u $ROOT/main.py --generate_uts --pretrain snapshot/2048.model --config config.json --out_folder $ROOT/data/uts/results
