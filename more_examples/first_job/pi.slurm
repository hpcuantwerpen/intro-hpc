#!/bin/bash

#SBATCH --ntasks=1 --cpus-per-task=1
#SBATCH --time=10:00
#SBATCH -A ap_course_hpc_intro
#SBATCH --partition=zen2

module purge
module load calcua/2025a
module load Python/3.13.1-GCCcore-14.2.0

python pi.py
