demo checkpointing with DMTCP

- `counter.py` simple Python script simulating a long-running calculation that prints timestamps and step numbers.
- `run_dmtcp.slurm` job script that handles automatic checkpointing, __interrupting__ and restarting

1. submit `run_dmtcp.slurm`. No checkpoints exist, so clean start. Then interrupt (simulating a crash) after 35 seconds.
2. check `./ckpts` directory to see the generated memory snapshot files.
3. resubmit `run_dmtcp.slurm` to continue.
