#!/bin/bash
#SBATCH --ntasks=1 --cpus-per-task=1
#SBATCH --mem-per-cpu=512m
#SBATCH --time=10:00

module --force purge
module load calcua/2025a 
module load atools/1.5.1

# Variables (with names from the header of the data.csv) are set with values of the row (in data.csv) corresponding to the array ID of this job
source <(aenv --data data.csv)

# Run script 'weather' with the variables as arguments
./weather -t $temperature -p $pressure -v $volume

