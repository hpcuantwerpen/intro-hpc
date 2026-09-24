#!/bin/bash
#SBATCH --job-name=MPI-demo
#SBATCH -A ap_course_hpc_intro
#SBATCH --ntasks=128 --cpus-per-task=1
#SBATCH --mem-per-cpu=1g

module --force purge
module load calcua/2025a
module load vsc-tutorial/202510-intel-2025a

srun mpi_hello
