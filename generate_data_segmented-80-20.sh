#!/bin/bash

#SBATCH --nodes 1
#SBATCH --ntasks 1
#SBATCH --cpus-per-task 2
#SBATCH --mem 16384
#SBATCH --time 23:59:59
#SBATCH --partition gpu
#SBATCH --gres=gpu:2
#SBATCH --partition=gpu
#SBATCH --output=create_data_distribution.out
#SBATCH --error=create_data_distribution.err
#SBATCH --job-name=PV-dists
#SBATCH --mail-user=shaurya.gaur@wur.nl
#SBATCH --mail-type=ALL

module load caffe
echo STARTING AT `date`


python create_db.py -b lmdb -s -r squash -c 3 -e jpg -C gzip -m lmdb/segmented-80-20/mean.binaryproto  lmdb/segmented-80-20/train.txt lmdb/segmented-80-20/train_db 256 256
python create_db.py -b lmdb -s -r squash -c 3 -e jpg -C gzip  lmdb/segmented-80-20/test.txt lmdb/segmented-80-20/test_db 256 256
