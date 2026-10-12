#!/bin/bash
#SBATCH --job-name=dmtcp_demo
#SBATCH --output=dmtcp_demo_%j.log
#SBATCH --time=00:02:00
#SBATCH -n 1 -c 1
#SBATCH -A ap_course_hpc_intro

module purge
module load calcua/2026.1
module load Python/3.14.2-GCCcore-15.2.0
module load DMTCP/4.2.0-GCCcore-15.2.0

# Checkpoint settings
export DMTCP_CHECKPOINT_DIR="./ckpts"
mkdir -p $DMTCP_CHECKPOINT_DIR

# Find the latest checkpoint image file, if any exists
LATEST_CKPT=$(ls -t "$DMTCP_CHECKPOINT_DIR"/ckpt_*.dmtcp 2>/dev/null | head -n 1)

if [ -n "$LATEST_CKPT" ]; then
    echo "=== FOUND CHECKPOINT: Resuming calculation ==="
    # Resume directly from the latest checkpoint image
    dmtcp_restart --interval 10 "$LATEST_CKPT"

else
    echo "=== NO CHECKPOINT FOUND: Starting fresh calculation ==="
    # Launch application under DMTCP with automatic checkpoints every 10 seconds.
    # dmtcp_launch automatically creates and manages its own coordinator.
    dmtcp_launch --interval 10 --ckptdir "$DMTCP_CHECKPOINT_DIR" python3 counter.py &
    APP_PID=$!

    # Let it run for 35 seconds (allowing ~2-3 automatic checkpoints to occur)
    sleep 35

    echo "=== [DEMO INTERACTION] Simulating crash ==="
    kill -9 $APP_PID
fi
