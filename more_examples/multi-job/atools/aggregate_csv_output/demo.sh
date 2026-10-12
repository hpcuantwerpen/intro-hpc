#! /bin/bash

export SBATCH_ACCOUNT=ap_course_hpc_intro
module load atools/1.5.1-GCCcore-14.2.0

# Submitting the job. The --wait is only there for demo purposes, it makes sure the script waits before moving on.
sbatch --wait --array 1-100 demo.slurm

# Aggregating results of all completed jobs in a output-agr.csv using --mode csv
areduce -t 1-100 --pattern output-{t}.csv --out output-agr-csv.csv --mode csv
cat output-agr-csv.csv

