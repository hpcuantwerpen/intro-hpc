#!/bin/bash
#SBATCH --job-name eat_disk
#SBATCH -A ap_course_hpc_intro
#SBATCH -t 10:00

module purge
module load calcua/2025a
module load vsc-tutorial/202510-intel-2025a

eat_disk
