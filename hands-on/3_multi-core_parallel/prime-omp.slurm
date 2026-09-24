#!/bin/bash
#SBATCH --job-name prime-omp
#SBATCH -A ap_course_hpc_intro
#SBATCH --ntasks=1 --cpus-per-task=16

module --force purge
module load calcua/2025a
module load intel/2025a

# Compile (can be done on login-node as well)
icpx -qopenmp prime-omp.cpp -o prime_omp

# OpenMP variables
export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK
export OMP_PROC_BIND=true

./prime_omp > omp.out
