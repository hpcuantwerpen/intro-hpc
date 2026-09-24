#!/bin/bash
#SBATCH --job-name prime-mpi
#SBATCH -A ap_course_hpc_intro
#SBATCH --ntasks=16 --cpus-per-task=1

module --force purge
module load calcua/2025a
module load intel/2025a

# Compile (can be done on login-node as well)
mpiicpx prime-mpi.cpp -o prime_mpi

# mpirun -n $SLURM_NTASKS prime_mpi
srun -n $SLURM_NTASKS prime_mpi > mpi.out
