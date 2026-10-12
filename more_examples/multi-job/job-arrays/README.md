## EXAMPLE 1: mapping task ID to a line in a configuration file

'parameter sweep': 
first create or generate a configuration file `params.txt`, where every line is a different set of parameters for the simulation.

```
#!/bin/bash
#SBATCH --job-name=param_sweep
#SBATCH --array=1-100%10     # Run 100 total tasks, max 10 concurrently
#SBATCH --output=logs/job_%A_%a.out

# Read line number $SLURM_ARRAY_TASK_ID from params.txt
PARAMS=$(sed -n "${SLURM_ARRAY_TASK_ID}p" params.txt)

# Run program with parameters from that line
python run_simulation.py $PARAMS
```

## EXAMPLE 2: batching/ chunking files

1k small files needed to be processed, named `data_file_<number>.csv`. You can batch them per 100.

```
#!/bin/bash
#SBATCH --array=0-9

# Process 100 files per array task
START_ID=$(( SLURM_ARRAY_TASK_ID * 100 ))
END_ID=$(( START_ID + 99 ))

for i in $(seq $START_ID $END_ID); do
    ./process_item "data_file_${i}.csv"
done
```
