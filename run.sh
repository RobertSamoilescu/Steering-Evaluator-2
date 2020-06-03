#!/bin/bash
BEGIN=$1
END=$2
DEVICE=$3
MODEL=$4

CUDA_VISIBLE_DEVICES=$DEVICE python3 test.py \
	--begin $BEGIN \
	--end $END \
	--model $MODEL \
	--use_speed \
	--split_path scene_splits/test_scenes.txt\
	--data_path raw_dataset\
	> "print_logs/"$MODEL"_"$BEGIN"_"$END".txt" 2>&1
