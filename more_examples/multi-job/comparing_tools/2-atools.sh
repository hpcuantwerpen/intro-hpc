#!/bin/bash

module load atools/1.5.1-GCCcore-14.2.0
sbatch --array $(arange --data parameters.csv) 2-atools.slurm
