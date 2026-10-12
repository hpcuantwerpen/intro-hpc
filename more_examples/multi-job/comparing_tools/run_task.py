#!/usr/init/env python3
import os
import sys
import time
import socket

# 1. Received via Positional Arguments
task_id = sys.argv[1]
duration = float(sys.argv[2])

# 2. Received via Environment Variables (set by the job wrapper)
label = os.environ.get("TASK_LABEL", "Unlabeled")

node_name = socket.gethostname()
print(f"[{time.strftime('%X')}] Task {task_id} ('{label}') started on {node_name}")
time.sleep(duration)
print(f"[{time.strftime('%X')}] Task {task_id} finished successfully.")
