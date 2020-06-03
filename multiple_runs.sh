#!/bin/bash
mkdir print_logs

MODEL=resnet

echo "RUN 0 - 8"
nohup ./run.sh 0 8 0 $MODEL &
sleep 1

echo "RUN 8 - 16"
nohup ./run.sh 8 16 0 $MODEL &
sleep 1

echo "RUN 16 - 24"
nohup ./run.sh 16 24 0 $MODEL &
sleep 1

echo "RUN 24 - 32"
nohup ./run.sh 24 32 0 $MODEL &
sleep 1

echo "RUN 32 - 40"
nohup ./run.sh 32 40 0 $MODEL &
sleep 1

echo "RUN 40 - 48"
nohup ./run.sh 40 48 1 $MODEL &
sleep 1

echo "RUN 48 - 56"
nohup ./run.sh 48 56 1 $MODEL &
sleep 1

echo "RUN 56 - 64"
nohup ./run.sh 56 64 1 $MODEL &
sleep 1

echo "RUN 64 - 72"
nohup ./run.sh 64 72 1 $MODEL &
sleep 1

echo "RUN 72 - 81"
nohup ./run.sh 72 81 1 $MODEL &
sleep 1
