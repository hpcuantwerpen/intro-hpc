#!/usr/bin/env python3
import time

print(f"[{time.strftime('%X')}] Starting calculation...", flush=True)

for i in range(1, 61):
    print(f"[{time.strftime('%X')}] Processing iteration {i}/60", flush=True)
    time.sleep(1)

print(f"[{time.strftime('%X')}] Calculation finished!", flush=True)
