#!/bin/bash
ROOT=/home/lazye/Documents/ica/under-sea/models/PyTorchVideoCompression/DVC
export PYTHONPATH=$PYTHONPATH:$ROOT
CUDA_VISIBLE_DEVICES=0 python -u $ROOT/main.py --log loguvg.txt --testuvg --pretrain snapshot/2048.model --config config.json